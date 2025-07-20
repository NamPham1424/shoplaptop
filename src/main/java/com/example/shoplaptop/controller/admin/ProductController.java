package com.example.shoplaptop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.shoplaptop.domain.Product;
import com.example.shoplaptop.service.ProductService;
import com.example.shoplaptop.service.UploadService;

import jakarta.validation.Valid;

@Controller
public class ProductController {

    private final UploadService uploadService;
    private final ProductService productService;
    public ProductController(UploadService uploadService,ProductService productService) {
        this.uploadService = uploadService;
        this.productService = productService;
    }
    //      @RequestParam(value = "page", defaultValue = "1"
    //show list product
    @GetMapping("/admin/product")
    public String getProduct(Model model,
            @RequestParam(value = "page") Optional<String> pageOptional) {
        
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                //convert form String to int
                page = Integer.parseInt(pageOptional.get());

            }
            else {
                //page 1
            }

        } catch (Exception e) {
            // TODO: handle exception
        }



        Pageable pageable = PageRequest.of(page - 1, 5);
        Page<Product> prs = this.productService.fetchProducts(pageable);
        List<Product> listProducts = prs.getContent();

        
    
        model.addAttribute("products", listProducts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
    
        return "admin/product/show";
    }
    

    //
    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";

    }

      @PostMapping("/admin/product/create")
    public String handleCreateProduct(
            @ModelAttribute("newProduct") @Valid Product pro,
            BindingResult newProductBindingResult,
            @RequestParam("namFile") MultipartFile file) {
        // validate
        if (newProductBindingResult.hasErrors()) {
            return "admin/product/create";
        }

        // upload image
        String image = this.uploadService.handleSaveUploadFile(file, "product");
        pro.setImage(image);

        this.productService.createProduct(pro);

        return "redirect:/admin/product";
    }

    @RequestMapping("/admin/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        Product pro = this.productService.fetchProductById(id).get();
        model.addAttribute("id", id);
        model.addAttribute("product", pro);

        return "admin/product/detail";
    }
    

    @RequestMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Product currentProduct = this.productService.fetchProductById(id).get();
        model.addAttribute("newProduct", currentProduct);
        return "admin/product/update";
    }
 

    @PostMapping("/admin/product/update")
    public String postUpdateProduct(@ModelAttribute("newProduct") @Valid Product pro
    ,BindingResult newProductBindingResult,
    @RequestParam("namFile") MultipartFile file) {


        //validate
        if (newProductBindingResult.hasErrors()) {
            return "admin/product/update";
        }



        Product currentProduct = this.productService.fetchProductById(pro.getId()).get();
        if (currentProduct != null) {


            //update image
            if (!file.isEmpty()) {
                String image = this.uploadService.handleSaveUploadFile(file, "product");
            
               currentProduct.setImage(image);}


            currentProduct.setDetailDesc(pro.getDetailDesc());
            currentProduct.setFactory(pro.getFactory());
            currentProduct.setQuantity(pro.getQuantity());
            currentProduct.setShortDesc(pro.getShortDesc());
            currentProduct.setName(pro.getName());
      
            currentProduct.setTarget(pro.getTarget());
            currentProduct.setPrice(pro.getPrice());
         

            this.productService.createProduct(currentProduct);

        }

        return "redirect:/admin/product";

    }
     

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {

        model.addAttribute("id", id);
        model.addAttribute("newProduct", new Product());
        return "admin/product/delete";

    }
    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(Model model, @ModelAttribute("newProduct") Product pro) {
        
        this.productService.deleteById(pro.getId());
        return "redirect:/admin/product";
    } 
    



}
