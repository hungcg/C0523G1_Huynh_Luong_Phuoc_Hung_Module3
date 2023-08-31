package com.example.service;

import com.example.dao.IUserDAO;
import com.example.dao.UserDAO;
import com.example.model.User;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService{

    private IUserDAO userDAO =new UserDAO();
    @Override
    public void insertUser(User user) throws SQLException {
        userDAO.insertUser(user);

    }

    @Override
    public User selectUser(int id) {
       return null;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User>listUser =userDAO.selectAllUsers();
        return listUser;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        userDAO.deleteUser(id);
        return false;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        userDAO.updateUser(user);
        return false;
    }

    @Override
    public List<User> search(String country) {
        List<User> listUser = userDAO.search(country);
        return listUser;
    }

    @Override
    public User getUserById(int id) {
        return null;
    }

    @Override
    public List<User> sortByName() {
        List<User> listUser= userDAO.sortByName();
        return listUser;
    }
}
