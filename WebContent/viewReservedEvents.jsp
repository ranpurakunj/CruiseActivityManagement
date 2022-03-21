<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Event Summary</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="myStyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<body>
<h1>View Reserved Events</h1>
	<label class="errorPane"><c:out value='${error.errorMsg}' /></label>
	<form method="post"	action="<c:url value='/EventController?action=searchReservedEvents' /> ">
		<p>
			Date: <input type="text" id="datepicker" name="datepicker"> <label class="errorPane"><c:out value='${error.dateError}' /></label>
		</p>
		<p>
			Time: <input type="text" id="timepicker" name="timepicker"> <label class="errorPane"><c:out value='${error.startTimeError}' /></label>
		</p>
		<input type="submit" value="Search" />
	</form>
	<a href="<c:url value='/UserController?action=homepage' />"> <input
		type="submit" value="Back"></a>
	<hr>
	<table border="1" class="myTable">
		<tr class="myTableRow">
			<th class="myTable20">Event Name</th>
			<th class="myTable35">Event Date</th>
			<th class="myTable20">Start Time</th>
			<th class="myTable20">Duration</th>
			<th class="myTable20">Location</th>
			<th class="myTable20">Est. Attendance</th>
		</tr>

		<c:forEach items="${EVENTS}" var="item" varStatus="status">
			<tr class="myTableRow">

				<td class="myTable20 "><c:out value="${item.event_name}" /></td>
				<td class="myTable35 "><c:out value="${item.date}" /></td>
				<td class="myTable20 "><c:out value="${item.startTime}" /></td>
				<td class="myTable20 "><c:out value="${item.duration}" /></td>
				<td class="myTable20 "><c:out value="${item.location}" /></td>
				<td class="myTable20 "><c:out value="${item.estAttendance}" /></td>
				<td><a
					href="<c:url value='/EventController?action=eventDetails&id=${item.id}' />">
						Details</a></td>
			</tr>
		</c:forEach>
	</table>
	<script>
		flatpickr("#datepicker", {
			enableTime : false,
			dateFormat : "m/j/y",
			altInput : true,
			altFormat : "Y-m-d",
		});

		flatpickr("#timepicker", {
			enableTime : true,
			noCalendar : true,
			dateFormat : "H:i",
			defaultHour : new Date().getHours(),
			defaultMinute : new Date().getMinutes(),
			altInput : true,
			altFormat : "h:i K",
		});
	</script>
</body>
</html>
