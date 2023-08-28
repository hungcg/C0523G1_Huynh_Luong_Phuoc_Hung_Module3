package controller;

import service.CalculatorService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
        Double firstOperand = Double.parseDouble(request.getParameter("first"));
        Double secondOperand = Double.parseDouble(request.getParameter("second"));
        String operator = request.getParameter("operator");
        PrintWriter printWriter = response.getWriter();
        try {
            Double result = CalculatorService.calculate(firstOperand, operator, secondOperand);
            request.setAttribute("result", result);
            request.getRequestDispatcher("/WEB-INF/result.jsp").forward(request, response);
        } catch (Exception e) {
            printWriter.println(e.getMessage());
        }
    }
}

