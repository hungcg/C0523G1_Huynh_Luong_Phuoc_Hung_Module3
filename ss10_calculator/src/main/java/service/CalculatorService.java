package service;

public class CalculatorService {
    public static Double calculate(Double firstOperand, String operator, Double secondOperand) {
        if (operator.equals("addition")) {
            return firstOperand + secondOperand;
        } else if (operator.equals("subtraction")) {
            return firstOperand - secondOperand;
        } else if (operator.equals("multiplication")) {
            return firstOperand * secondOperand;
        } else if (operator.equals("division")) {
            if (secondOperand == 0) {
                throw new RuntimeException("can not devide zero baby");
            } else {
                Double result = firstOperand / secondOperand;
                return result;
            }
        }
        return null;

    }
}
