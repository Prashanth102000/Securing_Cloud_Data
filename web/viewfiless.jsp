<%@page import="com.db.Connection.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Securing Cloud Data under Key Exposure</title> 
        <meta name="keywords" content="" />
        <meta name="description" content="" />
         
        <link href="tooplate_style3.css" rel="stylesheet" type="text/css" />
            </head>
    <body> 
        <style> 

            .inputs {
                background: #BCEBFD;
                font-size: 0.9rem;
                -moz-border-radius: 3px;
                -webkit-border-radius: 3px;
                border-radius: 3px;
                border: none;
                padding: 10px 10px;
                width: 200px;
                margin-bottom: 20px;
                box-shadow: inset 0 2px 3px rgba( 0, 0, 0, 0.1 );
                clear: both;
            }

            .inputs:focus {
                background: #fff;
                box-shadow: 0 0 0 3px #72D0F4, inset 0 2px 3px rgba( 0, 0, 0, 0.2 ), 0px 5px 5px rgba( 0, 0, 0, 0.15 );
                outline: none;
            }
            .inputss {
                background: #BCEBFD;
                font-size: 0.9rem;
                -moz-border-radius: 3px;
                -webkit-border-radius: 3px;
                border-radius: 3px;
                border: none;
                padding: 10px 10px;
                width: 200px;
                margin-bottom: 20px;
                box-shadow: inset 0 2px 3px rgba( 0, 0, 0, 0.1 );
                clear: both;
            }

            .inputss:focus {
                background: #fff;
                box-shadow: 0 0 0 3px #72D0F4, inset 0 2px 3px rgba( 0, 0, 0, 0.2 ), 0px 5px 5px rgba( 0, 0, 0, 0.15 );
                outline: none;
            }
            .button {
                background-color:   		#008080; /* Green */
                border: none;
                color: white;
                padding: 10px 27px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
            }
        </style> 

        <div id="tooplate_header_wrapper">

            <div id="tooplate_header"><br></br>
                <center><h1 style="font-family: Copperplate Gothic Bold;color:#3CB371 ">Securing Cloud Data under Key Exposure</h1></center>



                <div class="cleaner_h10"></div>

                <div id="tooplate_menu">

                    <div id="home_menu"><a href="#"></a></div>

                    <ul>
                 <li><a href="index.jsp">Home</a></li>
                <li><a href="ownerhome.jsp" class="current">Owner_Details</a></li>
                <li><a href="owfileupload.jsp">File_Upload</a></li>
                 <li><a href="owfiledet.jsp">File_Details</a></li>
            </ul>    	

                </div> <!-- end of tooplate_menu -->

            </div>	  
        </div> <!-- end of header_wrapper -->

        <div id="tooplate_middle_wrapper1">
            <div id="tooplate_middle_wrapper2">
                <div id="tooplate_middclouduser">



                </div>
            </div>
        </div>
        <br></br>
        <div class="container profile" class="page-wrapper" style="border-style:   groove; border-width: 10px;border-color: #E9967A;height:  400px;width: 920px;margin-left: 250px;overflow: auto" >
            <center><h1 style="font-family: Copperplate Gothic Bold;color:#3CB371 ">File Details</h1></center>
            <div style=" margin-left: 10px;background:   #FAEBD7;width: 900px" >

                <table border="2" style="text-align: center; margin-left: 0px; border-color: black">
                    <tr>
                        <th style="text-align: center;width: 200px; font-size: 16px; color: brown">OWNER</th>
                        <th style="text-align: center;width: 200px; font-size: 16px; color: brown">FILENMAE</th>
                        <th style="text-align: center;width: 200px;  font-size: 16px; color: brown">CAPTION</th>
                        <th style="text-align: center;width: 200px;  font-size: 16px; color: brown">VIEWS</th>
                        <th style="text-align: center;width: 200px;  font-size: 16px; color: brown">DOWNLAOD</th>
                       
                    </tr>
                    <tr>
                        <%

                           String filename=request.getParameter("filename");

                            Connection con = null;
                            Statement st = null;
                            ResultSet rs = null;
                            try {
                               String keygenerate="Generated";
                                con = DbConnection.getConnection();
                                st = con.createStatement();
                                rs = st.executeQuery("select * from fileupload where (filename='"+filename+"' or fcaption='"+filename+"') and (statuss='"+keygenerate+"') ");
                                while (rs.next()) {
                        %>
                        <td style="font-size: 16px"><br><%=rs.getString("owname")%></td>  
                        <td style="font-size: 16px"><br><%=rs.getString("filename")%></td>  
                        <td style="font-size: 16px"><br><%=rs.getString("fcaption")%></td>   
                         <td><a href="userviews.jsp?<%=rs.getString("id")%>" style="text-decoration: none;color:blue;font-size: 20px">view</a></td>
                           <td><a href="download2?<%=rs.getString("id")%>" style="text-decoration: none;color:blue;font-size: 20px">Download</a></td>



                    </tr>
                    <%
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>
                </table>
                <br>



            </div>
            <div class="cleaner"></div>

            <div id="tooplate_footer_wrapper">

                <div id="tooplate_footer">



                </div> <!-- end of tooplate_footer -->

            </div> 

    </body>
</html>
