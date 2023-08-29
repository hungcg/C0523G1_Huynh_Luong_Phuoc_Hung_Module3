package com.example.ss10_jsp_jstl.service;

import com.example.ss10_jsp_jstl.model.Customer;


import java.util.ArrayList;
import java.util.List;

public class CustomerService {
    public static List<Customer> showList() {
        List<Customer> customerList = new ArrayList<>();
        Customer customer = new Customer("Nguyễn Văn A", "2001/01/01", "Quảng Nam", "https://i1-dulich.vnecdn.net/2021/07/16/2-1626444940.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=QBhjEzy_5EIISB2CWDpQlw");
        Customer customer1 = new Customer("Trần Thị B", "2001/01/01", "Quảng Ngãi", "https://i1-dulich.vnecdn.net/2021/07/16/2-1626444940.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=QBhjEzy_5EIISB2CWDpQlw");
        Customer customer2 = new Customer("Phạm Văn C", "2001/01/01", "Quảng Trị", "https://i1-dulich.vnecdn.net/2021/07/16/2-1626444940.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=QBhjEzy_5EIISB2CWDpQlw");
        Customer customer3 = new Customer("Nguyễn Văn D", "2001/01/01", "Bình Định", "https://i1-dulich.vnecdn.net/2021/07/16/2-1626444940.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=QBhjEzy_5EIISB2CWDpQlw");
        customerList.add(customer);
        customerList.add(customer1);
        customerList.add(customer2);
        customerList.add(customer3);
        return customerList;
    }
}
