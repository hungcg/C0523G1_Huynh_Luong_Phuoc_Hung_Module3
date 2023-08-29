package com.example.ss11_mvc.controller;

import com.example.ss11_mvc.model.Product;
import com.example.ss11_mvc.service.IProductService;
import com.example.ss11_mvc.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService service = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }switch (action) {
            case "1":
                break;
            default:
                try {
                    displayList(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
        }
    }

    private void displayList(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

            List<Product> productList = service.displayList();
            request.setAttribute("productList",productList);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("list.jsp");
            requestDispatcher.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
    }
}