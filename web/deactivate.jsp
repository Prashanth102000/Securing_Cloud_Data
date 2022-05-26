
<%@page import="com.db.Connection.DbConnection"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String uid = request.getQueryString();
    System.out.println("The User ID in Deactivate "+uid);
    Connection con = null;
    Statement st = null;
    Statement st1 = null;
    ResultSet rs = null;
    try {
        con = DbConnection.getConnection();
        st = con.createStatement();
        rs = st.executeQuery("select * from userreg where id='" + uid + "'");
        if (rs.next()) {
            st1 = con.createStatement();
            int i = st1.executeUpdate("update userreg set activate='No' where id='" + rs.getString("id") + "'");
            if (i != 0) {
//                Mail m = new Mail();
//                m.sendMail("Name :"+rs.getString("name")+"\n\tYou are deactivated by CloudArmor", "KK", rs.getString("email"));
                response.sendRedirect("adminhome.jsp?dmsg=success");
            } else {
                response.sendRedirect("adminhome.jsp?dsgg=failed");
            }
        }
        else
        {
            out.println("Error");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>