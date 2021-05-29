<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
	<head>
		<script>
			function confirmDelete()
			{
				return confirm("Do You Really Want to Delete Billing Info?");
			}
		</script>
	</head>
 <%@include file="header_patient.jsp"%>
    <body>
      
        <div class="row">
		
<%@include file="menu_patient.jsp"%>

<!---- Content Ares Start  -------->
    <div class="col-md-10 maincontent" >
    <!----------------   Menu Tab   --------------->
        <div class="panel panel-default contentinside">
                <div class="panel-heading">My Billing Information</div>
                <!----------------   Panel body Start   --------------->
                <div class="panel-body">
                        <ul class="nav nav-tabs doctor">
                                <li role="presentation"><a href="#doctorlist">Billing List</a></li>
                        </ul>

    <!----------------   Display Billing Data List Start  --------------->
    
        <div id="doctorlist" class="switchgroup">
        <table class="table table-bordered table-hover">
                <tr class="active">
                        <td>Bill No</td>
                        <td>Patient ID</td>
                        <td>Patient Name</td>
                        <td>Pathology</td>
                        <td>Other Charge</td>
                        <td>Misc Charge</td>
                        <td>Entry Date</td>
                        <td>Discharge Date</td>
                </tr>
<%!
		int billNo,patientId;double pathoCharge,otherCharge,miscCharge;
		String patientName,entryDate,disDate;
		PreparedStatement ps;
		ResultSet rs;
%>
<%
	Connection c=(Connection)application.getAttribute("connection");
	int id=Integer.parseInt((String)session.getAttribute("id"));
	PreparedStatement ps=c.prepareStatement("select * from billing where id_no=?",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ps.setInt(1,id);
	rs=ps.executeQuery();
	while(rs.next())
	{
		billNo=rs.getInt(1);
		patientId=rs.getInt(2);
		patientName=rs.getString(3);
		otherCharge=rs.getDouble(4);
		pathoCharge=rs.getDouble(5);
		miscCharge=rs.getDouble(6);
		entryDate=rs.getString(7);
		disDate=rs.getString(8);
		
%>                
                    <tr>
                            <td><%=billNo%></td>
                            <td><%=patientId%></td>
                            <td><%=patientName%></td>
                            <td><%=pathoCharge%></td>
                            <td><%=otherCharge%></td>
                            <td><%=miscCharge%></td>
                            <td><%=entryDate%></td>
                            <td><%=disDate%></td>
                    </tr>
<%
		}
	rs.first();
	rs.previous();
%>
                    </c:forEach>
        </table>
        </div>
    <!----------------   Display Billing Data List Ends  --------------->
   
    <!------ Billing Edit Info Modal Start Here ---------->
                            
<%
	while(rs.next())
	{
		billNo=rs.getInt(1);
		patientId=rs.getInt(2);
		patientName=rs.getString(3);
		otherCharge=rs.getDouble(4);
		pathoCharge=rs.getDouble(5);
		miscCharge=rs.getDouble(6);
		entryDate=rs.getString(7);
		disDate=rs.getString(8);
		
%>              
              <!-- BEGIN Page-container-->
<div style="height:100%" class="page-container">
    <div style="height:100%" class="container-fluid">

        <div style="height:100%" class="row">
            <!-- BEGIN Right Column-->
            <div style="height:100%">

                <!-- BEGIN Channel Doctor Form-->
                <div style="height:100%" class="panel panel-transparent row">
                    <div style="height:100%" class="panel-body col-md-12" >
                        <div style="height:100%" class="tab-content  p-l-20 p-r-20 p-b-5" id="kings">
                            <div style="height:100%" id="sectionA" class="tab-pane fade in active">
                                <div class="p-l-20 p-r-20 p-t-20">
                                  
                                    <h3 class="text-white">Channel Doctor
                                    
                                        

                                    <form class="p-t-15 validate" action="search-result-doctors" method="post">

                                        
                                            
                                                <input name="hospitalId" type="hidden" value="H07">
                                            
                                            
                                        

                                    
                                        
                                        <div class="form-group">
                                            <label for="" class="text-white m-b-10">Doctor Name</label>
                                            <input type="text" name="doctorName" id="plastname"
                                                   class="form-control inner-shadow plastname"
                                                   placeholder="Doctor Last Name or First Name (7 characters)" maxlength="7"
                                                   onkeyup="alphaNumericSpace(this);" autocomplete="false"
                                                   title="Tip: Enter Ranasin - Both Ranasinghe & Ranasingha will be suggested."/>
                                        </div>
                                        <div class="form-group">
                                            <label for="speciality" class="text-white m-b-10">Specialty - 

                                       <select id="speciality" class="select form-control inner-shadow pspecialty" name="specializationId">
                                           <option value="*">Select Specialty</option>
                                           
                                               <option value="105" >Allergy Specialist</option>
                                           
                                               <option value="661" >Anomaly Scan</option>
                                           
                                               <option value="58" >Cardiac Electrophysiologist</option>
                                           
                                               <option value="35" >Cardiaothoracic Surgeon</option>
                                           
                                               <option value="01" >Cardiologist</option>
                                           
                                               <option value="111" >Chest Physician</option>
                                           
                                               <option value="02" >Chest Specialist</option>
                                           
                                               <option value="179" >Child And Adolescent Phychiatrist</option>
                                           
                                               <option value="171" >Clinical Haematologist</option>
                                           
                                               <option value="576" >Clinical Physiologist</option>
                                           
                                               <option value="191" >Clinical Psychologist</option>
                                           
                                               <option value="107" >Consultant Dental Surgeon And Prosthodontist</option>
                                           
                                               <option value="290" >Consultant Dental Surgeon In Restorative Periodontology</option>
                                           
                                               <option value="99" >Consultant Judicial Medicine</option>
                                           
                                               <option value="648" >Dental  Oral And Maxillofacial Surgeon</option>
                                           
                                               <option value="32" >Dental Surgeon</option>
                                           
                                               <option value="145" >Dental Surgeon And General And Laser</option>
                                           
                                               <option value="642" >Dental Surgeon In Prosthodontics And Endodontics</option>
                                           
                                               <option value="04" >Dermatologist</option>
                                           
                                               <option value="197" >Diabetic Educator</option>
                                           
                                               <option value="05" >Dietician</option>
                                           
                                               <option value="45" >Dietician And Nutrician</option>
                                           
                                               <option value="85" >Embryologist</option>
                                           
                                               <option value="151" >Endocrinologist</option>
                                           
                                               <option value="06" >Endocrinologist And Diabetologist</option>
                                           
                                               <option value="07" >Ent Surgeon</option>
                                           
                                               <option value="08" >Eye Surgeon</option>
                                           
                                               <option value="84" >Gastroenterological Surgeon</option>
                                           
                                               <option value="156" >Gastroenterologist</option>
                                           
                                               <option value="602" >Gastroenterologist And Hepatologist</option>
                                           
                                               <option value="09" >Gastroenterologist Surgeon</option>
                                           
                                               <option value="48" >Gastrointestinal Surgeon</option>
                                           
                                               <option value="752" >General And Colorectal Surgeon</option>
                                           
                                               <option value="422" >General Surgeon</option>
                                           
                                               <option value="772" >General Surgeon - Liver Transplant And Hepato</option>
                                           
                                               <option value="10" >Genito Urinary Surgeon</option>
                                           
                                               <option value="230" >Gynaecological Cancer Surgeon</option>
                                           
                                               <option value="427" >Gynaecological Oncologist</option>
                                           
                                               <option value="155" >Gynaecologist And Obstrician</option>
                                           
                                               <option value="172" >Haemato Oncologist</option>
                                           
                                               <option value="12" >Haematologist</option>
                                           
                                               <option value="244" >Lanka Hospital</option>
                                           
                                               <option value="29" >Medical Microbiologist</option>
                                           
                                               <option value="284" >Mycologist</option>
                                           
                                               <option value="229" >Neonatologist</option>
                                           
                                               <option value="31" >Nephrologist</option>
                                           
                                               <option value="67" >Nephrologist And Genaral Physician</option>
                                           
                                               <option value="14" >Neuro Physician</option>
                                           
                                               <option value="55" >Neuro Physiologist</option>
                                           
                                               <option value="13" >Neuro Surgeon</option>
                                           
                                               <option value="39" >Nutritionist</option>
                                           
                                               <option value="159" >Obstetrician And Gynaecologist</option>
                                           
                                               <option value="50" >Occupational Therapist</option>
                                           
                                               <option value="91" >Oncological Surgeon</option>
                                           
                                               <option value="130" >Oncologist</option>
                                           
                                               <option value="03" >Oncologist And Cancer Specialist</option>
                                           
                                               <option value="28" >Oral And Maxillofacial Surgeon</option>
                                           
                                               <option value="42" >Orthodontist</option>
                                           
                                               <option value="15" >Orthopaedic Surgeon</option>
                                           
                                               <option value="710" >Orthopaedic Surgeon And Sports Medicine</option>
                                           
                                               <option value="355" >Paediatric And Adolescents Oncologist</option>
                                           
                                               <option value="89" >Paediatric Cardiologist</option>
                                           
                                               <option value="169" >Paediatric Cardiothoracic Surgeon</option>
                                           
                                               <option value="502" >Paediatric Chest Physician</option>
                                           
                                               <option value="180" >Paediatric Endocrinologist</option>
                                           
                                               <option value="338" >Paediatric Eye Surgeon</option>
                                           
                                               <option value="142" >Paediatric Neonatologist</option>
                                           
                                               <option value="88" >Paediatric Nephrologist</option>
                                           
                                               <option value="94" >Paediatric Neurologist</option>
                                           
                                               <option value="137" >Paediatric Oncologist</option>
                                           
                                               <option value="17" >Paediatric Surgeon</option>
                                           
                                               <option value="16" >Paediatrician</option>
                                           
                                               <option value="143" >Paediatrician And Neonatal Paediatrician</option>
                                           
                                               <option value="78" >Pain Management</option>
                                           
                                               <option value="856" >Pcr Test</option>
                                           
                                               <option value="86" >Pediatric Cardiac Surgeon</option>
                                           
                                               <option value="18" >Physician</option>
                                           
                                               <option value="87" >Physician And Gastro Enterologists</option>
                                           
                                               <option value="34" >Physiotherapist</option>
                                           
                                               <option value="775" >Physiotherapy And Rehabilitation</option>
                                           
                                               <option value="161" >Plastic And Reconstructive Surgeon</option>
                                           
                                               <option value="869" >Plastic Eye Surgery(Cosmetic Consultations Only)</option>
                                           
                                               <option value="19" >Plastic Surgeon</option>
                                           
                                               <option value="20" >Psychiatrist</option>
                                           
                                               <option value="122" >Psychological Counselor</option>
                                           
                                               <option value="36" >Psychologist</option>
                                           
                                               <option value="606" >Psychotherapist/Psychology</option>
                                           
                                               <option value="741" >Psycologist Psycotherapist Professional Counselor</option>
                                           
                                               <option value="33" >Radiologists</option>
                                           
                                               <option value="21" >Rheumatologist</option>
                                           
                                               <option value="24" >S.T.D</option>
                                           
                                               <option value="584" >Sexual Wellness And S. T. D</option>
                                           
                                               <option value="106" >Speech And Language Therapist</option>
                                           
                                               <option value="22" >Speech Therapist</option>
                                           
                                               <option value="114" >Speech Therapist And Audiologist</option>
                                           
                                               <option value="299" >Sports And Exercise Medicine</option>
                                           
                                               <option value="23" >Sports Medicine</option>
                                           
                                               <option value="26" >Surgeon</option>
                                           
                                               <option value="25" >Thoracic Surgeon</option>
                                           
                                               <option value="388" >Transplant Surgeon</option>
                                           
                                               <option value="125" >Urological And Transplant Surgeon</option>
                                           
                                               <option value="200" >Urological Surgeon</option>
                                           
                                               <option value="27" >Urologist</option>
                                           
                                               <option value="128" >Vascular And Transplant Surgeon</option>
                                           
                                               <option value="49" >Vascular Surgeon</option>
                                           
                                               <option value="420" >Venerelogy</option>
                                           
                                               <option value="666" >Venereologist</option>
                                           
                                               <option value="450" >Venereologist And Std And Sexual Health</option>
                                           
                                               <option value="136" >Venereologist Consultant In Sexual Medicine</option>
                                           
                                               <option value="470" >Venereologist/S.T.D</option>
                                           
                                               <option value="366" >Wound Consultation</option>
                                           

                                       </select>

                                        </div>
                                        
                                    

                                        <input name="tid" value="6c0fea5123fb5630d7298e92f9ab552adf96465002999c93b786270b90c312dd" type="hidden">
                                        <input name="modId" value="gen01" type="hidden">
                                        <input name="hospitalType" value="private" type="hidden">
                                        <div class="form-group">
                                            <label for="" class="text-white m-b-10">Date</label>
                                            <input type="text" name="date1"
                                                   class="form-control inner-shadow date-picker" placeholder="Any">
                                        </div>
                                        <input type="hidden" name="tap" id="" value="Private">
                                        <input type="hidden" name="type_of_hospital" id="private_hospital"
                                               value="private_hospital">

                                        <div class="form-group clearfix">
                                            <button id="reset" type="reset" class="btn btn-lg btn-info  m-t-10"
                                                    onclick="dropdownclear()">CLEAR
                                            </button>
                                            <button type="submit" class="btn btn-lg btn-info pull-right m-t-10"
                                                    onClick="return private_validate()" id="submit">SEARCH
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- END Channel Doctor Form-->
                        </div>

                    </div>
                </div>

                <!-- Error message for Required fields -->
                
                <!-- Error message for Required fields end -->


                <div id="showresults"></div>

                <!-- END Footer-->
%>
<!----------------   Modal ends here  --------------->


    <!----------------   Add Billing Info Start   --------------->
                           <!----------------   Add Billing Ends   --------------->
                </div>
           <!----------------   Panel body Ends   --------------->
         </div>
    </div>
	</div>
</div>
	<script src="js/bootstrap.min.js"></script>
	</body>
</html>