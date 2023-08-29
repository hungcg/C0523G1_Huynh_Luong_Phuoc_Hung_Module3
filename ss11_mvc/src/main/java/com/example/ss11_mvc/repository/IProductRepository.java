package com.example.ss11_mvc.repository;

import com.example.ss11_mvc.model.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductRepository {

    public List<Product> displayList() ;
}
