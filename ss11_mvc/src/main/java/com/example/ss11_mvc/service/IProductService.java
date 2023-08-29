package com.example.ss11_mvc.service;

import com.example.ss11_mvc.model.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void save(Product product);

    Product findById(int id);

    void update(int id, Product product);

    void remove(int id);

}