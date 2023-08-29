package com.example.ss11_mvc.repository;

import com.example.ss11_mvc.model.Product;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final String SELECT = "SELECT * FROM products";

    @Override
    public List<Product> displayList() {
        List<Product> productList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int price = resultSet.getInt("price");
                String description = resultSet.getString("description");
                String supplier = resultSet.getString("supplier");
                productList.add(new Product(id,name,price,description,supplier));
            }
        } catch (SQLException e) {
           e.printStackTrace();
        }
        return productList;
    }
}
