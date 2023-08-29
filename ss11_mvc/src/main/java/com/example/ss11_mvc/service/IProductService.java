package com.example.ss11_mvc.service;

import com.example.ss11_mvc.model.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductService {
    public List<Product> displayList() throws SQLException;
}
