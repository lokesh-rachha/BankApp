<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Account</title>
<sb:head includeScripts="false" includeScriptsValidation="false" />

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js">
	
</script>

<script type="text/javascript">
	$(function() {
		$('#submit').click(function() {
			var name = $('#name').val();
			var dob = $('#dob').val();
			var gender = $('#gender').val();
			var married = $('#married').val();
			var occupation = $('#occupation').val();
			var email = $('#email').val();
			var mobile = $('#mobile').val();
			var city = $('#city').val();
			var pin = $('#pin').val();
			var address = $('#address').val();
			var pwd = $('#pwd').val();
			
			var validate = true;
			if (name == "") {
				$('#name_span').slideDown().html("Name is required");
				validate = false;
			}
			if (dob == "") {
				$('#dob_span').html("DOB is required");
				validate = false;
			}
			if (gender == "-1") {
				$('#gender_span').html("Gender is required");
				validate = false;
			}
			if (married == "-1") {
				$('#married_span').html("Maritual Status is required");
				validate = false;
			}
			if (occupation == "") {
				$('#occ_span').html("Occupation is required");
				validate = false;
			}
			if (email == "") {
				$('#email_span').html("Email-ID is required");
				validate = false;
			}
			if (mobile == "") {
				$('#mobile_span').html("Mobile No is required");
				validate = false;
			}
			if (city == "") {
				$('#city_span').html("City is required");
				validate = false;
			}
			if (pin == "") {
				$('#pin_span').html("Pin is required");
				validate = false;
			}
			if (address == "") {
				$('#address_span').html("Address is required");
				validate = false;
			}
			if(pwd==""){
				$('#pwd_span').html("Password is required");
				validate=false;
			}
			if(isNaN(mobile)){
				$('#mobile_span').html("Mobile No should be numeric")
				validate = false;
			}
			if(isNaN(pin)){
				$('#pin_span').html("Pin should be numeric");
				validate = false;
			}

			return validate;
		});
	});
</script>

</head>
<body>

	<jsp:include page="/masterpage/empheader.jsp"></jsp:include>
	<br>
	<div class="panel panel-warning col-md-6">
		<div class="panel-heading">Add Account</div>

		<h4><s:if test="hasActionMessages()">
			<div class="actionmsg">
				<s:actionmessage />
			</div>
		</s:if>

		<s:if test="hasActionErrors()">
			<div class="actionerr">
				<s:actionerror />
			</div>
		</s:if></h4>

		<s:form action="addCustomer" method="post" theme="bootstrap"
			cssClass="well form-vertical" data-toggle="validator">
			<div class="form-group">
				<s:textfield name="userForm.name" label="Name" id="name"
					errorPosition="bottom" class="form-control"
					placeholder="Enter Name" dataerror="name is required">
				</s:textfield>
				<font color="red"><span id="name_span"></span></font>
			</div>
			
			<div class="form-group">
				<label for="dob">DOB</label> <input type="date" class="form-control"
					name="userForm.dob" id="dob">
					<br>
					 <font color="red"><span id="dob_span"></span></font>
			</div>

			<div class="form-group">
				<s:select list="{'Male','Female'}" id="gender" label="Gender"
					name="userForm.gender" headerKey="-1" headerValue="Select"
					class="btn btn-default dropdown-toggle" data-toggle="dropdown">
				</s:select>
				<font color="red"><span id="gender_span"></span></font>
				</div>

				<div class="form-group">
				<s:select list="{'Married','Single','Divorce','Widow'}" id="married"
					label="Married ?" name="userForm.married" headerKey="-1"
					headerValue="Select" class="btn btn-default dropdown-toggle"
					data-toggle="dropdown">
				</s:select>
				<font color="red"><span id="married_span"></span></font>
				</div>
				
				<div class="form-group">
				<s:textfield name="userForm.occupation" label="Occupation"
					id="occupation" errorPosition="bottom" class="form-control"
					placeholder="Enter Occupation">
				</s:textfield>
				<font color="red"><span id="occ_span"></span></font>
				</div>

				<div class="form-group">
				<s:textfield name="userForm.email" label="Email" id="email"
					errorPosition="bottom" class="form-control" requiredLabel="true"
					placeholder="Enter E-mail ID">
				</s:textfield>
				<font color="red"><span id="email_span"></span></font>
				</div>
				
				<div class="form-group">				
				<s:textfield name="userForm.mobile" label="Mobile" id="mobile"
					errorPosition="bottom" class="form-control" requiredLabel="true"
					placeholder="Enter Mobile No">
				</s:textfield>
				<font color="red"><span id="mobile_span"></span></font>
				</div>
				
				<div class="form-group">
				<s:textfield name="userForm.city" label="City" id="city"
					errorPosition="bottom" class="form-control"
					placeholder="Enter City" requiredLabel="true">
				</s:textfield>
				<font color="red"><span id="city_span"></span></font>
				</div>

				<div class="form-group">
				<s:textfield name="userForm.pin" label="Pin"
					errorPosition="bottom" id="pin" class="form-control"
					placeholder="Enter Pin" requiredLabel="true">
				</s:textfield>
				<font color="red"><span id="pin_span"></span></font>
				</div>

				<div class="form-group">
				<s:textfield name="userForm.address" label="Address" id="address"
					errorPosition="bottom" class="form-control"
					placeholder="Enter Address" requiredLabel="true">
				</s:textfield>
				<font color="red"><span id="address_span"></span></font>
				</div>
				
				<div class="form-group">
				<s:password name="userForm.pwd" label="Password" id="pwd"
					errorPosition="bottom" class="form-control"
					placeholder="Enter Password" requiredLabel="true">
				</s:password>
				<font color="red"><span id="pwd_span"></span></font>
				</div>
				

				<s:submit id="submit" value="Add" cssClass="btn btn-warning"></s:submit>
		</s:form>
	</div>
</body>
<style type="text/css">
.errorMessage {
	color: red;
}


a {
	font-weight: bold;
	font-size: medium;
	color: Chocolate;
}

.hr1 {
	border-color: Chocolate;
}

body {
	background-color: Chocolate;
}

.panel {
	margin-left: 23%;
}

.panel-heading {
	font-size: medium;
}

.glyphicon-home {
	color: Chocolate;
}

#add {
	background-color: Chocolate;
	color: honeydew;
}
</style>
</html>