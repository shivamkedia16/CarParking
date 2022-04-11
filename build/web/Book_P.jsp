

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.lang.String"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
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
        <link rel="stylesheet" href="booking/booking.css">
        <!-- Modernizr JS -->
        <script src="js/modernizr-2.6.2.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

    </head>

    <script>
        $(document).ready(function () {
            $('.slectOne').on('change', function () {
                $('.slectOne').not(this).prop('checked', false);
                $('#result').html($(this).data("id"));
                if ($(this).is(":checked"))
                    $('#result').html($(this).data("id"));
                else
                    $('#result').html('Empty...!');
            });
        });
    </script>
    <body>
        <div id="colorlib-page">
            <a class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
            <aside id="colorlib-aside" role="complementary" class="border js-fullheight">
                <h1 id="colorlib-logo"></h1>
                <nav id="colorlib-main-menu" role="navigation">
                    <ul>
                        <li><a href="User_Home.jsp">Home</a></li>
                        <li><a href="parking_cost1.jsp">Parking Cost</a></li>
                        <li class="colorlib-active"><a href="Book_parking.jsp">Book Parking</a></li>
                        <li><a href="your_bookings.jsp">Your Bookings</a></li>
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
                            <center><h2>Book Parking Slot</h2></center>
                            <br><br>
                            <form  action="slot_booking.jsp" method="post">

                                <%
                                    
                                    String loc=request.getParameter("loc");
                                    String pdate = request.getParameter("date");
                                    String stime = request.getParameter("stime");
                                    String phrs = request.getParameter("phrs");
                                    System.out.println(phrs);
                                    System.out.println(stime);

                                    int pcost = 0;
                                    int totalcost = 0;

                                    String phrs1 = phrs + ":00";
                                    String stime1 = stime + ":00";
                                    String phrs2 = phrs1 + ":00";

                                    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
                                    timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));

                                    Date date1 = timeFormat.parse(stime1);
                                    Date date2 = timeFormat.parse(phrs2);

                                    long sum = date1.getTime() + date2.getTime();
                                    String etime = timeFormat.format(new Date(sum));

                                    System.out.println("start time : " + stime1);
                                    System.out.println("parking hrs : " + phrs2);
                                    System.out.println("End time : " + etime);

                                    Connection con = SQLconnection.getconnection();
                                    Statement st2 = con.createStatement();

                                    try {
                                        ResultSet rt = st2.executeQuery("SELECT * FROM parking_cost");
                                        while (rt.next()) {
                                            pcost = rt.getInt("cost");
                                            System.out.println(pcost);
                                        }
                                        int hrs = Integer.parseInt(phrs);
                                        totalcost = pcost * hrs;

                                        System.out.println(totalcost);

                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }
                                %>
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-10 col-md-offset-1 col-md-pull-1 animate-box" data-animate-effect="fadeInLeft">
                                            <div class="form-group">
                                                &nbsp;&nbsp;<label>Date :</label>
                                                <input type="date" class="form-control" name="pdate" value="<%=pdate%>" readonly="">
                                            </div>
                                            <div class="form-group">
                                                &nbsp;&nbsp;<label>Start Time :</label>
                                                <input type="text" name="stime" class="form-control" value="<%=stime%>"readonly="">
                                            </div>
                                            <div class="form-group">
                                                &nbsp;&nbsp;<label>Parking Hours :</label>
                                                <input type="text" name="phrs" class="form-control" value="<%=phrs1%>"readonly="">
                                            </div>
                                            <div class="form-group">
                                                &nbsp;&nbsp;<label>Parking cost in Rupees :</label>
                                                <input type="text" name="totalcost" class="form-control" value="<%=totalcost%>"readonly="">
                                            </div>
                                            <div class="form-group">
                                                &nbsp;&nbsp;<label>Payment Mode :</label><br>
                                                &nbsp;&nbsp;Cash&nbsp;&nbsp;<input type="radio" id="cash" value="Cash" checked="" />&nbsp;&nbsp;&nbsp;&nbsp;
                                                UPI&nbsp;&nbsp;<input type="radio" value="UPI" disabled="" />&nbsp;&nbsp;&nbsp;&nbsp;
                                                Credit Card&nbsp;&nbsp;<input type="radio" value="Credit cards" disabled="" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <br><br><br><br><br>
                                     <center><h2>Choose Slot</h2></center>
                                    <table id="seatsBlock"a>
                                        <p id="notification"></p>
                                        <tr>
                                            <td></td>
                                            <td style="color: black;">1</td>
                                            <td style="color: black;">2</td>
                                            <td style="color: black;">3</td>
                                            <td style="color: black;">4</td>
                                            <td style="color: black;">5</td>
                                
                                            <td style="color: black;">6</td>
                                            <td style="color: black;">7</td>
                                            <td style="color: black;">8</td>
                                            <td style="color: black;">9</td>
                                            <td style="color: black;">10</td>
                                        </tr>
                                      

                                        <%
                                            String slot_name;

                                            ArrayList<String> s1 = new ArrayList<>();
                                            Statement st = con.createStatement();
                                            Statement st1 = con.createStatement();
                                            Statement st4 = con.createStatement();
                                  
                                            ResultSet rs1 = null;
                                            ResultSet rs2 = null;
                                            try {
                                                rs1 = st1.executeQuery("SELECT * FROM slot_booking WHERE pdate ='" + pdate + "' AND  '" + stime + ":00' BETWEEN stime AND endtime ");
                                                while (rs1.next()) {
                                                    s1.add(rs1.getString("slot_name"));
                                                    //System.out.println(s1);
                                                }
                                                rs2 = st4.executeQuery("SELECT * FROM slot_booking WHERE pdate ='" + pdate + "' AND  '" + etime + "' BETWEEN stime AND endtime ");
                                                while (rs2.next()) {
                                                    s1.add(rs2.getString("slot_name"));
                                                    System.out.println(s1);
                                                }
//                                               
                                       
                                            
                                            
                                            Statement st3 = con.createStatement();
                                             Statement st5 = con.createStatement();
                                             Statement st6 = con.createStatement();
                                            ResultSet rt3 = st3.executeQuery("SELECT * FROM disabled where location="+"'"+loc+"'");
                                            ResultSet rt4= st5.executeQuery("SELECT * FROM spaces Where location="+"'"+loc+"'");
                                          
                                            rt4.next();
                      
                                            while (rt3.next()) {
                                                s1.add("Slot "+rt3.getInt("slot_no"));
                                                System.out.println(s1);
                                              
                                            }
                                           
                                            
//                                               
                                            int cnt=64;
                                            char ch=(char)cnt;
                                            int x=rt4.getInt("slot_available")/10+1;
                                            int y=rt4.getInt("slot_available");
                                            int i=1,j=1;
                                            while(--x>=0)
                                            {
                                                j=1;
                                            
                                                %><tr><%
                                            while(i<=y && j<=10)
                                            {
                                                   if(i%10==1)
                                                   {    ch++;
                                       %>
                                        
                                            <td style="color: black;"><%=ch%></td>
                                            <%}%><td>
                                                 
                                                       <% //yResultSet rt5= st6.executeQuery("SELECT * FROM workers Where location="+"'"+loc+"',slot='"+i+"'");rt5.next();
                                                       System.out.println("here");
                                                            System.out.println("SELECT * FROM workers Where location="+"'"+loc+"',slot='"+i+"'");
                                                           if (!(s1.contains("Slot "+i))){
                                                           %>
                                                       
                                                      <input type="checkbox" class="slectOne" name="Slot" value<%="Slot "+i%> data-id<%="Slot"+i%>>
                                                     <%  }
                                                     else{%>
                                                     <input type="checkbox" disabled="disabled" class="slectOne" name="Slot" value<%="Slot "+i%> data-id<%="Slot"+i%>>
                                                      <%}%>
                                            </td>
                                            <%i++;j++;}%>
                                            </tr><%}%>
                                            
                                        <%
                                                
                                            } catch (Exception ex) {
                                                ex.printStackTrace();
                                            }
                                        %>
                                    </table>
  
                                    <span id="result" style="color: black;"></span>
                                    <br><br><br>
                                    <div class="form-group">
                                                &nbsp;&nbsp;<label>Services :</label>
                                                <input type="checkbox"  id="s1" name="s1" value=4>
                                                <label for="s1"> dry cleaning(+20)</label>
                                                <input type="checkbox" id="s2" name="s2" value=2>
                                                <label for="s2"> car washing                (+40)     </label><br>
                                                <input type="checkbox" id="s3" name="s3" value=1>
                                                <label for="s3"> repair checks(+100)</label><br><br>
                                            </div>
                                    <div class="form-group">
                                        <br><br><br>
                                        <button type="submit" class="btn btn-success btn-md">Book</button>
                                    </div>
                                </div>
                            </form>
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

