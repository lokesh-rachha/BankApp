<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Customer Account</title>
<sb:head includeScripts="false" includeScriptsValidation="false" />

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js">
	
</script>

<script type="text/javascript">
	$(function() {
		console.log("Dom working");
		$('#submit').click(function() {
			console.log("click working");
			var userId = $('#userId').val();
			var accNo = $('#accNo').val();
			var accId = $('#accId').val();
			var balance = $('#balance').val();
			var action = $('#action').val();
			var amount = $('#amount').val();
			var pwd = $('#pwd').val();

			var validate = true;
			if (userId == "" || userId == "0") {
				console.log("click=== working");
				$('#userId_span').html("Customer ID is required");
				validate = false;
			}
			if (accNo == "-1") {
				$('#accNo_span').html("Account No is required");
				validate = false;
			}
			if (accId == "") {
				$('#accId_span').html("Account ID is required");
				validate = false;
			}
			if (balance == "") {
				$('#balance_span').html("Balance is required");
				validate = false;
			}
			if (action == "-1") {
				$('#action_span').html("Action is required");
				validate = false;
			}
			if (amount == "" || amount == "0.0") {
				$('#amount_span').html("Amount is required");
				validate = false;
			}
			if (pwd == "") {
				$('#pwd_span').html("Password is required");
				validate = false;
			}
			if (isNaN(userId)) {
				$('#userId_span').html("Customer ID should be numeric");
				validate = false;
			}
			if (isNaN(amount)) {
				$('#amount_span').html("Amount should be numeric");
				validate = false;
			}

			return validate;
		});

		$('#userId').change(function() {
			var userId = $('#userId').val();
			if (userId != -1) {
				loadDoc(userId)
			} else {
				$('#accounts').html("");
			}
		});

	});

	function load2(accid) {
		var id = $(accid).find('option:selected').val();
		/* alert("account "+id); */
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				document.getElementById("accDetails").innerHTML = xhttp.responseText;
			}
		};
		xhttp.open("GET", "ajax_accountsDetails?accNo=" + id, true);
		xhttp.send();
	}

	function loadDoc(userId) {

		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				document.getElementById("accounts").innerHTML = xhttp.responseText;
			}
		};
		xhttp.open("GET", "ajax_accountsList?userId=" + userId, true);
		xhttp.send();
	}
</script>


</head>
<body>

	<jsp:include page="/masterpage/empheader.jsp"></jsp:include>
	<br>

	<div class="panel panel-success col-md-4">
		<div class="panel-heading">Manage Customer Account</div>

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
		<s:form action="manageCustomerAccount" method="post" theme="bootstrap"
			cssClass="well form-vertical">

			<div class="form-group">
				<s:textfield name="userForm.userId" label="Customer ID"
					class="form-control" id="userId" errorPosition="bottom"
					placeholder="Enter Customer ID">
				</s:textfield>
				<font color="red"><span id="userId_span"></span></font>
			</div>

			<div id="accounts"></div>

			<div id="accDetails"></div>

			<div class="form-group">
				<s:select id="action" list="{'Deposite','WithDraw'}"
					label="Select Action" name="userForm.action" headerKey="-1"
					headerValue="Select Action" class="btn btn-default dropdown-toggle"
					data-toggle="dropdown"></s:select>
				<font color="red"><span id="action_span"></span></font>
			</div>

			<div class="form-group">
				<s:textfield id="amount" name="userForm.amount" label="Amount"
					errorPosition="bottom" class="form-control"
					placeholder="Enter Amount">
				</s:textfield>
				<font color="red"><span id="amount_span"></span></font>
			</div>

			<div class="form-group">
				<s:password id="pwd" name="userForm.pwd" label="Password"
					errorPosition="bottom" class="form-control"
					placeholder="Enter Password">
				</s:password>
				<font color="red"><span id="pwd_span"></span></font>
			</div>

			<s:submit id="submit" value="Update Account"
				cssClass="btn btn-success"></s:submit>
		</s:form>
	</div>

</body>
<style>
.errorMessage {
	color: red;
}

a {
	font-weight: bold;
	font-size: medium;
	color: DarkOliveGreen;
}

.hr1 {
	border-color: DarkOliveGreen;
}

body {
	background-color: DarkOliveGreen;
}

.panel {
	margin-left: 33%;
}

.panel-heading {
	font-size: medium;
}

.glyphicon-home {
	color: DarkOliveGreen;
}

#manage {
	background-color: DarkOliveGreen;
	color: honeydew;
}
</style>

</html>