<!--#include file="main.asp"-->

<%
		Dim sm 
		Con.open
		set recobj = Server.CreateObject("ADODB.Recordset")
		sm = "Select * From ERND_Stall_Details Where SL_Location='"& request.querystring("Location") & "'"
		recobj.open sm, Con, ,3
%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head >
     
    <title>Admin Home</title>
   
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
	    </ul>
        </div>
		<div id="sectionright">
		<h1 align="center">Select Stall From Location: <%=request.querystring("Location")%> </h1>
		<%  
	if not recobj.bof or not recobj.eof then%>
		<form action="DatepickerTest2.asp?Stall=<%=recobj("SD_Id")%>" method="get">
		<%   else
	response.write("<h3>Error : No Stalls Present For Selected Location</h3>")
	end if%>
		<table border="1px" bordercolor="#ff0000" style="width:90%; height:20%; margin-left:15px; font-size: 120%;">
        <tr style="height:15%; font-size: 100%;">
            <td style="text-align: center; width: 356px">
                Select Stall</td>
            <td style="text-align: center; width: 356px">
                Stall Id</td>
            <td style="text-align: center; width: 710px">
                Stall Name</td>
			<td style="text-align: center; width: 710px">
                Duration From</td>
			<td style="text-align: center; width: 710px">
                Duration Till</td>
        </tr>
<%  
	if not recobj.bof or not recobj.eof then
    recobj.movefirst
	while not recobj.eof%>
        <tr>
            <td style="height: 22px; text-align: center; width: 356px">
                <input width="150%" name="Stall" type="submit" value="<%=recobj("SD_Id")%>" />
            </td>
            <td style="height: 22px; text-align: center; width: 356px">
                <%=recobj("SD_Id")%></td>
            <td style="height: 22px; text-align: center; width: 710px">
                <%=recobj("SD_Name")%></td>
			<td style="height: 22px; text-align: center; width: 710px">
                <%=recobj("SD_From")%></td>
			<td style="height: 22px; text-align: center; width: 710px">
                <%=recobj("SD_Till")%></td>
        </tr>
		<%recobj.movenext
		   wend %>
<%   else
	response.write("<h3>Error : No Stalls Present For Selected Location</h3>")
	end if%>
		
		</table>
		</form>
		</div>
        </div>
        <div id="footer">
        <p>M&M Ltd. ER&D Dept.</p>
        </div>
   
   </div>
</body>
</html>