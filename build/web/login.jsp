<%@page import="MAILSEND.mail"%>
<%@page import="sun.misc.BASE64Encoder"%>
<%@page import="java.security.Signature"%>
<%@page import="java.security.KeyPair"%>
<%@page import="java.security.KeyPairGenerator"%>
<%@page import="com.db.Connection.signaturegeneration"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.UUID"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.db.Connection.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>

<%
    Connection con = null;
    Statement st = null;
    Statement st1 = null;
    Statement st2 = null;
    Statement st3 = null;
    ResultSet rs = null;
    ResultSet rs1 = null;


    String name = request.getParameter("name");
    String pass = request.getParameter("pass");
    String Eamil = request.getParameter("email");
    String Gender = request.getParameter("gen");
    String phone = request.getParameter("phone");
    String Country = request.getParameter("location");

       DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd G 'at' HH:mm:ss ");
                Date date = new Date();
                String reg_time = dateFormat.format(date);
                String Statuss="yes";
   
    
    System.out.println("User Details" + name + pass + Eamil + Gender + Eamil + phone + Country);
    

    int status = Integer.parseInt(request.getParameter("status"));
    try {
        con = DbConnection.getConnection();
        st = con.createStatement();
        st1 = con.createStatement();
        st2 = con.createStatement();
        st3 = con.createStatement();
        switch (status) {
            case 1:
                
                try {
                     Random skey = new SecureRandom();
                int skeyl = 10;
                String auto = "ABCEDFGHIJKLMNOPQRSTUVWXYXabcdefghijklmnopqrstuvwxyz";
                String key = "";
                for (int i = 0; i < skeyl; i++) {
                    int index = (int) (skey.nextDouble() * auto.length());
                    key += auto.substring(index, index + 1);
                                       }
                    rs = st.executeQuery("select * from oreg where (ousernmae='" + name + "' AND opass='" + pass + "') ");
                   
                    if (rs.next()) {
                        String idd=rs.getString("id");
                         rs1 = st1.executeQuery("select * from oreg where (status='" + Statuss + "' and id='"+idd+"' ) ");
                        if(rs1.next()){
                            String oid=rs1.getString("id");
                            String owbnersna=rs1.getString("ousernmae");
                            session.setAttribute("owwid", oid);
                            String omailid=rs1.getString("omailid");
                            session.setAttribute("oname", owbnersna);
                            String sub="Private_Key";
                            mail m = new mail();
                            m.secretMail(key, sub, omailid);


    int j = st2.executeUpdate("update oreg set lotppkey = '" + key + "' where id = '" + oid + "'");
    if (j != 0) {
        String ouuid=rs1.getString("id");
                            
                            session.setAttribute("ouwwid", ouuid);
        session.setAttribute("sssname", rs.getString("ousernmae"));
                        session.setAttribute("sssemail", rs1.getString("omailid"));
                        
                        response.sendRedirect("authocatonkey.jsp?msg=success");
    } else {
        response.sendRedirect("ownerlogin.jsp?msgg=Error");
    }
                            
                        }
                                               else{
                            response.sendRedirect("ownerlogin.jsp?msg=failedd");
                                               }
                        
                    } else {
                        response.sendRedirect("ownerlogin.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 2:
                try {
                     Random skey = new SecureRandom();
                int skeyl = 10;
                String auto = "ABCEDFGHIJKLMNOPQRSTUVWXYXabcdefghijklmnopqrstuvwxyz";
                String key = "";
                for (int i = 0; i < skeyl; i++) {
                    int index = (int) (skey.nextDouble() * auto.length());
                    key += auto.substring(index, index + 1);
                                       }
                    rs = st.executeQuery("select * from userreg where (username='" + name + "' AND password='" + pass + "') ");
                   
                    if (rs.next()) {
                        String idd=rs.getString("id");
                         rs1 = st1.executeQuery("select * from userreg where (activate='" + Statuss + "' and id='"+idd+"' ) ");
                        if(rs1.next()){
                            String uuid=rs1.getString("id");
                            String owbnersna=rs1.getString("username");
                            session.setAttribute("uwwid", uuid);
                            String omailid=rs1.getString("mailid");
                            session.setAttribute("uname", owbnersna);
                            session.setAttribute("unmail", omailid);
                            String sub="User_Private_Key";
                            mail m = new mail();
    m.secretMail(key, sub, omailid);


    int j = st2.executeUpdate("update userreg set ottpkey = '" + key + "' where id = '" + uuid + "'");
    if (j != 0) {
        session.setAttribute("ussname", rs1.getString("username"));
                        session.setAttribute("ussemail", rs1.getString("mailid"));
                        
                        response.sendRedirect("authocation.jsp?msg=success");
    } else {
        response.sendRedirect("userlogin.jsp?msgg=Error");
    }
                            
                        }
                                               else{
                            response.sendRedirect("userlogin.jsp?msg=failedd");
                                               }
                        
                    } else {
                        response.sendRedirect("userlogin.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 3:

                try {
                    con = DbConnection.getConnection();
                    st = con.createStatement();
                    signaturegeneration sig =new signaturegeneration();
                   
                  KeyPairGenerator kpg = KeyPairGenerator.getInstance("RSA");
    kpg.initialize(550);
    KeyPair keyPair = kpg.genKeyPair();

    byte[] data = "test".getBytes("UTF8");

    Signature sigg = Signature.getInstance("MD5WithRSA");
    sigg.initSign(keyPair.getPrivate());
    sigg.update(data);
    byte[] signatureBytes = sigg.sign();
    System.out.println("Singature:" + new BASE64Encoder().encode(signatureBytes));
    String  segnaturee= new BASE64Encoder().encode(signatureBytes).toString();
    

    sigg.initVerify(keyPair.getPublic());
    sigg.update(data);

    System.out.println(sigg.verify(signatureBytes));
    
    Statement st12 = con.createStatement();
    
    String sql12 ="select * from userreg where username ='" + name + "' or mailid ='" + Eamil + "' or phone='" + phone + "'"; 
    
    ResultSet rs12 = st12.executeQuery(sql12);
    if(!rs12.next()){
                    int i = st.executeUpdate("insert into userreg(username, password, mailid, locaton, phone, gender,regdata,clousigkey) values ('" + name + "','" + pass + "','" + Eamil + "','" + Country + "','" + phone + "','" + Gender + "','" +reg_time + "','" +segnaturee + "')");
                    if (i != 0) {

                        response.sendRedirect("userregi.html?msg=success");
                    }
    }else {
                        response.sendRedirect("userregi.html?msgg=failed");
                    }
                } catch (Exception ex) {
                    response.sendRedirect("index.jsp?msggg=failed");
                }
                break;
            case 4:
                try {
                    if (name.equalsIgnoreCase("admin") && pass.equalsIgnoreCase("admin")) {
                        response.sendRedirect("adminhome.jsp?msg=success");
                    } else {
                        response.sendRedirect("adminlogin.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 5:
                try {
                    con = DbConnection.getConnection();
                    st = con.createStatement();
                    
                    KeyPairGenerator kpg = KeyPairGenerator.getInstance("RSA");
    kpg.initialize(550);
    KeyPair keyPair = kpg.genKeyPair();

    byte[] data = "test".getBytes("UTF8");

    Signature sigg = Signature.getInstance("MD5WithRSA");
    sigg.initSign(keyPair.getPrivate());
    sigg.update(data);
    byte[] signatureBytes = sigg.sign();
    System.out.println("Singature:" + new BASE64Encoder().encode(signatureBytes));
    String  segnaturee= new BASE64Encoder().encode(signatureBytes).toString();
    

    sigg.initVerify(keyPair.getPublic());
    sigg.update(data);

    System.out.println(sigg.verify(signatureBytes));
    Statement st13 = con.createStatement();
    
    String sql13 ="select * from oreg where ousernmae ='" + name + "' or omailid ='" + Eamil + "' or ophone='" + phone + "'"; 
    
    ResultSet rs13 = st13.executeQuery(sql13);
    if(!rs13.next()){
    
                    int i = st.executeUpdate("insert into oreg (ousernmae,opass, omailid, olocation, ophone, ogender,regdata,ownerkeyss) values ('" + name + "','" + pass + "','" + Eamil + "','" + Country + "','" + phone + "','" + Gender + "','" +reg_time + "','" +segnaturee + "')");
                    if (i != 0) {

                        response.sendRedirect("ownerregister.html?msg=success");
                    }
    }
    else {
                        response.sendRedirect("ownerregister.html?msgg=failed");
                    }
                } catch (Exception ex) {
                    response.sendRedirect("index.jsp?msggg=failed");
                }
                break;
            case 6:
                try {
                    String sigk=request.getParameter("signature");
                    String priva=request.getParameter("privates");
                    System.out.println("sigk"+sigk);
                    System.out.println("sigk"+priva);
                    rs = st3.executeQuery("select * from oreg where (ownerkeyss='"+sigk+"' and lotppkey ='"+priva+"' ) ");
                    if (rs.next()) {
                        String  privateekey=rs.getString("lotppkey");
                        session.setAttribute("privakey", privateekey);
                        response.sendRedirect("ownerhome.jsp?msg=success");
                    } else {
                        response.sendRedirect("authocatonkey.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
                case 7:
                try {
                    String sigk=request.getParameter("signature");
                    String priva=request.getParameter("privates");
                    System.out.println("sigk"+sigk);
                    System.out.println("sigk"+priva);
                    rs = st3.executeQuery("select * from userreg where (clousigkey='"+sigk+"' and  ottpkey ='"+priva+"') ");
                    if (rs.next()) {
                        
                        response.sendRedirect("userhome.jsp?msg=success");
                    } else {
                        response.sendRedirect("authocation.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
                case 8:
                try {
                    String fileview=request.getParameter("fvikey");
                    HttpSession ses = request.getSession();
                            String filid = ses.getAttribute("fvied").toString();
                    
                    rs = st3.executeQuery("select * from fileupload where id='"+filid+"' and ftimekey='"+fileview+"'  ");
                    if (rs.next()) {
                        
                        response.sendRedirect("fileview3.jsp?msg=success");
                    } else {
                        response.sendRedirect("fileview1.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
                case 9:
                try {
                    String fileview=request.getParameter("fvikey");
                    HttpSession ses = request.getSession();
                            String filid = ses.getAttribute("fdowid").toString();
                    
                    rs = st3.executeQuery("select * from fileupload where id='"+filid+"' and ftimekey='"+fileview+"'  ");
                    if (rs.next()) {
                        
                        response.sendRedirect("Download1?msg=success");
                    } else {
                        response.sendRedirect("fileview1.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
                case 10:
                try {
                    String searchkey=request.getParameter("searchkey");
//                    HttpSession ses = request.getSession();
//                            String filid = ses.getAttribute("fdowid").toString();
                    
                    rs = st3.executeQuery("select * from request where  sekey='"+searchkey+"'  ");
                    if (rs.next()) {
                        
                        response.sendRedirect("search3.jsp?msg=success");
                    } else {
                        response.sendRedirect("search1.jsp?msggg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
                
            default:
                response.sendRedirect("index.html");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>