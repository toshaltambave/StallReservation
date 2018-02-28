<!--#include file="main.asp"-->
<%
		Dim sm 
		Con.open
		set recobj = Server.CreateObject("ADODB.Recordset")
		set recobj1 = Server.CreateObject("ADODB.Recordset")
		sm = "Select BO_Id From ERND_Reservation where SD_Id='"& request.querystring("Stall") & "' AND BO_Date='"& request.form("datepickerfield") &"'"
		recobj.open sm, Con, ,3
		if not recobj.bof or not recobj.eof then
		Set BookingID=recobj("BO_Id")

		
		sm1= "Select * From ERND_Booking Where BO_Id='"& recobj("BO_Id") & "'"
		recobj1.open sm1, Con, ,3
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
			<li><a class='active' href="locationhomeshow.asp">Check Availability</a></li>
            <li><a href="locationhome.asp">Booking</a></li>
	        <li><a href="adminhome1.asp">Admin</a></li>
	    </ul>
        </div>
		<div id="sectionright">
		
		<%
		StallId1=request.querystring("Stall")
		DateSelected1=request.form("datepickerfield")
		
		%>
		<h1 align="center">Booking Info For <%=StallId1%> On <%=DateSelected1%></h1>
		 <form id="form1" method="post" action="BookingInfo.asp">
		 <div style="margin-left:30%;">
			<table border="1" bordercolor="red" class="auto-style1" style="font-size:150%;">
        <tr style="width:50%;">
            <td class="auto-style3">Booking ID</td>
            <td>
                <input name="BookingID" type="text" value="<%=BookingID%>" /></td>
        </tr>
		<tr>
            <td class="auto-style3">Selected Stall</td>
            <td>
                <input name="StallId" type="text" value="<%=StallId1%>" /></td>
        </tr>
        <tr>
            <td class="auto-style4">Selected Date</td>
            <td class="auto-style2">
                <input name="Date"  type="text" value="<%=DateSelected1%>" /></td>
        </tr>
        <tr>
            <td class="auto-style3">Name</td>
            <td>
                <input id="Text3" name="Name" class="auto-style6" type="text" value="<%=recobj1("BO_Name")%>" /></td>
        </tr>
        <tr>
            <td class="auto-style3">ContactNo</td>
            <td>
                <input id="Text4" name="Cno" class="auto-style6" type="text" value="<%=recobj1("BO_Cno")%>" /></td>
        </tr>
        <tr>
            <td class="auto-style3">Organisation</td>
            <td>
                <input id="Text5" name="OrgName" class="auto-style6" value="<%=recobj1("BO_Org_Name")%>" type="text" /></td>
        </tr>
        <tr>
            <td class="auto-style3">Product</td>
            <td>
                <input id="Text6" name="Product" class="auto-style6" value="<%=recobj1("BO_Product")%>" type="text" /></td>
        </tr>
        <tr>
            <td class="auto-style3">Cell Member Ref</td>
            <td>
                <input id="Text7" name="CellMember" class="auto-style6" type="text" value="<%=recobj1("BO_CellMem_Name")%>" /></td>
        </tr>
        <tr>
            <td class="auto-style3">Cell No</td>
            <td>
                <input id="Text8" name="CellNo" class="auto-style6" value="<%=recobj1("BO_CellMem_CellNo")%>" type="text" /></td>
        </tr>
        <tr>
            <td class="auto-style3">No Of Tables Required</td>
            <td>
                <input id="Text9" name="NoOfStalls" class="auto-style6" value="<%=recobj1("BO_No_Tables")%>" type="text" /></td>
        </tr>
        <tr>
            <td class="auto-style3">No Of People</td>
            <td>
                <input id="Text10" name="NoOfPeople" class="auto-style6" value="<%=recobj1("BO_No_People")%>" type="text" /></td>
        </tr>
        <tr>
            <td class="auto-style3">Description</td>
            <td>
                <input id="Text11" name="Description" class="auto-style7" value="<%=recobj1("BO_Description")%>" type="text" /></td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <input id="Cancelme" name="Cancel" class="auto-style8" type="submit" value="Cancel" /></td>
        </tr>
    </table>
	</div>
    </form>
	<%=BO_Id%>
	<%
   else
	response.write("<h3>Error : Stall Not Yet Booked For Selected Date, Please Go Back & Select A Booked Stall For Info To Appear</h3>")
	end if
	%>

	<%getSub2 = request.form("Cancel")
				if getSub2="Cancel" then
				
				
				sm3 = "DELETE FROM ERND_Booking WHERE BO_Id='"& request.form("BookingID")&"'"
				Con.Execute sm3, ,adCmdText 
				response.redirect "default.asp"
				end if
				
	%>
		</div>
        </div>
        <div id="footer">
        <p>M&M Ltd. ER&D Dept.</p>
        </div>
   </div>
</body>
</html>