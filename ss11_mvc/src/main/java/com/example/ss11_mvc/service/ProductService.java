package com.example.ss11_mvc.service;

import com.example.ss11_mvc.model.Product;
import com.example.ss11_mvc.repository.IProductRepository;
import com.example.ss11_mvc.repository.ProductRepository;


import java.sql.SQLException;
import java.util.List;

public class ProductService implements IProductService {

    private IProductRepository repository = new ProductRepository();

    @Override
    public List<Product> displayList() {
        return repository.displayList();

    }
}







