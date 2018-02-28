<!--#include file="main.asp"-->

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
		<%
		StallId1=request.querystring("Stall")
		DateSelected1=request.form("datepickerfield")
		
		%>
		<h1 align="center">Enter Details To Book <%=StallId1%> On <%=DateSelected1%></h1>
		 <form id="form1" method="post" action="BookingDetails.asp">
		 <div style="margin-left:30%;">
			<table border="1" bordercolor="red" class="auto-style1" style="font-size:150%;">
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
                <input id="Text3" name="Name" class="auto-style6" type="text" /></td>
        </tr>
        <tr>
            <td class="auto-style3">ContactNo</td>
            <td>
                <input id="Text4" name="Cno" class="auto-style6" type="text" /></td>
        </tr>
        <tr>
            <td class="auto-style3">Organisation</td>
            <td>
                <input id="Text5" name="OrgName" class="auto-style6" type="text" /></td>
        </tr>
        <tr>
            <td class="auto-style3">Product</td>
            <td>
                <input id="Text6" name="Product" class="auto-style6" type="text" /></td>
        </tr>
        <tr>
            <td class="auto-style3">Cell Member Ref</td>
            <td>
                <input id="Text7" name="CellMember" class="auto-style6" type="text" /></td>
        </tr>
        <tr>
            <td class="auto-style3">Cell No</td>
            <td>
                <input id="Text8" name="CellNo" class="auto-style6" type="text" /></td>
        </tr>
        <tr>
            <td class="auto-style3">No Of Tables Required</td>
            <td>
                <input id="Text9" name="NoOfStalls" class="auto-style6" type="text" /></td>
        </tr>
        <tr>
            <td class="auto-style3">No Of People</td>
            <td>
                <input id="Text10" name="NoOfPeople" class="auto-style6" type="text" /></td>
        </tr>
        <tr>
            <td class="auto-style3">Description</td>
            <td>
                <input id="Text11" name="Description" class="auto-style7" type="text" /></td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <input id="submitme" name="SubmitBooking" class="auto-style8" type="submit" value="Submit" onclick="myFunction" /></td>
        </tr>
    </table>
	</div>
    </form>
	
	<%getSub = request.form("SubmitBooking")
				if getSub="Submit" then
					Name= request.form("Name")
					Cno= request.form("Cno")
					OrgName= request.form("OrgName")
					Product= request.form("Product")
					CellMember= request.form("CellMember")
					CellNo= request.form("CellNo")
					NoOfStalls= request.form("NoOfStalls")
					NoOfPeople= request.form("NoOfPeople")
					Description= request.form("Description")
					SubmitStall= request.form("StallId")
					SubmitDate= request.form("Date")
					Dim sm, sm1
				Con.open
				sm = "INSERT INTO ERND_Booking" &_
				"(BO_Name,BO_Cno,BO_Org_Name,BO_Product,BO_CellMem_Name,BO_CellMem_CellNo,BO_No_Tables,BO_No_People,BO_Description,BO_Stall,BO_Date)" &_
				" VALUES (" &_
				"'" & Name & "'," &_
				"'" & Cno & "'," &_
				"'" & OrgName & "'," &_
				"'" & Product & "'," &_
				"'" & CellMember & "'," &_
				"'" & CellNo & "'," &_
				"'" & NoOfStalls & "'," &_
				"'" & NoOfPeople & "'," &_
				"'" & Description & "'," &_
				"'" & SubmitStall & "'," &_
				"'" & SubmitDate & "'" &_
				
				")"
				Con.Execute sm, ,adCmdText
				lsSQL = "SELECT @@IDENTITY AS NewID"
				Set loRs = Con.Execute(lsSQL)
				llID = loRs.Fields("NewID").value
				sm1 = "INSERT INTO ERND_Reservation" &_
				"(SD_Id,BO_Date,BO_Id)" &_
				"VALUES (" &_
				"'" & SubmitStall & "'," &_
				"'" & SubmitDate & "'," &_
				"'" & llID & "'" &_
				")"
				Con.Execute sm1, ,adCmdText
				Con.close
				<!--response.redirect "default.asp"-->
				end if
			%>
			<%=llID%>
			<%=SubmitStall%>
			<%=SubmitDate%>
			<script>
			function myFunction(){
			window.alert("Test");
			}
			</script>
		</div>
        </div>
        <div id="footer">
        <p>M&M Ltd. ER&D Dept.</p>
        </div>
   
   </div>
</body>
</html>