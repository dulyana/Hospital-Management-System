<%@page import="java.sql.*" %>


<%




        String appid=request.getParameter("appid");

 
        String email=request.getParameter("email");

	String docname=request.getParameter("docname");



        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("update appointment set email=?,docname=? where id=?");
  
      	ps.setString(1,email);
      	ps.setString(2,docname);
      	ps.setInt(1,Integer.parseInt(appid));

	int i =ps.executeUpdate();
  
	if(i>0)

	{
%>

<div style="text-align:center;margin-top:25%">
<font color="blue">
<script type="text/javascript">
function Redirect()
{
    window.location="appointment.jsp";
}
document.write("<h2>Appointment Details Updated Successfully</h2><br><Br>");
document.write("<h3>Redirecting you to home page....</h3>");
setTimeout('Redirect()', 3000);
</script>
</font>
</div>
<%
	}

	ps.close();
	con.commit();	
%>