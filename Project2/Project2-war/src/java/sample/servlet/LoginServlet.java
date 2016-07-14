package sample.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.session.CustomerSessionBeanRemote;

/**
 *
 * @author Suzy
 */
public class LoginServlet extends HttpServlet {

    private final String invalidPage = "error.html";
    private final String errorPage = "errors.html";

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
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");

            try {
                //1. Lay context hien hanh
                Context context = new InitialContext();

                //2. Lay EJB Obj
                Object obj = context.lookup("CustomerJNDI");
                CustomerSessionBeanRemote poji = (CustomerSessionBeanRemote) obj;

                //3. Goi method
                boolean result = poji.checkLogin(username, password);
                String url = invalidPage;
                if (result) {
                    url = "CenterServlet?btAction=Confirm";
                    HttpSession session = request.getSession();
                    session.setAttribute("USER", username);
                } else {
                    HttpSession session = request.getSession(false);
                    if (session != null) {
                        session.removeAttribute("USER");
                    }
                }
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } catch (SQLException ex) {
                log(ex.getMessage());
                response.sendRedirect(errorPage);
                return;
            } catch (NamingException ex) {
                log(ex.getMessage());
                response.sendRedirect(errorPage);
                return;
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