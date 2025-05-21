package com.example.shoplaptop.service;

import java.util.List;
import java.util.Optional;


import org.springframework.stereotype.Service;

import com.example.shoplaptop.domain.Cart;
import com.example.shoplaptop.domain.CartDetail;
import com.example.shoplaptop.domain.Order;
import com.example.shoplaptop.domain.OrderDetail;
import com.example.shoplaptop.domain.Product;
import com.example.shoplaptop.domain.User;
import com.example.shoplaptop.repository.CartDetailRepository;
import com.example.shoplaptop.repository.CartRepository;
import com.example.shoplaptop.repository.OrderDetailRepository;
import com.example.shoplaptop.repository.OrderRepository;
import com.example.shoplaptop.repository.ProductRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;



    public ProductService(ProductRepository productRepository,
             CartRepository cartRepository,
             CartDetailRepository cartDetailRepository,
            UserService userService,OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {
        this.productRepository = productRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.cartRepository = cartRepository;
        this.userService = userService;
        this.orderDetailRepository = orderDetailRepository;
        this.orderRepository = orderRepository;
    }

    public Product createProduct(Product pr) {
        return this.productRepository.save(pr);
    }
    
    public List<Product> fetchProducts() {
        return this.productRepository.findAll();
    }

    // public  Optional<Product> getProductByName(String name) {
    //     return this.productRespository.findByName(name);
    // }

    public void deleteById(long id) {
        this.productRepository.deleteById(id);
    }
   
   public   Optional<Product> fetchProductById(long id) {
       return this.productRepository.findById(id);
   }
    
   public void handleAddProductToCart(String email, long productId, HttpSession session) {
       //check user co cart chua ? neu chua -> tao moi
       User user = this.userService.getUserByEmail(email);
       if (user != null) {
           Cart cart = this.cartRepository.findByUser(user);

           if (cart == null) {
               //create new cart
               Cart otherCart = new Cart();
               otherCart.setUser(user);
               otherCart.setSum(0);

               cart = this.cartRepository.save(otherCart);
           }

           //save  cart_detail
           //find product by id
           Optional<Product> productOptional = this.productRepository.findById(productId);
           if (productOptional.isPresent()) {
               Product realProduct = productOptional.get();

               CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);

               if (oldDetail == null) {
                   CartDetail cd = new CartDetail();
                   cd.setCart(cart);
                   cd.setProduct(realProduct);
                   cd.setPrice(realProduct.getPrice());
                   cd.setQuantity(1);
                   this.cartDetailRepository.save(cd);

                   int Sum = cart.getSum() + 1;
                   cart.setSum(Sum);
                   this.cartRepository.save(cart);
                   session.setAttribute("sum", Sum);
               } else {
                   oldDetail.setQuantity(oldDetail.getQuantity() + 1);
                   this.cartDetailRepository.save(oldDetail);
               }

           }

       }

   }

   public Cart fetchByUser(User user) {
       return this.cartRepository.findByUser(user);
   }
   
   public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
       Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(cartDetailId);
       if (cartDetailOptional.isPresent()) {
           CartDetail cartDetail = cartDetailOptional.get();

           Cart currentCart = cartDetail.getCart();
           //delete cart-detail
           this.cartDetailRepository.deleteById(cartDetailId);

           //update cart
           if (currentCart.getSum() > 1) {
               //update current cart
               int s = currentCart.getSum() - 1;
               currentCart.setSum(s);
               session.setAttribute("sum", s);
               this.cartRepository.save(currentCart);
           } else {
               //delete cart (sum =1)
               this.cartRepository.deleteById(currentCart.getId());
               session.setAttribute("sum", 0);
           }

       }

   }
   
   public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
       for (CartDetail cartDetail : cartDetails) {
           Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
           if (cdOptional.isPresent()) {
               CartDetail currCartDetail = cdOptional.get();
               currCartDetail.setQuantity(cartDetail.getQuantity());
               this.cartDetailRepository.save(currCartDetail);

           }
       }
   }
 
   public void handlePlaceOrder(User user, HttpSession session, String receiverName, String receiverAddress, String receiverPhone) {
    // Tạo đơn hàng
    Order order = new Order();
    order.setUser(user);
    order.setReceiverName(receiverName);
    order.setReceiverAddress(receiverAddress);
    order.setReceiverPhone(receiverPhone);
    order = this.orderRepository.save(order);

    // Bước 1: Lấy giỏ hàng theo người dùng
    Cart cart = this.cartRepository.findByUser(user);
    if (cart != null) {

        
        List<CartDetail> cartDetails = cart.getCartDetails();
        if (cartDetails != null) {
            
            // Tạo chi tiết đơn hàng
            for (CartDetail cd : cartDetails) {
                
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrder(order);
                orderDetail.setProduct(cd.getProduct());
                orderDetail.setPrice(cd.getPrice());
                orderDetail.setQuantity(cd.getQuantity());
                this.orderDetailRepository.save(orderDetail);
            }

            // Bước 2: Xóa giỏ hàng (cascade đến cartDetails)
            for (CartDetail cd : cartDetails) {
                this.cartDetailRepository.deleteById(cd.getId());
            }
               this.cartRepository.deleteById(cart.getId());
            // Bước 3: Cập nhật session
            session.setAttribute("sum", 0);
        }
    }
}


}
