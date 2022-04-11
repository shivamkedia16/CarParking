/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parking_System;

import DBconnection.SQLconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author JAVA-JP
 */
public class AddSpace extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("loc_name");
            String slots = request.getParameter("slots");
      
          //  System.out.println("name" + name + "email" + mail + "rating"+ rating +  "specialization" + specialization + "slot" + slot);

            Connection conn = SQLconnection.getconnection();
            //String message = null;

            try {
                Statement st = conn.createStatement();
                System.out.println("here");

//                ResultSet rs = st.executeQuery("Select * from workers where email ='" + mail + "'");
//                ResultSet rs2 = st.executeQuery("Select * from workers where slot ='" + slot + "'");
//                if (rs.next()) {
//
//                    response.sendRedirect("Worker_Addition.jsp?msg=Mail_Id_Exists");
//                } 
//                else if (rs2.next()) {
//
//                    response.sendRedirect("Worker_Addition.jsp?msg=Worker_Already_Assigned");
//                } 
//                
//                else {

                    String sql = "insert into spaces(location, slot_available, slot_active) values (?, ?, ?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, name);
                    statement.setString(2, slots);
                    statement.setString(3, slots);
                  
                    
                    int row = statement.executeUpdate();
                    if (row > 0) {

                        response.sendRedirect("managespaces.jsp?Register_Success");
                    } else {
                        response.sendRedirect("managespaces.jsp?Register_Failed");
                    }
                
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

        }
    }

}
