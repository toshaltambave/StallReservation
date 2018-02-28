<!--#include file="main.asp"-->
<%Dim sm 
		Con.open
		set recobj = Server.CreateObject("ADODB.Recordset")
		sm = "Select SL_Location From ERND_Location"
		 %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head >
     
    <title>Location Select</title>
   
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        
    </style>
	</head>
<body>
   <div id="container">
        <div id="header">
        <img alt="mlogo" class="style1" src="Images/mlogo.jpg" />
        </div>
        <div id="section">
        <div id="sectionleft">
        <ul id="ulnav">
	        <li><a href="default.asp">Home</a></li>
			<li><a href="locationhomeshow.asp">Check Availability</a></li>
            <li><a class='active' href="locationhome.asp">Booking</a></li>
	        <li><a href="adminhome1.asp">Admin</a></li>
	    </ul></div>
		<div id="sectionright">
			<h1 style="text-align: center" > Select Location To Book Stall</h1>
			<table border="1" bordercolor="#ff0000" style="width: 50%; margin-left: 25%;">
        
			<%recobj.open sm,Con%>
			<%if not recobj.bof or not recobj.eof then%>
			<% recobj.movefirst%>
			<%while not recobj.eof%>
			<tr>
 <td style="text-align: center; font-size: 160%; font-family:serif; height:50px;">
                <a href="StallSelect.asp?Location=<%=recobj("SL_Location")%>">
					<%=recobj("SL_Location")%>
				<a href="StallSelect.asp?Location=<%=recobj("SL_Location")%>">
		</td> 
							</tr>
			<%recobj.movenext%>
			<% wend%>
			<%else%>
			<%response.write("<h3>Error : No Locations To Display</h3>")%>
			<%end if%>
			<% recobj.close%>
		
		
            
        
        
    </table>
		</div>
   </div>
</body>
</html>