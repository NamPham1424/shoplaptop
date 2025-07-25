package com.example.shoplaptop.controller.client;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.example.shoplaptop.domain.Order;
import com.example.shoplaptop.domain.Product;
import com.example.shoplaptop.domain.User;
import com.example.shoplaptop.domain.dto.RegisterDTO;
import com.example.shoplaptop.service.OrderService;
import com.example.shoplaptop.service.ProductService;
import com.example.shoplaptop.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;




@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final OrderService orderService;


    public HomePageController(ProductService productService,
            UserService userService
            , PasswordEncoder passwordEncoder,
                    OrderService orderService) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.orderService = orderService;
    }


    @GetMapping("/")
    public String getHomePage(Model model) {
    
        // List<Product> products = this.productService.fetchProducts();
        Pageable pageable = PageRequest.of(0, 10);
        Page<Product> prs = this.productService.fetchProducts(pageable);
        List<Product> products = prs.getContent();
        model.addAttribute("products", products);
    
        return "client/homepage/show";
    }

       @GetMapping("/register")
       public String getRegisterPage(Model model) {
           model.addAttribute("registerUser", new RegisterDTO());

           return "client/auth/register";
       }
    
       @PostMapping("/register")
       public String postRegister(@ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
               BindingResult bindingResult) {
          
       if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }
           User user = this.userService.registerDTOtoUser(registerDTO);

           String hashPassword = this.passwordEncoder.encode(user.getPassword());

           user.setPassword(hashPassword);
           user.setRole(this.userService.getRoleByName("USER"));

           this.userService.handleSaveUser(user);
           return "redirect:/login";
       }
       
       
       @GetMapping("/login")
       public String getLoginPage(Model model) {


        return "client/auth/login";
       }
       
     

       @GetMapping("/access-deny")
       public String getDenyPage(Model model) {

           return "client/auth/deny";
       }
       
       @GetMapping("/order-history")
       public String getOrderHistoryPage(Model model, HttpServletRequest request) {
           User currentUser = new User();
           HttpSession session = request.getSession();

           long id = (long) session.getAttribute("id");
           currentUser.setId(id);

           List<Order> orders = this.orderService.fetchOrderByUser(currentUser);
           model.addAttribute("orders", orders);

           return "client/cart/order-history";
       }
       
       

    
}
