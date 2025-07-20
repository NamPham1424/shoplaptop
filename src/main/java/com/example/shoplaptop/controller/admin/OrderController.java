package com.example.shoplaptop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.shoplaptop.domain.Order;
import com.example.shoplaptop.service.OrderService;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;



@Controller
public class OrderController {
    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/admin/order")
    public String getOrderPage(Model model,
            @RequestParam(value = "page") Optional<String> pageOptional) {
        int page = 1;

        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
            else{

            }
        } catch (Exception e) {
            // TODO: handle exception
        }

        Pageable pageable = PageRequest.of(page - 1, 1);
        Page<Order> ord = this.orderService.fetchOrders(pageable);
        List<Order> orders = ord.getContent();

        model.addAttribute("orders", orders);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", ord.getTotalPages());

        return "admin/order/show";
    }
    
    @RequestMapping("/admin/order/{id}")
    public String getOrderDetails(Model model, @PathVariable long id) {
        Order order = this.orderService.fetchOrderById(id).get();
        model.addAttribute("id", id);
        model.addAttribute("order", order);
        model.addAttribute("orderDetails", order.getOrderDetail());

        return "admin/order/details";
    }

    @RequestMapping("/admin/order/update/{id}")
    public String getUpdateOrderPage(Model model, @PathVariable long id) {
        Order currentOrder = this.orderService.fetchOrderById(id).get();

        model.addAttribute("newOrder", currentOrder);

        return "admin/order/update";
    }
    
    @PostMapping("/admin/order/update")
    public String postUpdateOrder(@ModelAttribute("newOrder") Order order) {
        this.orderService.updateOrder(order);

        return "admin/order/update";
    }
    
    // @PostMapping("/admin/product/delete")
    // public String postDeleteOrder(Model model, @ModelAttribute("newOrder") Order order) {
    //     this.orderService.deleteById(order.getId());
        
    //     return "admin/order/delete";
    // }
    

    




    
    

}
