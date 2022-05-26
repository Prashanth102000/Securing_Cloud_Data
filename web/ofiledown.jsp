<%@page import="MAILSEND.mail"%>
<%@page import="com.db.Connection.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
Connection con = null;
    Statement st = null;
    Statement st1 = null;
    ResultSet rs = null;
    try {
        String idd=request.getQueryString();
       con = DbConnection.getConnection();
        st = con.createStatement();
        rs = st.executeQuery("select * from fileupload where id='" + idd + "'");
        if (rs.next()) {
            
            session.setAttribute("fdowid", rs.getString("id"));
            String skey=rs.getString("ftimekey");
            HttpSession ses = request.getSession();
String omailid = ses.getAttribute("sssemail").toString();
 mail m = new mail();
        String sub="Filekey";
    m.secretMail(skey, sub, omailid);
        response.sendRedirect("ownerfiledown.jsp?msg=success");    
        }
        
               else{
            response.sendRedirect("fileview1.jsp?msg=success");  
               }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>