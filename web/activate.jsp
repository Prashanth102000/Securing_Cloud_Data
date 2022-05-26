
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
        rs = st.executeQuery("select * from oreg where id='" + uid + "'");
        if (rs.next()) {
            String skey=rs.getString("ownerkeyss");
            String omailid=rs.getString("omailid");
            st1 =con.createStatement();
            int i = st1.executeUpdate("update oreg set status='Yes' where id='" + uid + "'");
            if (i != 0) {
                mail m = new mail();
                String sub="Owner_Signature_key";
                m.secretMail(skey,sub, omailid);
                response.sendRedirect("adowdetails.jsp?amsg=success");
            } else {
                response.sendRedirect("adowdetails.jsp?msgg=failed");
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>