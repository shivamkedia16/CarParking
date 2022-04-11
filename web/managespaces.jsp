
<%@ page import="Parking_System.findSpecial"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Online Parking Booking System</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <!-- Facebook and Twitter integration -->
        <meta property="og:title" content=""/>
        <meta property="og:image" content=""/>
        <meta property="og:url" content=""/>
        <meta property="og:site_name" content=""/>
        <meta property="og:description" content=""/>
        <meta name="twitter:title" content="" />
        <meta name="twitter:image" content="" />
        <meta name="twitter:url" content="" />
        <meta name="twitter:card" content="" />

        <link rel="shortcut icon" href="favicon.ico">
        <link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">
        <!-- Animate.css -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Icomoon Icon Fonts-->
        <link rel="stylesheet" href="css/icomoon.css">
        <!-- Bootstrap  -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <!-- Flexslider  -->
        <link rel="stylesheet" href="css/flexslider.css">
        <!-- Flaticons  -->
        <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
        <!-- Owl Carousel -->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <!-- Theme style  -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Modernizr JS -->
        <script src="js/modernizr-2.6.2.min.js"></script>
    </head>
     <%
        if (request.getParameter("Register_Success") != null) {
    %>
    <script>alert('Worker Added');</script>
    <%            }
    %>
    <%
        if (request.getParameter("Register_Failed") != null) {
    %>
    <script>alert('Worker Registration Failed');</script>
    <%            }
    %>
    <style>

        #customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            font-size: 20px;
            border-collapse: collapse;
            width: 100%;
        }

        #customers td, #customers th {
            border: 2px solid black;
            align:"center";  cellpadding:"0"; cellspacing:"2";
            padding: 15px;
        }


        #customers th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #1DA1F2;
            color: white;
        }
    </style>
    <%
        if (request.getParameter("Register_Failed") != null) {
    %>
    <script>alert('Worker_Added');</script>
    <%            }
    %>
    <%
        if (request.getParameter("Mail_Id_Exists") != null) {
    %>
    <script>alert('This Mail_ID already exist');</script>
    <%            }
    %>
     <%
        if (request.getParameter("Worker_Already_Assigned") != null) {
    %>
    <script>alert('This slot has been already assigned to a worker');</script>
    <%            }
    %>
    <%
        if (request.getParameter("Success") != null) {
    %>
    <script>alert("Deleted");</script>
    <%            }
    %>
    <body>
        <div id="colorlib-page">
            <a class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
            <aside id="colorlib-aside" role="complementary" class="border js-fullheight">
                <h1 id="colorlib-logo"></h1>
                <nav id="colorlib-main-menu" role="navigation">
                    <ul>
                        
                        <li ><a href="Admin_Home.jsp">Home</a></li>
                        <li><a href="parking_cost.jsp">Parking Cost</a></li>
                        <li><a href="user_details.jsp">User Details</a></li>
                        <li><a href="worker_details.jsp">Worker Details</a></li>
                        <li><a href="view_bookings.jsp">View Bookings</a></li>
                        <li class="colorlib-active"><a href="managespaces.jsp">Manage Parkings</a></li>
                        <li><a href="index.html">Logout</a></li>
                    
                    </ul>
                </nav>
            </aside>
            <div id="colorlib-main">
                <div class="colorlib-contact">
                    <div class="colorlib-narrow-content">
                        <div class="row">
                            <div class="col-md-12 animate-box" data-animate-effect="fadeInLeft">
                                <h2 class="colorlib-heading">Online parking Booking System</h2>
                            </div>
                        </div>
                        <div class="row">
                            <center><h2>Location Details</h2></center>
                            <center><a href="space_addition.jsp" class="btn btn-success btn-md"><center>ADD NEW LOCATION</center></a></center>
                            <br>                              </br>
                            <div class="col-lg-12">
                                <table id="customers">
                                    <tr>
                                        <th>Location</th>
                                        <th>Total Available Slots</th>
                                        <th>Active slots</th>
                                        <th>View slots</th>
                                        <th>Remove</th>
                                       
                                    </tr>
                                    <%
                                        Connection con = SQLconnection.getconnection();
                                        Statement st = con.createStatement();
                                        try {
                                            ResultSet rs = st.executeQuery("SELECT * FROM spaces ");
                                            while (rs.next()) {
                                             

                                    %>
                                   
                                    
                                    <tr>
                                        <td><%=rs.getString("location")%></td>
                                        <td><%=rs.getString("slot_available")%></td>
                                        <td><%=rs.getString("slot_active")%></td>
                                       
                                        
                                        
                                        <td>
                                        <form  action="manageslots.jsp" method="post">
                                            
                                            <div class="form-group btn-container">
                                                <button type="submit" value="<%=rs.getString("location")%>" name="loc" class="btn btn-success btn-md">View Details</button>&nbsp;&nbsp;&nbsp;&nbsp;
                                            </div>
                                        </form>
                                        </td>
                                         <td>
                                        <form  action="removeslots.jsp" method="post">
                                            
                                            <div class="form-group btn-container">
                                                <button type="submit" value="<%=rs.getString("location")%>" name="del" class="btn btn-success btn-md">Delete</button>&nbsp;&nbsp;&nbsp;&nbsp;
                                            </div>
                                        </form>
                                        </td>
                                    </tr>
                                    <%                                        }
                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                        }

                                    %>
                                    
                                </table>
                                    <br> </rb> 
                                
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
  
        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <!-- jQuery Easing -->
        <script src="js/jquery.easing.1.3.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Waypoints -->
        <script src="js/jquery.waypoints.min.js"></script>
        <!-- Flexslider -->
        <script src="js/jquery.flexslider-min.js"></script>
        <!-- Sticky Kit -->
        <script src="js/sticky-kit.min.js"></script>
        <!-- Owl carousel -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- Counters -->
        <script src="js/jquery.countTo.js"></script>
        <!-- MAIN JS -->
        <script src="js/main.js"></script>
    </body>
</html>
