<%@ taglib uri="/struts-tags" prefix="s"%>
<table class="table table-responsive">
	<tr>
		<th>Select</th>
		<th>User Id</th>
		<th>Name</th>
		<th>Status</th>
	</tr>
	
	<s:iterator value="userForm.userList">

		<tr>
<%-- 			<td><s:submit value="id" onclick="loadDoc2(this.val())" class="btn btn-danger"/></td>			
 --%>			<%-- <td><s:submit value="id" onclick="loadDoc2(<s:property value="id" />)" class="btn btn-danger"/></td> --%>
			<td><span class="btn btn-danger"
				onclick="loadDoc2(<s:property value="id" />)"><s:property
						value="id" /></span></td>
			<td><s:property value="id" /></td>
			<td><s:property value="name" /></td>
			<td><s:property value="status" /></td>
		</tr>
	</s:iterator>

</table>