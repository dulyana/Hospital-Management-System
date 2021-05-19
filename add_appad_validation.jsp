<%@page import="java.sql.*" %>


<%

        String appid=request.getParameter("appid");


        String email=request.getParameter("email");

	String docname=request.getParameter("docname");


        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("insert into appointment(appid,email,docname) values(?,?,?)");
       
        ps.setInt(1,Integer.parseInt(appid));
      	ps.setString(2,email);
      	ps.setString(3,docname);

	int i=ps.executeUpdate();
  
	if(i>0)

	{
%>
<div style="text-align:center;margin-top:35%">
<font color="green">
<script type="text/javascript">
function Redirect()
{
    window.location="appointmentadmin.jsp";
}
document.write("<h2>appointment Added Successfully</h2><br><Br>");
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