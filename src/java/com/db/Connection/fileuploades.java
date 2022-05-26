/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.db.Connection;

import com.oreilly.servlet.MultipartRequest;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
 
@WebServlet("/fileuploades")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class fileuploades extends HttpServlet {
     File file;
    final String filepath = "P:/";
    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/secure_cloud_data";
    private String dbUser = "root";
    private String dbPass = "root";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
               
         
        
         
        try {
        Calendar cal = Calendar.getInstance();
        MultipartRequest m = new MultipartRequest(request, filepath);
         File file = m.getFile("filess");
        String filenames = file.getName().toLowerCase();
            SimpleDateFormat format = new SimpleDateFormat("HH:mm dd/MM/yyyy");
            String date= format.format(cal.getTime());
          HttpSession ses = request.getSession();
          String ownername = ses.getAttribute("oname").toString();
      String privakey=request.getParameter("privakey");
      String filename=request.getParameter("filename");
      String caption=request.getParameter("caption");
      Connection conn = null; 
    String message = null; 
       DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
      
    InputStream inputStream = null;

    Part filePart = request.getPart("filess");
    if (filePart != null) {

        System.out.println(filePart.getName());
        System.out.println(filePart.getSize());
        System.out.println(filePart.getContentType());

        inputStream = filePart.getInputStream();
    }
   

    
     
    try {
 BufferedReader br = null;
            StringBuilder sb = new StringBuilder();

            String line;
            

                    br = new BufferedReader(new FileReader(filepath+filename));
                    while ((line = br.readLine()) != null) {
                            sb.append(line);
                    }
                    String content=sb.toString();
                    String connn=content;
                    System.out.println("************"+sb.toString());
               //storing encrypted file
        FileWriter fw=new FileWriter(file);
        fw.write(connn);
        fw.close();
        System.out.println("string Buffer"+connn); 
           
       
             boolean status=new Ftpcon().upload(file);
        
        if(status){
        String sql = "INSERT INTO fileupload (privateky,filename,fcaption,filess,dates,owname) values (?,?,?,?,?,?)";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, privakey);
        statement.setString(2,filename);
        statement.setString(3, caption);
        statement.setString(5, date);
        statement.setString(6, ownername);
        
        if (inputStream != null) {
            statement.setBlob(4, inputStream);
        }
        int row = statement.executeUpdate();
        if (row > 0) {
            response.sendRedirect("owfileupload.jsp?fmsg=Success");
            
            message = " Regiatration saved into database";
        }
        else{
            response.sendRedirect("owfileupload.jsp?fmsgg=Failed");
             message = " Failed saved into database";
        }
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    } 
} catch (SQLException ex) {
            Logger.getLogger(fileuploades.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
}