/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.db.Connection;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class download2 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           
            
            String fname = null;
            InputStream is = null;

            Connection con =  DbConnection.getConnection();;
            Statement st = con.createStatement();
           

           

           
            String id = request.getQueryString();
             
           
            ResultSet rt = st.executeQuery("select * from fileupload where id='" + id + "'");
            
            if (rt.next()) {
                fname = rt.getString("filename");
               
                

                is = (InputStream) rt.getAsciiStream("filess");
            } else {
                out.println("error while retreiving data");

            }

            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            String temp = null;
            String tt=null;
            StringBuffer sb = new StringBuffer();
            while ((temp = br.readLine()) != null) {
                sb.append(temp);
               
            }
            String content = (sb.toString());
            
            
              
            
            System.out.println("content content:" + content);
            response.setHeader("Content-Disposition", "attachment;filename=\"" + fname + "\"");
            out.write(content);



            Calendar cal = Calendar.getInstance();
            DateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            String time = dateformat.format(cal.getTime());
            System.out.println("download time:" + time);
            

//            st1.executeUpdate("insert into download(filename,username,time)values('" + fname + "','" + uname + "','" + time + "')");


        } catch (Exception e) {
//            out.println(e);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
