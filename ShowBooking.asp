<!--#include file="main.asp"-->
<%
Dim sm ,String
		Con.open
		set recobj = Server.CreateObject("ADODB.Recordset")
		
		sm = "Select BO_Date From ERND_Reservation Where SD_Id='"& request.querystring("Stall") & "'"
		
		
		
%>

<html xmlns="http://www.w3.org/1999/xhtml">

<head >

     <script type="text/javascript">
	 var DisabledDays = new Array();
	 <%
	 recobj.open sm, Con
	 
	 
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
	<script src="jquery.js"></script>
    <script src="jquery-ui.js"></script>
    <link href="jquery-ui.css" rel="stylesheet" />
					<script type="text/javascript">
	var datesArray=['2016-07-01','2016-07-02']
	$(function(){
		$('#ShowBooking').datepicker({
			 inline: true,
			 altField: "#datepickerfield",
			 dateFormat: 'yy-mm-dd',
			 beforeShowDay: function (date) {
			 
				var theday = date.getFullYear() +'-'+ 
							(date.getMonth()+1)+ '-' + 
							date.getDate();
			var theday = $. datepicker.formatDate("yy-mm-dd",date);
					return [true,$.inArray(theday, DisabledDays) >=0?"specialDate":''];
				}
		});
	});
	</script>
	<style type="text/css">
	.specialDate { background-color: #00000 !important; }
	</style>

	<style type="text/css">
	.specialDate { background-color: #00000 !important; }
	</style>

	



	</head>
<body>
			<style type="text/css">
	.ui-datepicker .specialDate a { background: #ff9999; }
	</style>
		<style type="text/css">
    .ui-helper-clearfix::after {
        display: inline; 
    }
	.ui-datepicker-header {
            background-color: #ee2128;
      }
	
	<style type="text/css">
			.ui-datepicker-calendar tr, .ui-datepicker-calendar td, .ui-datepicker-calendar td a, .ui-datepicker-calendar th{font-size:inherit;}
			div.ui-datepicker{font-size:32px;width:800px;height:500px;}
			.ui-datepicker-title span{font-size:32px;}
	</style>
	</style>
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
		<%GetStall=request.querystring("Stall")%>
		<div id="sectionright">
		<h1 align="center">Select Date To Check Status Of: <%=GetStall%></h1> 
		<h3 align="center">&bull;Click On Date & Press Submit</h3>
		<div id="ShowBooking" style="margin-left:100px;"></div>
		<div style="margin-left:30%;">
		<form method="post" action="BookingInfo.asp?Stall=<%=GetStall%>">
		<input type="text" id="datepickerfield" name="datepickerfield" value="">
		<input type="submit" name="submitbutton" value="submit">
		<p>*Date Format:yyyy-mm-dd</p>
		<div class="legend ui-state-default" style=" width: 20px; height: 20px; margin: 5px;   
        border-color:red;background: #ff9999;color: #ff9999; float:left;"></div><p>- Stall Booked For The Day.</p> 
    <div class="legend ui-state-default" style="width: 20px;float:left; height: 20px; margin: 5px;   
        border-color:green;background: #ffff99;color: white;"></div><p>- Today's Date.</p>            
    <div class="legend ui-state-default" style="width: 20px; float:left; height: 20px; margin: 5px;"></div>
    <p>- Available.</p>
    </div>     
		<div>

		</form>
		</div>
        </div>
        
   
   </div>
   
	
</body>
</html>