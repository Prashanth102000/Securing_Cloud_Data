<%-- 
    Document   : keygenerate2
    Created on : May 9, 2017, 2:48:15 PM
    Author     : java1
--%>

<%@page import="com.db.Connection.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Random"%>
<%
String s="pavi";
session.setAttribute("key1", s);
String timkey1=request.getParameter("key1");
String timekey2=request.getParameter("key2");
String timekey3=request.getParameter("key3");
String timekey4=request.getParameter("key4");
String timekey5=request.getParameter("key5");
String timekey6=request.getParameter("key6");

List<String> list = new ArrayList<String>();
list.add(timkey1);
list.add(timekey2);
list.add(timekey3);
list.add(timekey4);
list.add(timekey5);
list.add(timekey6);
String random = list.get(new Random().nextInt(list.size()));
System.out.println("**************"+random);
String string = random;
String[] parts = string.split("T");
String part1 = parts[0]; // 004-
String part2 = parts[1]; // 034556


 HttpSession ses = request.getSession();
String uid = ses.getAttribute("gnid").toString();
    Connection con = null;
    Statement st = null;
    Statement st1 = null;
    ResultSet rs = null;
    try {
       con = DbConnection.getConnection();
        st = con.createStatement();
        rs = st.executeQuery("select * from fileupload where id='" + uid + "'");
        if (rs.next()) {
//            String skey=rs.getString("ownerkeyss");
//            String omailid=rs.getString("omailid");
            st1 =con.createStatement();
            int i = st1.executeUpdate("update fileupload set statuss='Generated' , ftimekey='"+part1+"' where id='" + uid + "'");
            if (i != 0) {
               
                response.sendRedirect("owfiledet.jsp?amsg=success");
            } else {
                response.sendRedirect("owfiledet.jsp?msgg=failed");
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
System.out.println("+++++++++++++++"+part1);
System.out.println("+++++++++++++++"+part2);
%>
<script>
    
    
    </script>
    