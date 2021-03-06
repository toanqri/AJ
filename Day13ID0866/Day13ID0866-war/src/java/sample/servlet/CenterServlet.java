package sample.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Suzy
 */
public class CenterServlet extends HttpServlet {
    private final String insertServlet = "InsertServlet";
    private final String insertItemServlet = "InsertItemServlet";
    private final String searchItemServlet = "SearchItemServlet";
    private final String deleteItemServlet = "DeleteItemServlet";
    private final String updateItemServlet = "UpdateItemServlet";
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
            String button = request.getParameter("btAction");
            if (button.equals("Insert")) {
                RequestDispatcher rd = request.getRequestDispatcher(insertServlet);
                rd.forward(request, response);
            } else if (button.equals("Insert Item")) {
                RequestDispatcher rd = request.getRequestDispatcher(insertItemServlet);
                rd.forward(request, response);
            } else if (button.equals("Search")) {
                RequestDispatcher rd = request.getRequestDispatcher(searchItemServlet);
                rd.forward(request, response);
            } else if (button.equals("Delete")) {
                RequestDispatcher rd = request.getRequestDispatcher(deleteItemServlet);
                rd.forward(request, response);
            } else if (button.equals("Update")) {
                RequestDispatcher rd = request.getRequestDispatcher(updateItemServlet);
                rd.forward(request, response);
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
