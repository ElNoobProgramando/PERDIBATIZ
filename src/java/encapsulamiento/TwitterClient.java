package encapsulamiento;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
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
import javax.servlet.http.HttpServletResponseWrapper;

@WebServlet(urlPatterns = {"/TwitterClient"})
public class TwitterClient extends HttpServlet {

     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpServletResponseWrapper responseWrapper = new HttpServletResponseWrapper(response) {
            private final StringWriter sw = new StringWriter();

            @Override
            public PrintWriter getWriter() throws IOException {
                return new PrintWriter(sw);
            }

            @Override
            public String toString() {
                return sw.toString();
            }
        };
        request.getRequestDispatcher("menu.jsp").include(request, responseWrapper);
        String content = responseWrapper.toString();
        System.out.println("Output : " + content);
        response.getWriter().write(content);
    }

}
