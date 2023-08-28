package com.example.controller;

import com.example.service.CalculatorService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            Double price = Double.parseDouble(request.getParameter("price"));
            Double discount = Double.parseDouble(request.getParameter("discount"));
            Double result = CalculatorService.calculate(price,discount);
            request.setAttribute("result", result);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
           requestDispatcher.forward(request, response);
        }
    }
