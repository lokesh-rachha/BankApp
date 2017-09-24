<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change User Status</title>
<sb:head includeScripts="false" includeScriptsValidation="false" />

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js">
	
</script>

<script>
	$(function() {

		$('#search').click(
				function() {
					var user_Id = $('#user_Id').val();
					var name = $('#name').val();
					var user_Type = $('#user_Type').val();

					if (user_Id == "" && name == "") {
						$('#required').slideDown().html(
								"UserId or Name must be filled out");
					} else {
						$('#required').slideDown().html("");
						loadDoc(user_Id, name, user_Type);
					}
					return false;
				});

		$('#submit').click(function() {

			var userId = $('#userId').val();
			var pwd = $('#pwd').val();
			var type = $('#type').val();
			var status=$('#status').val();

			var checkEmpty = true;
			if (userId == "" || userId == "0") {
				$('#userId_span').html("User ID is required")
				checkEmpty = false;
			}
			if (pwd == "") {
				$('#pwd_span').html("Password is required");
				checkEmpty = false;
			}
			if(type == ""){
				$('#type_span').html("Type is required");
				checkEmpty = false;
			}
			if(status == "-1"){
				$('#status_span').html("Status is required");
				checkEmpty = false;
			}

			return checkEmpty;
		});
	});

	function loadDoc(user_Id, name, user_Type) {
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				document.getElementById("userList").innerHTML = xhttp.responseText;
			}
		};
		xhttp.open("GET", "ajax_matchedUserList?userId=" + user_Id + "&name="
				+ name + "&userType=" + user_Type, true);
		xhttp.send();
	}

	function loadDoc2(user_Id) {
		var userId = document.getElementById("userId");
		userId.value = user_Id;

		var type = document.getElementById("type");
		var user_Type = document.getElementById("user_Type");
		type.value = user_Type.value;

	}
</script>

</head>

<body>
	<jsp:include page="/masterpage/empheader.jsp"></jsp:include>
	<br>

	<div class="container">
		<div class="panel panel-danger col-md-4" id="panel1">
			<div class="panel-heading">Change Status</div>

			<h4>
				<s:if test="hasActionMessages()">
					<div class="actionmsg">
						<s:actionmessage />
					</div>
				</s:if>
				<s:if test="hasActionErrors()">
					<div class="actionerr">
						<s:actionerror />
					</div>
				</s:if>
			</h4>

			<div id="required" style="color: red; font-weight: bold;" ></div>
			<s:form method="post" theme="bootstrap" cssClass="well form-vertical">

				<div class="form-group">
					<s:textfield id="user_Id" label="User ID" class="form-control"
						placeholder="Enter User ID">
					</s:textfield>
					<font color="red"><span id="user_Id_span"></span></font>
				</div>

				<div class="form-group">
					<s:textfield id="name" label="Name" errorPosition="bottom"
						class="form-control" placeholder="Enter Name">
					</s:textfield>
					<font color="red"><span id="name_span"></span></font>
				</div>

				<div class="form-group">
					<s:select id="user_Type" list="{'Customer','Employee'}"
						label="User Type" errorPosition="bottom"
						class="btn btn-default dropdown-toggle" data-toggle="dropdown">
					</s:select>
					<font color="red"><span id="user_Type_span"></span></font>
				</div>

				<s:submit id="search" value="Search" cssClass="btn btn-danger"></s:submit>
			</s:form>
		</div>
	</div>
	<s:form id="myform" name="myform" action="changeStatus" method="post"
		theme="bootstrap" cssClass="well form-search form-horizontal">

		<div class="row">
			<div class="col-sm-4 form-group">
				<s:textfield id="userId" value="" name="userForm.userId"
					errorPosition="bottom" class="form-control" readonly="true">
				</s:textfield>
				<font color="red"><span id="userId_span"></span></font>
			</div>

			<div class="col-sm-4 form-group">
				<s:textfield id="type" name="userForm.type"
					errorPosition="bottom" class="form-control" readonly="true">
				</s:textfield>
				<font color="red"><span id="type_span"></span></font>
			</div>

			<div class="col-sm-4 form-group">
				<s:select id="status" list="{'Active','Inactive','Lock'}"
					name="userForm.status" errorPosition="bottom" headerKey="-1" headerValue="Select"
					class="btn btn-default dropdown-toggle" data-toggle="dropdown">
				</s:select>
				<font color="red"><span id="status_span"></span></font>
			</div>
		</div>

		<div id="userList">
			<table class="table table-responsive">
				<tr>
					<th>Select</th>
					<th>User Id</th>
					<th>Name</th>
					<th>Status</th>
				</tr>

			</table>
		</div>
		<br>

		<div class="row center-block">
			<div class="col-sm-2 form-group"></div>
			<div class="col-sm-4 form-group">
				<s:password id="pwd" name="userForm.pwd" label="Password"
					errorPosition="bottom" class="form-control">
				</s:password>
				<font color="red"><span id="pwd_span"></span></font>
			</div>
			<div class="col-sm-1 form-group">
				<s:submit value="Change Status" id="submit" class="btn btn-danger"></s:submit>
			</div>
		</div>
	</s:form>

</body>

<style>

 .errorMessage {
	color: red;
}
 
a {
	font-weight: bold;
	font-size: medium;
	color: Maroon;
}

.hr1 {
	border-color: Maroon;
}

body {
	background-color: Maroon;
}

#panel1 {
	margin-left: 33%;
}

.panel-heading {
	font-size: medium;
}

.glyphicon-home {
	color: Maroon;
}

#changestatus {
	background-color: Maroon;
	color: honeydew;
}
</
html
>
