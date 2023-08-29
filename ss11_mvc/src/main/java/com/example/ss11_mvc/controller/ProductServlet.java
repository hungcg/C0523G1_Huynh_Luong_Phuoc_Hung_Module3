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

@WebServlet(name = "ServletProduct", value = "/products")
public class ProductServlet extends HttpServlet {
    IProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action == null){
            action="";
        }
        switch (action){
            case "create":
                createForm(request,response);
                break;
            case "edit":
                editForm(request,response);
                break;
            case "delete":
                deleteForm(request,response);
                break;
//            case "view":
//                viewForm(request,response);
//                break;
            default:
                listProduct(request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action == null){
            action="";
        }
        switch (action){
            case "create":
                createProduct(request,response);
                break;
            case "edit":
                editProduct(request,response);
                break;
            case "delete":
                deleteProduct(request,response);
                break;
            case "search":
                searchProduct(request,response);
                break;
//            case "view":
//                viewProduct(request,response);
//                break;
            default:
                break;
        }
    }
    private void listProduct(HttpServletRequest request,HttpServletResponse response){
        List<Product> products = productService.findAll();
        request.setAttribute("products", products);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void createForm(HttpServletRequest request,HttpServletResponse response){
        RequestDispatcher dispatcher = request.getRequestDispatcher("/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void createProduct(HttpServletRequest request,HttpServletResponse response){
        String nameProduct = request.getParameter("productname");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");
        int id = (int) (Math.random()*1000);

        Product product = new Product(id, nameProduct, price, description, producer);
        productService.save(product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/create.jsp");
        request.setAttribute("message","Successful");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void editForm(HttpServletRequest request,HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        RequestDispatcher requestDispatcher;
        if(product == null){
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        }else {
            request.setAttribute("product", product);
            requestDispatcher = request.getRequestDispatcher("/edit.jsp");
        }
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void editProduct(HttpServletRequest request,HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        String productName = request.getParameter("productName");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String producer = request.getParameter("producer");

        Product product = productService.findById(id);
        RequestDispatcher requestDispatcher;
        if(product == null){
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        }else {
            product.setProductName(productName);
            product.setPrice(price);
            product.setDescription(description);
            product.setProducer(producer);
            productService.update(id, product);
            request.setAttribute("product", product);
            request.setAttribute("message", "successfully");
            requestDispatcher = request.getRequestDispatcher("/edit.jsp");
            try {
                requestDispatcher.forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    private void deleteForm(HttpServletRequest request,HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        RequestDispatcher requestDispatcher;
        if(product == null){
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        }else {
            request.setAttribute("product", product);
            requestDispatcher = request.getRequestDispatcher("/delete.jsp");
        }
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void deleteProduct(HttpServletRequest request,HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        RequestDispatcher requestDispatcher;
        if(product == null){
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        }else {
            productService.remove(id);
        }
        try {
            response.sendRedirect("/products");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    private void searchProduct(HttpServletRequest request,HttpServletResponse response){
        String productName = request.getParameter("search");
        List<Product> productList = new ArrayList<>();
        List<Product> list = productService.findAll();
        System.out.println(list);
        for (Product product: list){
            if(product.getProductName().toLowerCase().contains(productName.toLowerCase())){
                productList.add(product);
            }
        }
        if (productList.size() == 0){
            request.setAttribute("message","Not Found");
        }else {
            request.setAttribute("productList",productList);
        }
        try {
            request.getRequestDispatcher("/search.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}