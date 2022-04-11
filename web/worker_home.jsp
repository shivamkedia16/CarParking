<%-- 
    Document   : worker_home
    Created on : 7 Dec, 2021, 7:16:14 PM
    Author     : shiva
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@ page import="Parking_System.findSpecial"%>
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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        if (request.getParameter("Success") != null) {
    %>
    <script>alert('Login Success');</script>
    <%            }
    %>

       
         
       <%
            Connection con = SQLconnection.getconnection();
            Statement st = con.createStatement();
            try {
                String id = (String)request.getSession().getAttribute("id"); 
                ResultSet rs = st.executeQuery("SELECT * FROM workers where id='"+id+"'");
                while (rs.next()) {
                 findSpecial x = new findSpecial();

         %>
         <div class="card">
            <img src="img_avatar.png" alt="Avatar" style="width:100%">
            <div class="container">
            <h4><b>John Doe</b></h4>
            <p>Architect & Engineer</p>
            </div>
        </div>
         <p>Sambhav Jain is my boss.</p>
        <ul>
            <li><%=rs.getString("id")%></li>
            <li><%=rs.getString("name")%></li>
            <li><%=rs.getString("email")%></li>
            <li><%=rs.getString("Rating")%></li>

             <li><%=x.calculate(Integer.parseInt(rs.getString("Specialization")))%></li>
            <li><%=rs.getString("Slot")%></li>
            <li>
            </li>
        </ul>
            
             <form>
                <div class="form-group">
                    &nbsp;&nbsp;<label>Specialization :</label>
                    <input type="checkbox" id="s1" name="s1" value=4>
                    <label for="s1"> dry cleaning</label>
                    <input type="checkbox" id="s2" name="s2" value=2>
                    <label for="s2"> car washing</label>
                    <input type="checkbox" id="s3" name="s3" value=1>
                    <label for="s3"> repair checks</label><br><br>
                </div>
                <div class="form-group">
                    <button type="submit" name="submitBtn" class="btn btn-success btn-md">Submit</button>

                </div>
             </form>
           
            <%                                        }
                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }

                        %>
    </body>
</html>
