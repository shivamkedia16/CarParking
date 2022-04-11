/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parking_System;

 import java.sql.ResultSet;
import DBconnection.SQLconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author JAVA-JP
 */
public class Worker_edit extends HttpServlet {

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
        String name=null,mail=null,rating=null,slot=null,pass=null,id=null;
        try (PrintWriter out = response.getWriter()) {
        Connection con = SQLconnection.getconnection();
            Statement st = con.createStatement();
            try {
                id = (String)request.getSession().getAttribute("uid"); 
                System.out.println(id);
                ResultSet rs = st.executeQuery("SELECT * FROM workers where id='"+id+"'");
                while (rs.next()) {
                 findSpecial x = new findSpecial();
                 System.out.println("here2");
                 name=rs.getString("name");
                 mail=rs.getString("email");
                rating= rs.getString("rating");
                 slot=rs.getString("slot");
                 pass=rs.getString("password");
                }
            }
              
            catch (SQLException ex) {
                   ex.printStackTrace();
                            }
            String s1 = request.getParameter("s1");
            String s2 = request.getParameter("s2");
            String s3 = request.getParameter("s3");
            if(s1==null)
                s1="0";
            if(s2==null)
                s2="0";
             if(s3==null)
                s3="0";
            System.out.println(s1 + "   "+s2+"   "+s3);
           
            String total=String.valueOf(Integer.parseInt(s1)+Integer.parseInt(s2)+Integer.parseInt(s3));
          System.out.println("name" + name + "email" + mail + "rating"+ rating +  "specialization" + total + "slot" + slot);

            Connection conn = SQLconnection.getconnection();
            //String message = null;

            try {
                Statement st2 = conn.createStatement();
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

                    String sql ="UPDATE workers\n"+"SET name= ? ,email= ? ,rating= ? ,slot= ? ,password= ? ,specialization= ? \nWHERE id= ? ";                       
                   
                    PreparedStatement statement = conn.prepareStatement(sql);
                     statement.setString(1, name);
                    statement.setString(2, mail);
                    statement.setString(3, rating);
                    statement.setString(4, slot);
                    statement.setString(5, pass);
                    statement.setString(6, total);
                    statement.setString(7, id);
                     System.out.println(statement);
                    int row = statement.executeUpdate();
                    if (row > 0) {

                        response.sendRedirect("w_details.jsp?Edit_Success");
                    } else {
                        response.sendRedirect("w_details.jsp?Edit_Failed");
                    }
                
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

        } catch (SQLException ex) {
            Logger.getLogger(Worker_edit.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
