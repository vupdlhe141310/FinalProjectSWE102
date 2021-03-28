/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.User;

/**
 *
 * @author DELL
 */
public class RegisterServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();
    private ArrayList<Cart> cart = new ArrayList<>();

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
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        java.sql.Date ngaysinh = null;

        try {
            ngaysinh = new java.sql.Date((new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("ngaysinh"))).getTime());
        } catch (ParseException e1) {

            e1.printStackTrace();
        }
        String gioitinh = request.getParameter("gioitinh");
        String email = request.getParameter("email");
        String sdt = request.getParameter("sdt");
        String diachi = request.getParameter("diachi");
        System.out.println(username);

        String err = "";
        String url = "/register.jsp";

        if (username.equals("") || password.equals("") || email.equals("") || diachi.equals("") || sdt.equals("")) {
            err += "Fill up all the text fields";
        } else {
            if (userDAO.checkUser(username) == true) {
                err += "User name was existed";
            } else {
                Pattern pattenObj = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                        + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
                Matcher matcherObj = pattenObj.matcher(email);
                if (!matcherObj.matches()) {
                    err += "Incorrect email format";
                }
            }
        }

        if (err.length() > 0) {
            request.setAttribute("err", err);
        }

        try {
            if (err.length() == 0) {
                HttpSession session = request.getSession();
                session.setAttribute("cart", cart);
                userDAO.addUser(userDAO.getLastID() + 1, username, password, ngaysinh, gioitinh, email, sdt, diachi, "1");
                userDAO.login(username, password);
                Cookie loginCookie = new Cookie("username", username);

                loginCookie.setMaxAge(30 * 60);
                response.addCookie(loginCookie);
                response.sendRedirect("index.jsp");

            } else {
                url = "/register.jsp";
               request.getRequestDispatcher(url).forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/register.jsp");
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
