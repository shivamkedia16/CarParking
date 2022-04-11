
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String uploc= request.getParameter("ll");
    System.out.println("ssss+"+ uploc);
    Connection con = null;
    Statement st = null;
    Statement st1 = null;
    Connection conn = SQLconnection.getconnection();
    Statement sto = conn.createStatement();
    st = conn.createStatement();
    String loc=(String)session.getAttribute("uloc");
    try {
        int i = sto.executeUpdate("UPDATE spaces SET slot_available='"+Integer.valueOf(uploc) +"' where location = '"+loc+"' ");
        //System.out.println("Test print parking Cost ==" + pcost);
        
        if (i != 0) {
                response.sendRedirect("slot_addition.jsp?Slot_updated");
            } else {

                System.out.println("failed");
                response.sendRedirect("slot_addition.jsp?Failed");
            }
        
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
