<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
	<head>
		<script>
			function confirmDelete()
			{
				return confirm("Do You Really Want to Delete Appoinment?");
			}
		</script>
	</head>
<%@include file="header_patient.jsp"%>
    <body>

       
        <div class="row">
    
<%@include file="menu_patient.jsp"%>
        
<!-------   Content Area start  --------->
<div class="col-md-10 maincontent" >

    <!-----------  Content Menu Tab Start   ------------>
    <div class="panel panel-default contentinside">
        <div class="panel-heading">Manage Appointment</div>

        <!----------------   Panel Body Start   --------------->
        <div class="panel-body">
            <ul class="nav nav-tabs doctor">
                    <li role="presentation"><a href="#doctorlist">Appointment List</a></li>
                    <li role="presentation"><a href="#adddoctor">Add Appointment</a></li>
            </ul>

            <!----------------   Display Department Data List start   --------------->
           
               <div id="doctorlist" class="switchgroup">
                   <table class="table table-bordered table-hover">
                   <tr class="active">
                           <td>Appointment ID</td>
                           <td>Patient email</td>
                           <td>Doctor name</td>
                           
                   </tr>
<%!
		int appid;
		String email;
		String docname;
%>
<%
	Connection c=(Connection)application.getAttribute("connection");
	PreparedStatement ps=c.prepareStatement("select * from appointment",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		appid=rs.getInt(1);
		email=rs.getString(2);
		docname=rs.getString(3);
		
%>
                   <tr>
                           <td><%=appid%></td>
                           <td><%=email%></td>
                           <td><%=docname%></td>
                           <!--<td>
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal<%=appid%>"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></button>
                            <a href="delete_app_validation.jsp?appid=<%=appid%>" class="btn btn-danger" onclick="return confirmDelete()"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                           
						   </td>-->
                   </tr>
<%
	}
	rs.first();
	rs.previous();
%>
           
                  </table>
               </div>  
              <!----------------   Display appointment Data List ends   --------------->
              
              <!------ Edit appointment Modal Start----------> 
                            
<%
	while(rs.next())
	{
		appid=rs.getInt(1);
		email=rs.getString(2);
		docname=rs.getString(3);
		
%>   
              <div class="modal fade" id="myModal<%=appid%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                       
                    
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Edit Appointment Information</h4>
                        </div>
                        
                        <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                             <form class="form-horizontal" action="edit_app_validation.jsp">
                                    
                                <div class="form-group">
                                    <label  class="col-sm-4 control-label">Appointment ID</label>
                                    <div class="col-sm-4">
                                        <input type="number" class="form-control" name="appid" value="<%=appid%>" readonly="readonly">
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label  class="col-sm-4 control-label">Patient email</label>
                                    <div class="col-sm-4">
                                      <input type="text" class="form-control" name="email" value="<%=email%>" >
                                    </div>
                                 </div>

                                 <div class="form-group">
                                       <label class="col-sm-4 control-label">Doctor name</label>
                                       <div class="col-sm-4">
                                         <input type="text" class="form-control" name="docname" value="<%=docname%>">
                                       </div>
                                 </div>
                               
                                
                            </form>
      </div>
                         </div>
                         </div>
                    </div>
                 </div>
               </div>
<%
	}
%>
<!----------------   Modal ends here  --------------->

        
              
              
              <!----------------   Add appointment Start   --------------->
               <div id="adddoctor" class="switchgroup">
                   <div class="panel panel-default">
                       <div class="panel-body">
                           <form class="form-horizontal" action="add_app_validation.jsp">
                            <div class="form-group">
                                <label  class="col-sm-4 control-label">Appointment ID</label>
                                <div class="col-sm-4">
                                  <input type="number" class="form-control" name="appid" placeholder="ID">
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-sm-4 control-label">Patient email</label>
                                <div class="col-sm-4">
                                  <input type="text" class="form-control" name="email" placeholder="Enter Patient email">
                                </div>
                             </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">Doctor name</label>
                                <div class="col-sm-4">
                                   <input type="text" class="form-control" name="docname" placeholder="Enter doctor name">
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-10">
                                  <button type="submit" class="btn btn-primary">Add Appointment</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    </div>
                </div>
                   <!----------------   Add appointment Ends   --------------->
        </div>
        <!----------------   Panel Body Ends   --------------->
    </div>
    <!-----------  Content Menu Tab Ends   ------------>
</div>
<!-------   Content Area Ends  --------->
        </div>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>