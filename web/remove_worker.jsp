


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("del");

    System.out.println(id);
   
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    try {
        int rs = st.executeUpdate("DELETE FROM workers where id ="+ id);
       
        response.sendRedirect("worker_details.jsp?Success");
      

    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>