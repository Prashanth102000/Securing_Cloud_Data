<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Securing Cloud Data under Key Exposure</title> 
<meta name="keywords" content="" />
<meta name="description" content="" />

<link href="tooplate_style.css" rel="stylesheet" type="text/css" />
<%
            if (request.getParameter("fmsg") != null) {
        %>
        <script>alert('File Upload Succesfully');</script>
        <%            }
        %>
        <%
            if (request.getParameter("fmsgg") != null) {
        %>
        <script>alert('File not Uploaded');</script>
        <%            }
        %>

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
		<div id="tooplate_middlefileup">

			
			
		</div>
	</div>
</div>
<br></br>
<div class="container profile" class="page-wrapper" style="border-style:   groove; border-width: 10px;border-color: #E9967A;height:  370px;width: 800px;margin-left: 250px;" >
    <center><h1 style="font-family: Copperplate Gothic Bold;color:#3CB371 ">File Uploads</h1></center>
  <div style="float: left; margin-left: 10px;background:#696969;width: 340px" >
                        <%
                        HttpSession ses = request.getSession();
String prikey = ses.getAttribute("privakey").toString();
                        
%>
                    <br><form action="fileuploaddd" method="post" enctype="multipart/form-data"> 
                            <label STYLE="font-size: 25px">Privatekey</label><input type="text" class="inputs" name="privakey" required="" value="<%=prikey%>" pattern="^[a-zA-Z]+$"  /><BR>
                                <label STYLE="font-size: 25px">Filename</label>&nbsp;&nbsp;&nbsp;<input type="text" class="inputs" name="filename" required="" placeholder="FILENAME" required="" /><br>
                        <label STYLE="font-size: 25px">caption</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="inputs" name="caption" required="" placeholder="CAPTION"  /><br>
                        <label STYLE="font-size: 25px">File</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="file" class="inputs" name="filess" required="" /><br>
                        
                        
                       
                        <input type="Submit" value="UPLOD" class="button" >
                        <input type="reset" value="Reset" class="button" >
                    </form></center>
                    </div>
    <div style="float: right; margin-right:  50px;background: blanchedalmond;width: 390px">
              <img style="width:430px;height: 300px"src="imagess\upp.png"></img>
          </div>
</div>
    <div class="cleaner"></div>
  
<div id="tooplate_footer_wrapper">

     <div id="tooplate_footer">
    
       
    
    </div> <!-- end of tooplate_footer -->

</div> 
    
</body>
</html>
