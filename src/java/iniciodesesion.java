/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
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
@WebServlet(urlPatterns = {"/iniciodesesion"})
public class iniciodesesion extends HttpServlet {

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
            out.println("<title>Servlet iniciodesesion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet iniciodesesion at " + request.getContextPath() + "</h1>");
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
         String xd = request.getParameter("coreo");
         String xda = request.getParameter("pas");
         Pattern pattern = Pattern
                .compile("^[^@]+@[^@]+\\.[a-zA-Z]{2,}$");
           Matcher mather = pattern.matcher(xd);
           Pattern pattern1 = Pattern
                .compile("/^[A-Za-z0-9]+$/g");
            Matcher mather1 = pattern1.matcher(xda);
           
        if (mather.find() == true ||mather1.find() == true ) {   
             request.setAttribute("co",request.getParameter("coreo"));
              request.setAttribute("pas",request.getParameter("pas"));
              RequestDispatcher rd;
              rd=request.getRequestDispatcher("iniciarsesion.jsp");
              rd.forward(request, response);  
              System.out.println("si se envian el correo"+xd);
              System.out.println("si se envian el contra"+xda);
        }
     
        else {
            System.out.println("noseenvia");
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
