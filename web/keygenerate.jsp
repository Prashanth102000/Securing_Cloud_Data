<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Securing Cloud Data under Key Exposure</title> 
<meta name="keywords" content="" />
<meta name="description" content="" />

<link href="tooplate_style3.css" rel="stylesheet" type="text/css" />

</head>
    <%
    String strr=request.getQueryString();
session.setAttribute("gnid", strr);
%>
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
                <li><a href="owfiledet.jsp" class="current">BACK</a></li>
                
            </ul>    	
        
        </div> <!-- end of tooplate_menu -->
        
    </div>	  
</div> <!-- end of header_wrapper -->

<div id="tooplate_middle_wrapper1">
	<div id="tooplate_middle_wrapper2">
		<div id="tooplate_middsec">

			
			
		</div>
	</div>
</div>
<br></br>
<div class="container profile" class="page-wrapper" style="border-style:   groove; border-width: 10px;border-color: #E9967A;height:  590px;width: 550px;margin-left: 250px;" >
    <center><h1 style="font-family: Copperplate Gothic Bold;color:#3CB371 "></h1></center>
  <div style="float: left; margin-left: 10px;background:#696969;width: 540px" >
      <script>
    function key1()
{
    var date = new Date();
    var hours = date.getHours();
    var days = date.getDay(); 
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'pm' : 'am';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    minutes = minutes < 10 ? '0'+minutes : minutes;
    var strTime = date + ' ' + hours + ':' + minutes + ' ' + ampm;
    
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < 25; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    
    var textbox1 = document.getElementById('textbox1');
    textbox1.value=text +'  TIMING:' +strTime;
          
}
function key2()
{
    var date = new Date();
    var hours = date.getHours();
    var days = date.getDay(); 
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'pm' : 'am';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    minutes = minutes < 10 ? '0'+minutes : minutes;
    var strTime = date + ' ' + hours + ':' + minutes + ' ' + ampm;
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < 25; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    var textt= text;
    var  textbox2 = document.getElementById('textbox2');
    
    textbox2.value=text +'  TIMING:' +strTime;
}
function key3()
{
     var date = new Date();
    var hours = date.getHours();
    var days = date.getDay(); 
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'pm' : 'am';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    minutes = minutes < 10 ? '0'+minutes : minutes;
    var strTime = date + ' ' + hours + ':' + minutes + ' ' + ampm;
    
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < 25; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    var textt= text;
    var  textbox3 = document.getElementById('textbox3');
    textbox3.value=text +'  TIMING:' +strTime;
}
function key4()
{
    var date = new Date();
    var hours = date.getHours();
    var days = date.getDay(); 
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'pm' : 'am';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    minutes = minutes < 10 ? '0'+minutes : minutes;
    var strTime = date + ' ' + hours + ':' + minutes + ' ' + ampm;
    
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < 25; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    var textt= text;
    var  textbox4 = document.getElementById('textbox4');
     textbox4.value=text +'  TIMING:' +strTime;
}
function key5()
{
    var date = new Date();
    var hours = date.getHours();
    var days = date.getDay(); 
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'pm' : 'am';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    minutes = minutes < 10 ? '0'+minutes : minutes;
    var strTime = date + ' ' + hours + ':' + minutes + ' ' + ampm;
    
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < 25; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    var textt= text;
    var  textbox5 = document.getElementById('textbox5');
    textbox5.value=text +'  TIMING:' +strTime;
}
function key6()
{
    var date = new Date();
    var hours = date.getHours();
    var days = date.getDay(); 
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'pm' : 'am';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    minutes = minutes < 10 ? '0'+minutes : minutes;
    var strTime = date + ' ' + hours + ':' + minutes + ' ' + ampm;
    
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < 25; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    var textt= text;
    var  textbox6 = document.getElementById('textbox6');
    textbox6.value=text +'  TIMING:' +strTime;
}

function OnButton1()
{
             var a = document.getElementById("key1");
                var b = document.getElementById("b");
                var valid = true;
                if(a.value.length<=0 || b.value.length<=0)
                    {
                        alert("Don't leave the field empty!");
                        valid = false;
                    }
                    else{

    document.Form1.action = "keygenerate2.jsp"
    // document.Form1.target = "_blank";    // Open in a new window

    document.Form1.submit();             // Submit the page

    return true;
}
                    }


</script>
     
      <center><h1 style="font-family: Copperplate Gothic Bold;color:#3CB371 ">POLYNOMIAL TIME KEY  </h1></center>
                    
                           <form  name="Form1" action="keygenerate2.jsp" method="post">  
                               <input type="Submit" value="SUBMIT" class="button" ><BR>
                        <label STYLE="font-size: 25px">KEY_1</label><input type="text" class="inputs" name="key1" required="" id="textbox1" style="width:400px" /><br> 
                        <label STYLE="font-size: 25px">KEY_2</label><input type="text" class="inputs" name="key2" required="" id="textbox2" style="width:400px"    /><br>
                        <label STYLE="font-size: 25px">KEY_3</label><input type="text" class="inputs" name="key3" required="" id="textbox3"  style="width:400px"  /><br>
                        <label STYLE="font-size: 25px">KEY_4</label><input type="text" class="inputs" name="key4" required="" id="textbox4"  style="width:400px"  /><br>
                        <label STYLE="font-size: 25px">KEY_5</label><input type="text" class="inputs" name="key5" required="" id="textbox5"  style="width:400px" /><br>
                        <label STYLE="font-size: 25px">KEY_6</label><input type="text" class="inputs" name="key6" required="" id="textbox6"  style="width:400px" /><br>
                        
                         
                             
                       
                           </form>
                            <input type="Submit" value="Keygenerate_1" class="button" onclick="key1()" >
                           <input type="Submit" value="Keygenerate_2" class="button" onclick="key2()" >
                           <input type="Submit"  value="Keygenerate_3"  class="button" onclick="key3()" >
                            <input type="Submit" value="Keygenerate_4" class="button" onclick="key4()" >
                            <input type="Submit" value="Keygenerate_5" class="button" onclick="key5()" >
                            <input type="Submit"  value="Keygenerate_6"  class="button" onclick="key6()" >
                         
                   </center>
                    </div>
    
</div>
    <div class="cleaner"></div>
  
<div id="tooplate_footer_wrapper">

     <div id="tooplate_footer">
    
       
    
    </div> <!-- end of tooplate_footer -->

</div> 
    
</body>
</html>
