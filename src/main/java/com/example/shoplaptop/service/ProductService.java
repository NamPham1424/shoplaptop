package com.example.shoplaptop.service;

import java.beans.Transient;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.shoplaptop.domain.Cart;
import com.example.shoplaptop.domain.CartDetail;
import com.example.shoplaptop.domain.Order;
import com.example.shoplaptop.domain.OrderDetail;
import com.example.shoplaptop.domain.Product;
import com.example.shoplaptop.domain.Product_;
import com.example.shoplaptop.domain.User;
import com.example.shoplaptop.domain.dto.ProductCriteriaDTO;
import com.example.shoplaptop.repository.CartDetailRepository;
import com.example.shoplaptop.repository.CartRepository;
import com.example.shoplaptop.repository.OrderDetailRepository;
import com.example.shoplaptop.repository.OrderRepository;
import com.example.shoplaptop.repository.ProductRepository;
import com.example.shoplaptop.service.specification.ProductSpecs;

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



    private Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) 
        -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }

    public Page<Product> fetchProducts(Pageable page) {
        return this.productRepository.findAll(page);
    }


    public Page<Product> fetchProductsWithSpec(Pageable page, ProductCriteriaDTO productCriteriaDTO) {

        
        if (productCriteriaDTO.getFactory() == null && productCriteriaDTO.getPrice() == null) {
            return this.productRepository.findAll(page);
        }
          
        
        Specification<Product> combinedSpec = Specification.where(null);




        if (productCriteriaDTO.getFactory() != null && productCriteriaDTO.getFactory().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecs.matchFactories(productCriteriaDTO.getFactory().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        if (productCriteriaDTO.getPrice() != null &&productCriteriaDTO.getPrice().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecs.matchFactories(productCriteriaDTO.getFactory().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }


     


        return this.productRepository.findAll(combinedSpec, page);
    }
    

    public Page<Product> fetchFactoryProductWithSpec(Pageable pageable, String factory) {
        return this.productRepository.findAll(ProductSpecs.matchFactory(factory), pageable);
    }

    public Page<Product> fetchFactoriesProductWithSpec(Pageable pageable, List<String> factory) {
        return this.productRepository.findAll(ProductSpecs.matchFactories(factory), pageable);
    }

    


    public Page<Product> fetchPriceMinProductsWithSpec(Pageable pageable, double price) {
        return this.productRepository.findAll(ProductSpecs.minPrice(price), pageable);
    }

    public Page<Product> fetchPriceMaxProductsWithSpec(Pageable pageable, double price) {
        return this.productRepository.findAll(ProductSpecs.maxPrice(price), pageable);
    }

    public Page<Product> fetchMatchPriceProductWithSpec(Pageable pageable, String price) {

        double min = 0;
        double max = 0;

        switch (price) {
            case "3-toi-15-tr":
                min = 3000000;
                max = 15000000;
                return this.productRepository.findAll(ProductSpecs.matchPrice(min, max), pageable);

            case "15-toi-20-tr":
                min = 15000000;
                max = 20000000;
                return this.productRepository.findAll(ProductSpecs.matchPrice(min, max), pageable);

            case "20-toi-30-tr":
                min = 20000000;
                max = 30000000;
                return this.productRepository.findAll(ProductSpecs.matchPrice(min, max), pageable);

            case "30-toi-50-tr":
                min = 30000000;
                max = 50000000;
                return this.productRepository.findAll(ProductSpecs.matchPrice(min, max), pageable);

            case "50-toi-80-tr":
                min = 30000000;
                max = 50000000;
                return this.productRepository.findAll(ProductSpecs.matchPrice(min, max), pageable);

            default:
                return this.productRepository.findAll(pageable);

        }

    }
    


    public Specification<Product> buildPriceSpecification(List<String> price) {
        Specification<Product> combinedSpec = Specification.where(null);

       
        for (String p : price) {
            double min = 0;
            double max = 0;

            switch (p) {
                case "duoi-15-tr":
                    min = 1;
                    max = 15000000;
                 
                    break;

                case "15-toi-20-tr":
                    min = 15000000;
                    max = 20000000;
                   
                    break;
                case "20-toi-30-tr":
                    min = 20000000;
                    max = 30000000;
                  
                    break;
                case "30-toi-50-tr":
                    min = 30000000;
                    max = 50000000;
                  
                    break;
                case "tren-50-tr":
                    min = 50000000;
                    max = 90000000;
                
                    break;

            }
            if (min != 0 && max != 0) {
                Specification<Product> rangeSpec = ProductSpecs.matchMultiplePrice(min, max);
                combinedSpec = combinedSpec.or(rangeSpec);

            }

        }
       
        return combinedSpec;

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
    
  public void handleAddProductToCart(String email, long productId, HttpSession session, long  quantity) {
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
                   cd.setQuantity(quantity);
                   this.cartDetailRepository.save(cd);

                   int Sum = cart.getSum() + 1;
                   cart.setSum(Sum);
                   this.cartRepository.save(cart);
                   session.setAttribute("sum", Sum);
               } else {
                   oldDetail.setQuantity(oldDetail.getQuantity() + quantity);
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
        @Transactional
        public void handlePlaceOrder(User user, HttpSession session, String receiverName, String receiverAddress,
                String receiverPhone) {
    // Bước 1: Lấy giỏ hàng theo người dùng
    Cart cart = this.cartRepository.findByUser(user);
   

   
    if (cart != null) {

        
        List<CartDetail> cartDetails = cart.getCartDetails();
       
       
        if (cartDetails != null) {
             // Tạo đơn hàng
    Order order = new Order();
    order.setUser(user);
    order.setReceiverName(receiverName);
    order.setReceiverAddress(receiverAddress);
    order.setReceiverPhone(receiverPhone);
    order.setStatus("PENDING");
    double sum = 0;
    for (CartDetail cd : cartDetails) {
        sum += cd.getPrice();
    }
    order.setTotalPrice(sum);
    
    order = this.orderRepository.save(order);
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
