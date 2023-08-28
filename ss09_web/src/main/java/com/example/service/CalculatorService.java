package com.example.service;

public class CalculatorService {
    public static Double calculate(Double price, double discount) {
        Double result = discount * price * 0.01;
        return result;
    }
}
