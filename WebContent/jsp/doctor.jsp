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
    <!----------------   Menu Tab   --------------->
        <div class="panel panel-default contentinside">
                <div class="panel-heading">Manage Doctor</div>
                <!----------------   Panel body Start   --------------->
                <div class="panel-body">
                        <ul class="nav nav-tabs doctor">
                                <li role="presentation"><a href="#doctorlist">Doctor List</a></li>
                                <li role="presentation"><a href="#adddoctor">Add Doctor</a></li>
                        </ul>

    <!----------------   Display Doctor Data List Start  --------------->
    
        <div id="doctorlist" class="switchgroup">
        <table class="table table-bordered table-hover">
                <tr class="active">
                        <td>Doctor ID</td>
                        <td>Doctor Name</td>
                        <td>Department</td>
                        <td>Phone No.</td>
                        <td>Options</td>
                </tr>
                
                    <tr>
                            <td>111</td>
                            <td>Dharmesh</td>
                            <td>Neurology</td>
                            <td>123456789</td>
                            <td>
                            <a href="#"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" ><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></button></a>
                            <a  href="#" class="btn btn-danger" ><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                            </td>
                    </tr>
                    </c:forEach>
        </table>
        </div>
    <!----------------   Display Doctor Data List Ends  --------------->
   
    <!------ Doctor Edit Info Modal Start Here ---------->
                            
           
              <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                       
                    
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Edit Doctor Information</h4>
                        </div>
                        
                        <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                             <form class="form-horizontal" action="editDoct.jsp" method="post">
                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Doctor Id:</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" name="doctid" placeholder="Doctor ID" value="" readonly="readonly">
                                </div>
                                </div>

                                <div class="form-group">
                                <label  class="col-sm-2 control-label">Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="doctname" placeholder="Name" >
                                </div>
                                </div>

                                <div class="form-group">
                                      <label class="col-sm-2 control-label">Email</label>
                                      <div class="col-sm-10">
                                          <input type="email" class="form-control" name="email" placeholder="Email" >
                                      </div>
                                </div>

                    <div class="form-group">
                          <label class="col-sm-2 control-label">Password</label>
                          <div class="col-sm-10">
                            <input type="password" class="form-control" name="pwd" placeholder="Password" >
                          </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Address</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="add" placeholder="Address" >
                        </div>
                    </div>

                     <div class="form-group">
                        <label  class="col-sm-2 control-label">Phone</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="phon" placeholder="Phone No." >
                        </div>
                    </div>
              
             
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Department</label>
                        <div class="col-sm-10">

                        <select class="form-control" name="dept">
                        <option selected="selected">Depatrtment</option>
                        
                        <option> Neurology</option>
                   
                              
                        </select>
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


    <!----------------   Add Doctor Start   --------------->
    <div id="adddoctor" class="switchgroup">
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-horizontal" action="#" method="post">
                    <div class="form-group">
                    <label  class="col-sm-2 control-label">Doctor Id:</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="doctid" placeholder="Doctor ID" required="required">
                    </div>
                    </div>

                    <div class="form-group">
                    <label  class="col-sm-2 control-label">Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="doctname" placeholder="Name" required="required">
                    </div>
                    </div>

                    <div class="form-group">
                          <label class="col-sm-2 control-label">Email</label>
                          <div class="col-sm-10">
                              <input type="email" class="form-control" name="email" placeholder="Email" required="required">
                          </div>
                    </div>

                    <div class="form-group">
                          <label class="col-sm-2 control-label">Password</label>
                          <div class="col-sm-10">
                            <input type="password" class="form-control" name="pwd" placeholder="Password" required="required">
                          </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Address</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="add" placeholder="Address" required="required">
                        </div>
                    </div>

                     <div class="form-group">
                        <label  class="col-sm-2 control-label">Phone</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="phon" placeholder="Phone No." required="required">
                        </div>
                    </div>
                 
             
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Department</label>
                        <div class="col-sm-10">

                        <select class="form-control" name="dept">
                        <option selected="selected">Select Department</option>
                        
                          <option>   
                            Neurology</option>
                                                           
                        </select>
                        </div>
                    </div>


                    <div class="form-group">
                          <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary">Add Doctor</button>
                          </div>
                    </div>
                </form>

               </div>
        </div>
    </div>
                           <!----------------   Add Doctor Ends   --------------->
                </div>
           <!----------------   Panel body Ends   --------------->
         </div>
    </div>
	</div>
</div>
	<script src="../js/bootstrap.min.js"></script>
	</body>
</html>