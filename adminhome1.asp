<!--#include file="main.asp"-->
<%
		Dim sm 
		Con.open
		set recobj = Server.CreateObject("ADODB.Recordset")
		set recobj1 = Server.CreateObject("ADODB.Recordset")
		sm = "Select SL_Location From ERND_Location"
		sm1 = "Select SD_Id From ERND_Stall_Details"
		sm2 = "Select SD_Id From ERND_Stall_Details Order BY SL_Location"
		sm3 = "Select * From ERND_Stall_Details"
%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head >
     
    <title>Admin Home</title>
   
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        
		table.ShowAvailLoc
		{
			float:left;
			width:45%;
		}
		table.ShowAvailStall
		{
			float:right;
			width:45%;
		}
		.LocationTable
		{
		Width:25%;
		text-align:center;
		}
		.LocationTableRow
		{
		Width:50%;
		
		}
    </style>
	<script src="jquery.js"></script>
    <script src="jquery-ui.js"></script>
    <link href="jquery-ui.css" rel="stylesheet" />
    <script>
  $(function() {
      $('#datepickerto').datepicker({
          dateFormat: 'yy/mm/dd'
		  
      });
      $('#datepickerfrom').datepicker({
          dateFormat: 'yy/mm/dd'
      });
  });
  </script>
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
            <li><a href="locationhome.asp">Booking</a></li>
	        <li><a class='active' href="adminhome1.asp">Admin</a></li>
	    </ul>
        </div>
        <div id="sectionright">
		<div id="sectionrighttop">
		<h1 align="center">  &nbsp;&nbsp;Currently Active Locations & Stalls</h2>
		
		<table align="center" class="LocationTable" border="1px" bordercolor="red" style="float:left; margin-left:20%; margin-top:2%;">
		<tr>
			<td class="LocationTableRow"><strong>Available Locations</strong></td>
			
		</tr>
		<tr>
		
			<%recobj.open sm,Con%>
			<td>
			<%if not recobj.bof or not recobj.eof then%>
			<% recobj.movefirst%>
			
			<%while not recobj.eof%>
			<p><%=recobj("SL_Location")%></p> 
			<%recobj.movenext%>
			<% wend%>
			
		<%	else
				response.write("<p>No Locations Set</p>") %>
				</td>
				<%end if%>
			<% recobj.close%>
		
			
		</tr>
		</table>
		<br>
		<table align="center" class="LocationTable" border="1px" bordercolor="red">
		<tr>
			
			<td class="LocationTableRow"><strong>Available Stalls</strong></td>
		</tr>
		<tr>
		
			
			
		<% recobj.open sm2, Con %>
		<td>
		<%if not recobj.bof or not recobj.eof then%>
		<% recobj.movefirst%>
			
			<%while not recobj.eof%>
			<p><%=recobj("SD_Id")%></p> 
			<%recobj.movenext%>
			<% wend%>
			<%	else
				response.write("<p>No Stalls Set</p>") %>
			</td>
		
			<%end if%>
			<%recobj.close%>
		</tr>
		</table>
		
		
		<p align="center" style="color:red;">*Please use the Refresh Button After Adding/Removing Stall To Update Table</p>
		<br>
		<form action="adminhome1.asp">
		<input type="submit" value="Refresh" align="center" style="margin-left:42%; height:50px; width: 170px; font-size:120%;">
		</form>
		</div>
		<div id="sectionrightbottom">
		<h1 align="center">Enter Details To Add New Location/Stall</h3>
		<h5 align="center" style="color:red;">*Please Create a Location First & Add Stalls Into Those* </h4>
		<div id="sectionright2left">
		<div style="margin-left:40%;">
			<form action="adminhome1.asp" method="post">
			<b>Add New Location:</b><br><br>
			<input type ="text" name="location" value="" placeholder="Enter Name For Location">
			<br><br>
			<input type="submit" name="submit" value="Add">
			</form>
			<%getSub = request.form("submit")
				if getSub="Add" then
				getLoc = request.form("location")
	
				recobj1.open sm, Con, ,3
				recobj1.AddNew
				recobj1("SL_Location")=getLoc
				recobj1.update
				recobj1.close
				end if
			%>
			
		</div>
		</div>
		<div id="sectionright2right">
			
			<form action="adminhome1.asp" method="post">
				<p><b>Add New Stall Into Location</b></p>
			<select name="SelectedLocation">
			<option value="" disabled selected hidden>Please Choose...</option>			 
			<%recobj.open sm,Con%>
			<% recobj.movefirst%>
			<%while not recobj.eof%>
			<option value="<%=recobj("SL_Location")%>"><%=recobj("SL_Location")%></option>
			<%recobj.movenext%>
			<% wend%>
			<% recobj.close%>
						
			</select>
			<br>
			
				<br>Stall Id:<br>
					<input type="text" name="StallId" value="" placeholder="Example:SHIV001" >
					<br>
				Stall Name:<br>
					<input type="text" name="StallName" value="" placeholder="Enter Name For Stall" >
					<br>
				Duration From:<br>
					<input type="text" name="FromDate" id="datepickerfrom" value="" placeholder="Click Here For Calender" >
					
					<br>
				Duration Till:<br>
					<input type="text" name="ToDate" id="datepickerto" value="" placeholder="Click Here For Calender">
					<br>
					<br>
				<input type="submit" name="submit1" value="Add Stall">
			</form>
			
			<%getSub1 = request.form("submit1")
				if getSub1="Add Stall" then
					SelectedLocation= request.form("SelectedLocation")
					StallId= request.form("StallId")
					StallName= request.form("StallName")
					FromDate= request.form("FromDate")
					ToDate= request.form("ToDate")
				recobj1.open sm3, Con, ,3
				recobj1.AddNew
				recobj1("SL_Location")=SelectedLocation
				recobj1("SD_Id")=StallId
				recobj1("SD_Name")=StallName
				recobj1("SD_From")=FromDate
				recobj1("SD_Till")=ToDate
				recobj1.update
				recobj1.close
				end if
			%>
		</div>
		<p align="center" style="color:red;">*Please use the Refresh Button After Adding/Removing Stall To Update Table</p>
		<h1 align="center">Remove Location/Stall</h1>
		<div style="margin-left:42%;">
	<form action="adminhome1.asp" method="post">
				<p><b>Remove Existing Location</b></p>
				<select name="SelectedLocation">
				<option value="" disabled selected hidden>Please Choose...</option>		 
				<%recobj.open sm,Con%>
				<% recobj.movefirst%>
				<%while not recobj.eof%>
				<option value="<%=recobj("SL_Location")%>"><%=recobj("SL_Location")%></option>
				<%recobj.movenext%>
				<% wend%>
				<% recobj.close%>
						
				</select>
			<input type="submit" value="RemoveLocation" name="RemoveLocation">
			</form>
			<%getSub1 = request.form("RemoveLocation")
				if getSub1="RemoveLocation" then
				RemLoc = request.form("SelectedLocation")
				
				sm3 = "DELETE FROM ERND_Location WHERE SL_Location='"& request.form("SelectedLocation")&"'"
				Con.Execute sm3, ,adCmdText
				end if
	%>
	
	<form action="adminhome1.asp" method="post">
				<p><b>Remove Existing Stall</b></p>
				<select name="SelectedStall">
				<option value="" disabled selected hidden>Please Choose...</option>		 
				<%recobj.open sm1,Con%>
				<% recobj.movefirst%>
				<%while not recobj.eof%>
				<option value="<%=recobj("SD_Id")%>"><%=recobj("SD_Id")%></option>
				<%recobj.movenext%>
				<% wend%>
				<% recobj.close%>
						
				</select>
			<input type="submit" value="RemoveStall" name="RemoveStall">
			</form>
			<%getSub2 = request.form("RemoveStall")
				if getSub2="RemoveStall" then
				RemStall = request.form("SelectedStall")
				
				sm3 = "DELETE FROM ERND_Stall_Details WHERE SD_Id='"& request.form("SelectedStall")&"'"
				Con.Execute sm3, ,adCmdText
				end if
				
	%>
	
	
	</div>
	<p align="center" style="color:red;">*Removing a Location Will Also Remove Any Stalls In It</p>
	<h3 align="center" style="color:red;" >Note: Removing Locations/Stalls Will Also Remove Any Saved Booking Records</h3>
		</div>
		
		</div>
        </div>
		
        
   </div>
   
</body>
</html>
