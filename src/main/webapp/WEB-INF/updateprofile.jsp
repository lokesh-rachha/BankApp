<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Profile</title>
<sb:head includeScripts="false" includeScriptsValidation="false" />

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js">
	
</script>
<script type="text/javascript">
	$(function() {
		$('#submit').click(function() {

			var name = $('#name').val();
			var gender = $('#gender').val();
			var married = $('#married').val();
			var email = $('#email').val();
			var mobile = $('#mobile').val();
			var city = $('#city').val();
			var pin = $('#pin').val();
			var address = $('#address').val();
			var pwd = $('#pwd').val();

			var validate = true;
			if (name == "") {
				$('#name_span').html("Name is required");
				validate = false;
			}
			if (gender == "-1") {
				$('#gender_span').html("Gender is required");
				validate = false;
			}
			if (married == "-1") {
				$('#married_span').html("Maritual status is required");
				validate = false;
			}
			if (email == "") {
				$('#email_span').html("Email ID is required");
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
			if(pwd == ""){
				$('#pwd_span').html("Password is required");
				validate=false;
			}
			if (isNaN(mobile)) {
				$('#mobile_span').html("Mobile No should be numeric");
				validate = false;
			}
			if (isNaN(pin)) {
				$('#pin_span').html("Pin should be numeric");
				validate = false;
			}
			return validate;

		});
	});
</script>

</head>

<s:if test="%{#session.type=='Customer'}">
	<jsp:include page="/masterpage/custheader.jsp"></jsp:include>
</s:if>
<s:else>
	<jsp:include page="/masterpage/empheader.jsp"></jsp:include>
</s:else>

<br>
<div class="container">
	<div class="row">
		<div class="span4 offset2">
			<div class="panel panel-warning col-md-6">
				<div class="panel-heading">Update Profile</div>
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

				<s:form action="updateProfile" method="post" theme="bootstrap"
					cssClass="well form-vertical">
					<s:textfield name="userForm.userId" label="UserID"
						errorPosition="bottom" class="form-control"
						placeholder="Enter UserID" disabled="true"></s:textfield>

					<div class="form-group">
						<s:textfield id="name" name="userForm.name" label="Name"
							errorPosition="bottom" class="form-control"
							placeholder="Enter Name"></s:textfield>
						<font color="red"><span id="name_span"></span></font>
					</div>

					<div class="form-group">
						<s:select id="gender" list="{'Male','Female'}" label="Gender"
							errorPosition="bottom" name="userForm.gender"
							class="form-control" headerKey="-1" headerValue="Select"
							data-toggle="dropdown">
						</s:select>
						<font color="red"><span id="gender_span"></span></font>
					</div>

					<div class="form-group">
						<s:select id="married"
							list="{'Married','Single','Divorce','Widow'}" label="Married"
							name="userForm.married" errorPosition="bottom"
							class="form-control" headerKey="-1" headerValue="Select"
							data-toggle="dropdown"></s:select>
						<font color="red"><span id="married_span"></span></font>
					</div>

					<div class="form-group">
						<s:textfield id="email" name="userForm.email" label="Email"
							errorPosition="bottom" class="form-control"
							placeholder="Enter Email" requiredLabel="true"></s:textfield>
						<font color="red"><span id="email_span"></span></font>
					</div>

					<div class="form-group">
						<s:textfield id="mobile" name="userForm.mobile" label="Mobile"
							errorPosition="bottom" class="form-control"
							placeholder="Enter Mobile No" requiredLabel="true"></s:textfield>
						<font color="red"><span id="mobile_span"></span></font>
					</div>

					<div class="form-group">
						<s:textfield id="city" name="userForm.city" label="City"
							errorPosition="bottom" class="form-control"
							placeholder="Enter City"></s:textfield>
						<font color="red"><span id="city_span"></span></font>
					</div>

					<div class="form-group">
						<s:textfield id="pin" name="userForm.pin" label="PinCode"
							errorPosition="bottom" class="form-control"
							placeholder="Enter Pin"></s:textfield>
						<font color="red"><span id="pin_span"></span></font>
					</div>

					<div class="form-group">
						<s:textfield id="address" name="userForm.address"
							label="Address" errorPosition="bottom" class="form-control"
							placeholder="Enter Address"></s:textfield>
						<font color="red"><span id="address_span"></span></font>
					</div>

					<div class="form-group">
						<s:password id="pwd" name="userForm.pwd"
							label="Password" errorPosition="bottom" class="form-control"
							placeholder="Enter Password"></s:password>
						<font color="red"><span id="pwd_span"></span></font>
					</div>
					
					<s:submit id="submit" value="Update" cssClass="btn btn-warning"></s:submit>
				</s:form>
			</div>
		</div>
	</div>
</div>

<%-- <jsp:include page="/masterpage/footer.jsp"></jsp:include> --%>

</body>

<style>
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

#update {
	background-color: Chocolate;
	color: honeydew;
}
</style>
</html>