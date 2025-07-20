package com.example.shoplaptop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.shoplaptop.domain.Order;
import com.example.shoplaptop.domain.OrderDetail;
import com.example.shoplaptop.domain.User;
import com.example.shoplaptop.repository.OrderDetailRepository;
import com.example.shoplaptop.repository.OrderRepository;

@Service
public class OrderService {

    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }


    public Page<Order> fetchOrders(Pageable pageable) {
        return this.orderRepository.findAll(pageable);
    }

    public void deleteById(long id) {
        this.orderRepository.deleteById(id);

    }
    
    public Optional<Order> fetchOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public void updateOrder(Order order) {
        Optional<Order> optionalOrder = this.fetchOrderById(order.getId());
        if (optionalOrder.isPresent()) {
            Order currentOrder = optionalOrder.get();
            currentOrder.setStatus(order.getStatus());
            this.orderRepository.save(currentOrder);
        }
    }

    public List<Order> fetchOrderByUser(User user) {
        
        return this.orderRepository.findByUser(user);
    }

    
}
