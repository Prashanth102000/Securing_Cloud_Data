
<%@page import="MAILSEND.mail"%>
<%@page import="com.db.Connection.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String uid = request.getQueryString();
    Connection con = null;
    Statement st = null;
    Statement st1 = null;
    ResultSet rs = null;
    try {
       con = DbConnection.getConnection();
        st = con.createStatement();
        rs = st.executeQuery("select * from userreg where id='" + uid + "'");
        if (rs.next()) {
            String skey=rs.getString("clousigkey");
            st1 =con.createStatement();
            int i = st1.executeUpdate("update userreg set activate='Yes' where id='" + uid + "'");
            if (i != 0) {
                mail m = new mail();
                String sub="User_Signature_key";
                m.secretMail(skey,sub, rs.getString("mailid"));
                response.sendRedirect("adminhome.jsp?amsg=success");
            } else {
                response.sendRedirect("adminhome.jsp?msgg=failed");
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>