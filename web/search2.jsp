<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.db.Connection.DbConnection"%>
<%



 HttpSession ses = request.getSession();
String uname = ses.getAttribute("uname").toString();
String unmail = ses.getAttribute("unmail").toString();
String requestt="waiting";
 Connection con = null;
    Statement st = null;
con = DbConnection.getConnection();
                    st = con.createStatement();
 int i = st.executeUpdate("insert into request (usrename,mailid,status) values ('" + uname + "','" + unmail+ "','" + requestt + "')");
                    if (i != 0) {

                        response.sendRedirect("search1.jsp?msg=success");
                    } else {
                        response.sendRedirect("search1.jsp?msgg=failed");
                    }


%>