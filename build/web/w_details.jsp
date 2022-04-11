
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="Parking_System.findSpecial"%>
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
    <body>
        <div id="colorlib-page">
            <a class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
            <aside id="colorlib-aside" role="complementary" class="border js-fullheight">
                <h1 id="colorlib-logo"></h1>
                <nav id="colorlib-main-menu" role="navigation">
                    <ul>
                          <li class="colorlib-active"><a href="w_home2.jsp">Home</a></li>
                        <li><a href="w_details.jsp">See your Details</a></li>
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
                            <center><h2>Worker Details</h2></center>
                            
                            <div class="col-md-1">
                            </div>
                        
                              <%
        if (request.getParameter("Edit_Success") != null) {
    %>
    <script>alert('Edit Success');</script>
    <%            }
    %>
    <%
               

            Connection con = SQLconnection.getconnection();
            Statement st = con.createStatement();
            try {
                String id = (String)request.getSession().getAttribute("uid"); 
                System.out.println(id);
                ResultSet rs = st.executeQuery("SELECT * FROM workers where id='"+id+"'");
                while (rs.next()) {
                 findSpecial x = new findSpecial();
                 System.out.println("here");
            
                    

         %>
       
            <div class="workerdetails" style="width:800px; margin:5px 70px 70px 470px ;">
                <img src="images/worker.jpg"/>
                <p class="workertext"> Worker ID: <%=rs.getString("id")%> <br>
                 Name: <%=rs.getString("name")%> <br>
                 Email: <%=rs.getString("email")%> <br>
                 Rating: <%=rs.getString("rating")%> <br>
                 Services: <%=x.calculate(Integer.parseInt(rs.getString("Specialization")))%> <br>
                 Slot: <%=rs.getString("slot")%></p>
            </div>
            <div class="col-md-11 col-md-push-1">
                                <div class="row">
                                    <div class="col-md-10 col-md-offset-1 col-md-pull-1 animate-box" data-animate-effect="fadeInLeft">
                                        <form action="Worker_edit" method="post">
                                            <div class="form-group">
     
                                                <label>Edit Services :</label>
                                                <input type="checkbox" id="s1" name="s1" value=4>
                                                <label for="s1"> dry cleaning</label>
                                                <input type="checkbox" id="s2" name="s2" value=2>
                                                <label for="s2"> car washing</label>
                                                <input type="checkbox" id="s3" name="s3" value=1>
                                                <label for="s3"> repair checks</label><br><br>
                                                 <div class="form-group">
                                                <button type="submit" name="submitBtn" class="btn btn-success btn-md">EDIT</button>
                                            </div>
                                            </div>
                                           
                                           
                                            
                                            
                                        </form>
                                        
                                    </div>
                                </div>
                            </div>
           </div>
        </div> 
    </div>
</div>
       
            
    </body>
    
            <%                                        }
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }

                        %>
    
                          

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
