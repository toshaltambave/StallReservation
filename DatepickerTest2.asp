<!--#include file="main.asp"-->
<%
Dim sm ,String
		Con.open
		set recobj = Server.CreateObject("ADODB.Recordset")
		
		sm = "Select BO_Date From ERND_Reservation Where SD_Id='"& request.querystring("Stall") & "'"
		recobj.open sm, Con, ,3
		<!--arrDates = recobj.GetRows()-->
		<!--String = recobj.GetString(,,,"'","")-->
%>

<html xmlns="http://www.w3.org/1999/xhtml">

<head >
     <script type="text/javascript">
	 var DisabledDays = new Array();
	 <%
	 Dim index : index = 0
	 Do Until recobj.EOF
			Response.Write "DisabledDays[" & index & "]='" & recobj(0) & "';" & vbNewLine
			recobj.MoveNext
			index = index + 1
	Loop
	%>
	</script>
    <title>Admin Home</title>
   
    <link href="StyleSheet1.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.11.1.js"></script>
	<script type="text/javascript" src="jquery-ui.multidatespicker.js"></script>
	<link href="jquery-ui.css" rel="stylesheet" />	
		<style type="text/css">
    .ui-helper-clearfix::after {
        display: inline; 
    }
	<style type="text/css">
			.ui-datepicker-calendar tr, .ui-datepicker-calendar td, .ui-datepicker-calendar td a, .ui-datepicker-calendar th{font-size:inherit;}
			div.ui-datepicker{font-size:32px;width:800px;height:500px;}
			.ui-datepicker-title span{font-size:32px;}
			
	
	</style>
	</style>
	<script>
	
		$(function() {
		
		var today = new Date()
		$('#simplest-usage').multiDatesPicker({
		dateFormat: 'yy-mm-dd',
		addDisabledDates: DisabledDays,
		maxPicks:1,
		altField: "#datepickerfield"
		
		});
		});
		</script>
		<style>
		.ui-datepicker-header {
            background-color: #ee2128;
      }
	  </style>
	</head>
<body>
<%GetStall=request.querystring("Stall")%>

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
		<h1 align="center">Select Date To Book Stall: <%=GetStall%></h1> 
		<h3 align="center">&bull;Click On Date & Press Submit</h3>
		
		<div id="simplest-usage" style="margin-left:100px;" ></div>
		<div style="margin-left:30%;">
		<form method="post" action="BookingDetails.asp?Stall=<%=GetStall%>">
		<input type="text" id="datepickerfield" name="datepickerfield" value="">
		<input type="submit" name="submitbutton" value="submit">
		<p>*Date Format:yyyy-mm-dd</p>
		<div class="legend ui-state-default" style=" width: 20px; height: 20px; margin: 5px;   
        border-color:ffffff;background: #cceaff;color: #ff9999; float:left;"></div><p>- Unclickable Dates Indicate Booked Stall.</p> 
    <div class="legend ui-state-default" style="width: 20px;float:left; height: 20px; margin: 5px;   
        border-color:green;background: #ffff99;color: white;"></div><p>- Today's Date.</p>            
    <div class="legend ui-state-default" style="width: 20px; float:left; height: 20px; margin: 5px;"></div>
    <p>- Available.</p>
    
		</div>
		
		</form>
		</div>
        </div>
        
   </div>
</body>
</html>