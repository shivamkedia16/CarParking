

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
<%
    String pdate = request.getParameter("pdate");
    String stime = request.getParameter("stime")+":00";
    String phrs = request.getParameter("phrs")+":00";
    String slot_name = request.getParameter("Slot");
    String totalcost = request.getParameter("totalcost");

    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
    timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));

    Date date1 = timeFormat.parse(stime);
    Date date2 = timeFormat.parse(phrs);
    
    long sum = date1.getTime() + date2.getTime();
    String etime = timeFormat.format(new Date(sum));


    System.out.println("start time : " + stime);
    System.out.println("parking hrs : " + phrs);
    System.out.println("End time : " + etime);

    String uid = (String) session.getAttribute("uid");
    String uname = (String) session.getAttribute("uname");
    String umail = (String) session.getAttribute("umail");
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    Statement st1 = con.createStatement();
    Statement st2 = con.createStatement();
    try {
        ResultSet rs = st.executeQuery("SELECT * FROM slot_booking WHERE pdate ='" + pdate + "' AND stime = '" + stime + "' AND slot_name = '" + slot_name + "' ");
        if (rs.next() == true) {
            response.sendRedirect("Book_parking.jsp?Already Booked");
        } else {
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String time = dateFormat.format(date);
            System.out.println("Date and Time : " + time);
            ResultSet rs2 = st2.executeQuery("SELECT count(*) FROM `parking_system`.`slot_booking` where uid = "+ uid + ";");
            int cnt = 0;
            Boolean discount = false;
            while(rs2.next())
            {
                cnt = Integer.parseInt(rs2.getString("count(*)"));
            }
            if(cnt>=5)
            {
                //discount applied
                discount = true;
                totalcost = Integer.toString((4*Integer.parseInt(totalcost))/5);
            }
            int i = st1.executeUpdate("INSERT INTO slot_booking(uname, uid, pdate, stime, phrs, umail, slot_name, time, endtime, pcost) values('" + uname + "','" + uid + "','" + pdate + "','" + stime + "','" + phrs + "','" + umail + "', '" + slot_name + "','" + time + "','"+ etime +"','"+totalcost+"')");
            if (i != 0) {
                if(!discount)
                    response.sendRedirect("Book_parking.jsp?Slot_booked");
                else
                    response.sendRedirect("Book_parking.jsp?Slot_booked_with_discount");
            } else {
                response.sendRedirect("Book_parking.jsp?Failed");
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>

