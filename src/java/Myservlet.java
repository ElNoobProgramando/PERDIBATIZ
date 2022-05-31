/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author yayah
 */

@WebServlet(urlPatterns = {"/Myservlet"})
public class Myservlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Myservlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Myservlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String titu = request.getParameter("titu");
         String queperd = request.getParameter("queperd");
         String img = request.getParameter("imgb64");
          String luc = request.getParameter("luc");
          String fecha = request.getParameter("fecha");
         
          Pattern pattern = Pattern
                .compile("^[a-zA-Z]+$");
           Matcher mather = pattern.matcher(titu);
           
           
           
           Pattern pattern1 = Pattern
                .compile("^[a-zA-Z]+$");
            Matcher mather1 = pattern1.matcher(queperd);
            
            
        if (mather.find() == true){   
             request.setAttribute("titu",request.getParameter("titu"));
              request.setAttribute("queperd",request.getParameter("queperd"));
              request.setAttribute("luc",request.getParameter("luc"));
              request.setAttribute("fecha",request.getParameter("fecha"));
              request.setAttribute("servletMsg",request.getParameter("imgb64"));
              RequestDispatcher rd;
              rd=request.getRequestDispatcher("guardarencontrado.jsp");
              rd.forward(request, response);  
              System.out.println("si se envian el titu"+titu);
              System.out.println("si se envian el queperdio"+queperd);
              System.out.println("si se envian el luc"+luc);
              System.out.println("si se envian el fecha"+fecha);
        }
     
        else {
            System.out.println("noseenvia");
              RequestDispatcher rds;
              rds=request.getRequestDispatcher("paginaderror2.html");
              rds.forward(request, response);  
                   }
         
        
        

        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
