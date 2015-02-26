package HotelControllers;

import HotelModel.DB_Accessor;
import HotelModel.DB_Mysql;
import HotelModel.Hotel;
import HotelModel.HotelDAO;
import HotelModel.HotelService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dworgolet
 */
@WebServlet(name = "HotelController", urlPatterns = {"/hc"})
public class HotelController extends HttpServlet {
   private static String RESULT_PAGE = "/Views/index.jsp";  
   private static final String ACTION_DELETE = "delete";
   private static final String ACTION_EDIT = "edit";
   private static final String ACTION_CREATE = "create";
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

        String username = request.getServletContext().getInitParameter("username");
        String password = request.getServletContext().getInitParameter("password");
        String url = request.getServletContext().getInitParameter("url");
        String driver = request.getServletContext().getInitParameter("driver");
        
        
        String name;
        String address;
        String city;
        String state;
        String zip;
        String notes;
                     
        
        DB_Accessor db = new DB_Mysql();
        HotelDAO dao = new HotelDAO(db, url, driver,username, password);
        RequestDispatcher view;
        
        String action = request.getParameter("action");

        if(request.getParameter("action") != null){
            if(action.equals(ACTION_CREATE))
            {
                
                name = request.getParameter("hotelName");
                address = request.getParameter("hotelAddress");
                city = request.getParameter("hotelCity");
                zip = request.getParameter("hotelZip");
                state = request.getParameter("hotelState");
                notes = request.getParameter("hotelNote");
                
                List<String> colNames = new ArrayList<>();
                List values = new ArrayList();
                
                colNames.add("hotel_name");
                colNames.add("street_address");
                colNames.add("city");
                colNames.add("state");
                colNames.add("postal_code");
                colNames.add("notes");

                values.add(name);
                values.add(address);
                values.add(city);
                values.add(state);
                values.add(zip);
                values.add(notes);
                
                dao.insertHotelRecord(colNames, values);
            }
        else if(action.equals(ACTION_DELETE))
            {
                String stringPk = request.getParameter("hotelId");
                int pk = Integer.parseInt(stringPk); 
                dao.deleteHotelRecord(pk);
            }
        else if(action.equals(ACTION_EDIT))
            {
                String stringPk = request.getParameter("hotelId");
                int pk = Integer.parseInt(stringPk);

                name = request.getParameter("hotelName");
                address = request.getParameter("hotelAddress");
                city = request.getParameter("hotelCity");
                zip = request.getParameter("hotelZip");
                state = request.getParameter("hotelState");
                notes = request.getParameter("hotelNote");
                
                dao.updateHotelRecord(pk, "hotel_name", name);
                dao.updateHotelRecord(pk, "street_address", address);
                dao.updateHotelRecord(pk, "city", city);
                dao.updateHotelRecord(pk, "state", state);
                dao.updateHotelRecord(pk, "postal_code", zip);
                dao.updateHotelRecord(pk, "notes", notes);     
            }
        }
                List<Hotel> records = dao.findAllHotels();
                request.setAttribute("hotelList", records);
                view = request.getRequestDispatcher(RESULT_PAGE);
        
                view.forward(request, response);

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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
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
