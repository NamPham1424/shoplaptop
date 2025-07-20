package com.example.shoplaptop.controller.client;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.shoplaptop.domain.Cart;
import com.example.shoplaptop.domain.CartDetail;
import com.example.shoplaptop.domain.Product;
import com.example.shoplaptop.domain.Product_;
import com.example.shoplaptop.domain.User;
import com.example.shoplaptop.domain.dto.ProductCriteriaDTO;
import com.example.shoplaptop.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class ItemController {
    
    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getProductPage(Model model, @PathVariable long id) {
        Product pro = this.productService.fetchProductById(id).get();
        model.addAttribute("pro", pro);
        model.addAttribute("id", id);

        return "client/product/productDetail";
    }


    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long productId = id;
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, productId,session,1);

        return "redirect:/cart";
    }
    
    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.fetchByUser(currentUser);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);

        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);
        return "client/cart/show";
    }
    

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartDetail(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long cartDetailId = id;
        this.productService.handleRemoveCartDetail(cartDetailId, session);
        ;

        return "redirect:/cart";
    }
    
    @GetMapping("/checkout")
    public String getCheckOutPage(Model model, HttpServletRequest request) 
    {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.fetchByUser(currentUser);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        
        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        return "client/cart/checkout";
    }
    
    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }
    
    @PostMapping("/place-order")
    public String handlePlaceOrder(HttpServletRequest request,
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverPhone") String receiverPhone,
            @RequestParam("receiverAddress") String receiverAddress) {
                User currentUser = new User();
        HttpSession session = request.getSession(false);
       
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        this.productService.handlePlaceOrder(currentUser, session, receiverName, receiverAddress, receiverPhone);

        
        return "redirect:/thanks";
    }
    
    
    @GetMapping("/thanks")
    public String getThankYouPage(Model model) {

        return "client/cart/thanks";
    }

    @PostMapping("/add-product-from-view-detail")
    public String handleAddProductFromViewDetail(
            @RequestParam("id") long id,
            @RequestParam("quantity") long quantity,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, id, session, quantity);

        return "redirect:/product/" + id;
    }
    
    @GetMapping("/products")
    public String getProductPage(Model model,
        ProductCriteriaDTO productCriteriaDTO,
        HttpServletRequest request
            ) {
        int page = 1;
        try {
            if (productCriteriaDTO.getPage() != null && productCriteriaDTO.getPage().isPresent()) {
                page = Integer.parseInt(productCriteriaDTO.getPage().get());

            }
            else {
                
            }
        } catch (Exception e) {
            // TODO: handle exception
            page = 1;
        }

       
       
        
        // check sort price
        Pageable pageable = PageRequest.of(page - 1, 6);
        if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
            String sort = productCriteriaDTO.getSort().get();
            if(sort.equals("gia-tang-dan")){
                pageable = PageRequest.of( page - 1, 6,Sort.by(Product_.PRICE).ascending());
            }
            else if(sort.equals("gia-giam-dan")){
                pageable = PageRequest.of( page - 1, 6,Sort.by(Product_.PRICE).descending());
            }
        
        

        }
       
        Page<Product> prs = this.productService.fetchProductsWithSpec(pageable, productCriteriaDTO);


        // String name = nameOptional.isPresent() ? nameOptional.get() : "";
        // Page<Product> prs = this.productService.fetchProductsWithSpec(pageable, name);

        //case 1:
        // double min = minOptional.isPresent() ? Double.parseDouble(minOptional.get()) : 0;
        // Page<Product> prs = this.productService.fetchPriceMinProductsWithSpec(pageable, min);

    
        //case 2:
        // double max = maxOptional.isPresent() ? Double.parseDouble(maxOptional.get()) : Double.MAX_VALUE;
        // Page<Product> prs = this.productService.fetchPriceMaxProductsWithSpec(pageable, max);

        //case 3:
        // String factory = factOptional.isPresent() ? factOptional.get() : "";
        // Page<Product> prs = this.productService.fetchFactoryProductWithSpec(pageable, factory);


        //case 4:
        // List<String> factory = Arrays.asList(factOptional.get().split(","));
        // Page<Product> prs = this.productService.fetchFactoriesProductWithSpec(pageable, factory);


        //case 5:
        // String price = priceOptional.isPresent() ? priceOptional.get() : "";
        // Page<Product> prs = this.productService.fetchMatchPriceProductWithSpec(pageable, price);

        //case 6:
        // List<String> price = Arrays.asList(priceOptional.get().split(","));
        // Page<Product> prs = this.productService.fetchMultiplePriceProductSpec(pageable, price);



        List<Product> listProducts = prs.getContent().size() > 0 ? prs.getContent() : new ArrayList<Product>();
       
        String qs = request.getQueryString();
        if (qs != null && !qs.isBlank()) {
            //remove page
            qs = qs.replace("page=" + page, "");
        }
        model.addAttribute("queryString", qs);
        model.addAttribute("products", listProducts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());

        return "client/product/show";
    }
    

    



    
}
