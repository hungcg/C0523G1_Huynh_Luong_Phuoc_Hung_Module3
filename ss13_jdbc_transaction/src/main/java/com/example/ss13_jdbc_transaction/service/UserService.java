package com.example.ss13_jdbc_transaction.service;

import com.example.ss13_jdbc_transaction.dao.IUserDAO;
import com.example.ss13_jdbc_transaction.dao.UserDAO;
import com.example.ss13_jdbc_transaction.model.User;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {

    private IUserDAO userDAO = new UserDAO();

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
        List<User> listUser = userDAO.selectAllUsers();
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
    public List<User> searchUser(String country) {
        List<User> listUser= userDAO.searchUser(country);
        return listUser;
    }

    @Override
    public User getUserById(int id) {
        userDAO.getUserById(id);
        return null;
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        userDAO.insertUserStore(user);

    }

    @Override
    public void addUserTransaction(User user, int[] permision) {
        userDAO.addUserTransaction(user,permision);


    }

    @Override
    public void insertUpdateWithoutTransaction() {
        userDAO.insertUpdateWithoutTransaction();

    }

    @Override
    public void insertUpdateUseTransaction() {
        userDAO.insertUpdateUseTransaction();

    }
}
