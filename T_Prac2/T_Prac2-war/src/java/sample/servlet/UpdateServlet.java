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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.session.MovieSessionBeanRemote;

/**
 *
 * @author Suzy
 */
public class UpdateServlet extends HttpServlet {

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
            String title = request.getParameter("txtTitle");
            String year = request.getParameter("txtYear");
            String duration = request.getParameter("txtDuration");
            String genre = request.getParameter("txtGenre");
            String studio = request.getParameter("txtStudio");
            String searchValFrom = request.getParameter("lastSearchValueFrom");
            String searchValTo = request.getParameter("lastSearchValueTo");
            try {
                Context context = new InitialContext();
                Object obj = context.lookup("MovieJNDI");
                MovieSessionBeanRemote poji = (MovieSessionBeanRemote) obj;
                boolean result 
                        = poji.updateMovie(title, Integer.parseInt(year), Integer.parseInt(duration), genre, studio);
                if (result) {
                    String urlRewritting 
                            = "CenterServlet?btAction=Search&txtFrom=" + searchValFrom + "&txtTo=" + searchValTo;
                    response.sendRedirect(urlRewritting);
                }
            } catch (NamingException ex) {
                log(ex.getMessage());
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
