package com.example.service;

import com.example.model.User;

import java.util.List;

public interface IUserService {
    List<User> searchByCountry(String country);
}
