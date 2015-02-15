package HotelControllers;

import HotelModel.Hotel;
import HotelModel.HotelDAO;
import HotelModel.HotelDAOInterface;
import HotelModel.HotelService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
   private static final String RESULT_PAGE = "index.jsp";
   
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

            HotelService hs = new HotelService();
            List<Hotel> hotelInfo = hs.findAllHotels();
            String typeString = request.getParameter("type");
            
            if(typeString != null && typeString.equals("view")){
                Hotel h = hotelInfo.get(Integer.parseInt(request.getParameter("arraySpace")));
                
                request.setAttribute("hotelName", h.getHotelName());
                request.setAttribute("address", h.getStreetAddress());
                request.setAttribute("city", h.getCity());
                request.setAttribute("state", h.getState());
                request.setAttribute("postal", h.getZip());
                
                request.setAttribute("notes", h.getNotes());
            } else if(typeString != null && typeString.equals("delete")){
               
                Hotel h = hotelInfo.get(Integer.parseInt(request.getParameter("arraySpace")));                
                hs.deleteHotelRecord(h.getHotelId());
                
            } else if(typeString != null && typeString.equals("create")){
                
                String name = request.getParameter("name");
                String address = request.getParameter("address");
                String city = request.getParameter("city");
                String state = request.getParameter("state");
                String postal = request.getParameter("postal");
                String notes = request.getParameter("notes");
                hs.insertHotelRecord(name, address, city, state, postal, notes);
            
            } else if(typeString != null && typeString.equals("update")){
                int id = Integer.parseInt(request.getParameter("hotel_id"));
                
                String name = request.getParameter("name");
                String address = request.getParameter("address");
                String city = request.getParameter("city");
                String state = request.getParameter("state");
                String postal = request.getParameter("postal");
                String notes = request.getParameter("notes");
                
                hs.updateHotelRecord(id, "hotel_name", name);
                hs.updateHotelRecord(id, "street_address", address);
                hs.updateHotelRecord(id, "city", city);
                hs.updateHotelRecord(id, "state", state);
                hs.updateHotelRecord(id, "postal_code", postal);
                hs.updateHotelRecord(id, "notes", notes);
                hotelInfo = hs.findAllHotels();
               
                Hotel h = hotelInfo.get(Integer.parseInt(request.getParameter("arraySpace")));
                
                request.setAttribute("hotelName", h.getHotelName());
                request.setAttribute("address", h.getStreetAddress());
                request.setAttribute("city", h.getCity());
                request.setAttribute("state", h.getState());
                request.setAttribute("postal", h.getZip());
                request.setAttribute("notes", h.getNotes());
            }
            
            hotelInfo = hs.findAllHotels();
            
            request.setAttribute("hotels", hotelInfo);
            
            RequestDispatcher view =
            request.getRequestDispatcher(RESULT_PAGE);
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
