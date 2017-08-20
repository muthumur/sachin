<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    


    <%@ page import="com.intellion.business.NurseBO" %>
    <%@ page import="com.intellion.vo.*" %>
    <%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link href="../images/logo.png" rel="icon"/>
        <title>Online Hospital Management System</title>
        <!-- Bootstrap -->
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
        <script src="../js/jquery.js"></script>
        <script type="text/javascript">
                $(document).ready(function()
                {

                	
                        $('#doctorlist').show();
                        $('.doctor li:first-child a').addClass('active');
                        $('.doctor li a').click(function(e){

                                var tabDiv=this.hash;
                                $('.doctor li a').removeClass('active');
                                $(this).addClass('.active');
                                $('.switchgroup').hide();
                                $(tabDiv).fadeIn();
                                e.preventDefault();

                        });


                });
        </script>
    </head>
    <body>
        <div class="container-fluid">
            
        <!--- Header Start -------->
        <div class="row header">

            <div class="col-md-10">
                    <h2 >Hospital Mangement System</h3>
            </div>

            <div class="col-md-2 ">
                <ul class="nav nav-pills ">
                    <li class="dropdown dmenu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Admin <span class="caret"></span></a>
                            <ul class="dropdown-menu ">
                                <li><a href="profile.html">Change Profile</a></li>
                                <li role="separator" class="divider"></li>
                                 <li><a href="index.html">Logout</a></li>
                            </ul>
                     </li>
                </ul>
            </div>
        </div>
	<!--- Header Ends --------->
       
        <div class="row">
		
        <!----- Menu Area Start ------>
        <div class="col-md-2 menucontent">
          
            <a href="#"><h1>Dashboard</h1></a>
                
                <ul class="nav nav-pills nav-stacked">
                  <li role="presentation"><a href="department.html">Department</a></li>
                  <li role="presentation"><a href="doctor.html">Doctors</a></li>
                  <li role="presentation"><a href="patients.html">Patients</a></li>
                  <li role="presentation"><a href="nurse.html">Nurse</a></li>
                  <li role="presentation"><a href="profile.html">Profile</a></li>
                </ul>
        </div>
        <!---- Menu Ares Ends  -------->		
<!---- Content Ares Start  -------->
    <div class="col-md-10 maincontent" >
<!----------------   Menu Tab Start   --------------->
    <div class="panel panel-default contentinside">
        <div class="panel-heading">Manage Nurse</div>
        <!----------------   Panel body Start   --------------->
        <div class="panel-body">
            <ul class="nav nav-tabs doctor">
                    <li role="presentation"><a href="#doctorlist">Nurse List</a></li>
                    <li role="presentation"><a href="#adddoctor">Add Nurse</a></li>
            </ul>

        <!----------------   Display Nurse Data List Start  --------------->
        
        
        <%
			        
			        	
			        
				    NurseBO nurseBO=new NurseBO();
           			List<NurseVO> nurseVOList = nurseBO.getNurseList();
           			
           			System.out.println("nurseVOList size..:"+nurseVOList.size());
           			
           			%>
    
        <div id="doctorlist" class="switchgroup">
            <table class="table table-bordered table-hover">
                <tr class="active">
                        <td>Nurse ID</td>
                        <td>Nurse Name</td>
                        <td>Email</td>
                        <td>password</td>
                        <td>Address</td>
                        <td>Phone No.</td>
                        <td>Options</td>
                </tr>
                  
                    <%
				 	if(null != nurseVOList && nurseVOList.size() > 0)
				 		{
				 		for(int i=0; i<nurseVOList.size(); i++ ){
				 			
				 			NurseVO nurseVO = (NurseVO)nurseVOList.get(i);
			        %>                   
                   <tr>
                           <td><%=nurseVO.getNurseId()%></td>
                           <td><%=nurseVO.getNurseName()%></td>
                           <td><%=nurseVO.getEmail()%></td>
                           <td><%=nurseVO.getPassword()%></td>
                           <td><%=nurseVO.getAddress()%></td>
                           <td><%=nurseVO.getPhone()%></td>
                           <td>
						    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></button>
                            <a  href="#" class="btn btn-danger" ><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                           
						   </td>
                   </tr>
           
           			<%
				 			}
				 		
				 		}
           			
           			%>
                    
            </table>
        </div>
        <!----------------   Display Nurse Data List Ends  --------------->
        
        
        
        
        
          <!------ Edit Nurse Modal Start ---------->
                            
             
              <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                       
                    
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Edit Nurse Information</h4>
                        </div>
                        
                        <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                             <form class="form-horizontal" action="#">
                                    
                                <div class="form-group">
                                    <label  class="col-sm-4 control-label">Nurse ID</label>
                                    <div class="col-sm-4">
                                        <input type="number" class="form-control" name="id" value="" readonly="readonly">
                                    </div>
                                </div>
                                    
                               <div class="form-group">
                        <label  class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                             <input type="text" class="form-control" name="name" placeholder="Name">
                        </div>
                    </div>

                    <div class="form-group">
                      <label class="col-sm-2 control-label">Email</label>
                      <div class="col-sm-10">
                          <input type="Email" class="form-control" name="email" placeholder="Email">
                      </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Password</label>
                        <div class="col-sm-10">
                          <input type="password" class="form-control" name="password" placeholder="Password">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Address</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="address" placeholder="Address">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Phone</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="phone" placeholder="Phone No.">
                        </div>
                   </div>
                               
                                 <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <input type="submit" class="btn btn-primary" value="Update"></button>
                                 </div>
                            </form>
      </div>
                         </div>
                         </div>
                    </div>
                 </div>
               </div>
<!----------------   Modal ends here  --------------->
        
        
        
        
        

        <!----------------   Add Nurse Start   --------------->
        
        <%
			        
				 	int nurseIdMax = nurseBO.getNurseIDMax();
				 	nurseIdMax++;
			        	
			        %>      
        
        <div id="adddoctor" class="switchgroup">
            <div class="panel panel-default">
                <div class="panel-body">
                  <form id="add_nurse" class="form-horizontal" method="post" action="../AddNurse?operation=ADD">
                    
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Nurse Id:</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" name="id" value="<%=nurseIdMax %>" readonly>
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                             <input type="text" class="form-control" name="name" placeholder="Name">
                        </div>
                    </div>

                    <div class="form-group">
                      <label class="col-sm-2 control-label">Email</label>
                      <div class="col-sm-10">
                          <input type="Email" class="form-control" name="email" placeholder="Email">
                      </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Password</label>
                        <div class="col-sm-10">
                          <input type="password" class="form-control" name="password" placeholder="Password">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Address</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="address" placeholder="Address">
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Phone</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="phone" placeholder="Phone No.">
                        </div>
                   </div>

                    <div class="form-group">
                          <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" onclick="onSubmit();" class="btn btn-primary">Add Nurse</button>
                          </div>
                    </div>
                </form>
                </div>
            </div>
        </div>
        <!----------------   Add Nurse Ends   --------------->
        </div>
        <!----------------   Panel body Ends   --------------->
    </div>
<!----------------   Menu Tab Ends   --------------->
    </div>
<!---- Content Ares Ends  -------->
		</div>
	
	<script src="js/bootstrap.min.js"></script>
	<script>
function onSubmit(){
	document.forms["add_nurse"].submit();
}


</script> 
    </body>
</html>