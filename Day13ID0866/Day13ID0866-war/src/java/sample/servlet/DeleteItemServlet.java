package sample.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.session.ItemSessionBeanRemote;

/**
 *
 * @author Suzy
 */
public class DeleteItemServlet extends HttpServlet {

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
            String itemID = request.getParameter("itemID");
            String d = request.getParameter("dateS");
            Timestamp t = Timestamp.valueOf(d);
            String lastFrom = request.getParameter("lastFrom");
            String lastTo = request.getParameter("lastTo");
            try {
                Context context = new InitialContext();
                Object obj = context.lookup("ItemJNDI");
                ItemSessionBeanRemote poji = (ItemSessionBeanRemote) obj;
                boolean result = poji.deleteItem(itemID, t);
                if (result) {
                    String urlRewritting = "CenterServlet?btAction=Search&txtFrom=" + lastFrom + "&txtTo=" + lastTo;
                    response.sendRedirect(urlRewritting);
                } else {
                    out.println("Khong the xoa");
                }
            } catch (NamingException ex) {
                ex.printStackTrace();
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
