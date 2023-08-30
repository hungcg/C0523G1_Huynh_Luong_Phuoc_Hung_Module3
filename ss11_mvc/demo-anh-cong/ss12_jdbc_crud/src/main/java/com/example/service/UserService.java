package com.example.service;

import com.example.dao.IUserDAO;
import com.example.dao.UserDAO;
import com.example.model.User;

import java.util.List;

public class UserService implements IUserService{
    private IUserDAO userDAO= new UserDAO();
    @Override
    public List<User> searchByCountry(String country) {
        return userDAO.searchByCountry("%"+country+"%");
    }
}
