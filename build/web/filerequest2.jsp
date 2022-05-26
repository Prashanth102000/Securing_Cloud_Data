
<%@page import="java.util.Random"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="MAILSEND.mail"%>
<%@page import="com.db.Connection.DbConnection"%>
<%@page import="java.sql.ResultSet"%>

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
        rs = st.executeQuery("select * from request where id='" + uid + "'");
        if (rs.next()) {
            Random skey = new SecureRandom();
                int skeyl = 15;
                String auto = "1010010111001011010010000010110100101001001010101";
                String key = "";
                for (int i = 0; i < skeyl; i++) {
                    int index = (int) (skey.nextDouble() * auto.length());
                    key += auto.substring(index, index + 1);
                                       }
                    mail m = new mail();
                String subb="Search_key";
                m.secretMail(key,subb, rs.getString("mailid"));
            st1 =con.createStatement();
            int j = st1.executeUpdate("update request set status='respond',sekey='"+key+"' where id='" + uid + "'");
            if (j != 0) {
                
                response.sendRedirect("filerequest.jsp?amsg=success");
            } else {
                response.sendRedirect("filerequest.jsp?msgg=failed");
            
                     }
                               }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>