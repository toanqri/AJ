/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sample.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.session.UserSessionBeanRemote;

/**
 *
 * @author Suzy
 */
public class LoginServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            boolean bErr = false;
            if (username.trim().length() <= 0) {
                bErr = true;
                request.setAttribute("usernameErr", "Please enter username!!!");
            }
            if (password.length() <= 0) {
                bErr = true;
                request.setAttribute("passwordErr", "Please enter password!!!");
            }
            if (bErr) {
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            } else {
                try {
                    Context context = new InitialContext();
                    Object obj = context.lookup("UserJNDI");
                    UserSessionBeanRemote poji = (UserSessionBeanRemote) obj;
                    boolean result = poji.checkLogin(username, password);
                    String url = "invalid.html";
                    if (result) {
                        boolean role = poji.checkRole(username);
                        if (role) {
                            url = "home.jsp";
                            HttpSession session = request.getSession();
                            session.setAttribute("USER", username);
                        } else {
                            response.sendRedirect("permission.html");
                            return;
                        }
                    }
                    response.sendRedirect(url);
                } catch (NamingException ex) {
                    log(ex.getMessage());
                }
            }
        } finally {
            out.close();
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
