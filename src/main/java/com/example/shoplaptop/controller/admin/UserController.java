package com.example.shoplaptop.controller.admin;


import java.util.List;


import org.springframework.security.crypto.password.PasswordEncoder;
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

import com.example.shoplaptop.domain.User;
import com.example.shoplaptop.service.UploadService;
import com.example.shoplaptop.service.UserService;


import jakarta.validation.Valid;



@Controller
public class UserController {
    
    
    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;


 public UserController(
            UploadService uploadService,
            UserService userService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }
    
    //find user by email
    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> arrUsers = this.userService.getAllUsersByEmail("nampham@gmail.com");
        System.out.println(arrUsers);
        model.addAttribute("newUser", new User());
       
        return "hello";
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();

        model.addAttribute("users1", users);
        return "admin/user/show";
    }

      // user detail
      @RequestMapping("/admin/user/{id}")
      public String getUserDetailPage(Model model, @PathVariable long id) {
          User user = this.userService.getUserById(id);
          System.out.println("check path id: " + id);
          model.addAttribute("id", id);
          model.addAttribute("user", user);
          return "admin/user/detail";

      }
    
      @GetMapping("/admin/user/create") //get
      public String getCreateUserPage(Model model) {

          model.addAttribute("newUser", new User());

          return "admin/user/create";
      }

    
     //xu ly file - create
  @PostMapping(value = "/admin/user/create")
public String createUserPage(Model model,
        @ModelAttribute("newUser") @Valid User nam,
        BindingResult newUserBindingResult,
        @RequestParam("namFile") MultipartFile file) {
    
    // In lỗi để debug
    List<FieldError> errors = newUserBindingResult.getFieldErrors();
    for (FieldError error : errors) {
        System.out.println(">>>>>" + error.getField() + " - " + error.getDefaultMessage());
    }

    // Nếu có lỗi xác thực, trả về trang create với thông tin lỗi
    if (newUserBindingResult.hasErrors()) {
        return "admin/user/create"; // Trả về trang tạo người dùng
    }

    String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
    String hashPassword = this.passwordEncoder.encode(nam.getPassword());

    nam.setAvatar(avatar);
    nam.setPassword(hashPassword);
    nam.setRole(this.userService.getRoleByName(nam.getRole().getName()));

    this.userService.handleSaveUser(nam);
    return "redirect:/admin/user";
}
    
    //page update
       @RequestMapping("/admin/user/update/{id}") //get
       public String getUpdateUserPage(Model model, @PathVariable long id) {
           User currentUser = this.userService.getUserById(id);
           model.addAttribute("newUser", currentUser);

           return "admin/user/update";
       }
   
         // xu li update
     @PostMapping("/admin/user/update")
         public String postUpdateUser(Model model, 
        @ModelAttribute("newUser") User nam
        ) {
    

    User currentUser = this.userService.getUserById(nam.getId());
    if (currentUser != null) {
        currentUser.setAddress(nam.getAddress());
        currentUser.setFullname(nam.getFullname());
        currentUser.setPhone(nam.getPhone());
       
        this.userService.handleSaveUser(currentUser);
    }

    return "redirect:/admin/user";
}
      
         // page delete
         @GetMapping("/admin/user/delete/{id}") //get
         public String getDeleteUserPage(Model model, @PathVariable long id) {

             model.addAttribute("id", id);
             //  User user = new User();
             //  user.setId(id);
             model.addAttribute("newUser", new User());

             return "admin/user/delete";
         }
         
         //xu li delete
           @PostMapping("/admin/user/delete") //get
         public String postDeleteUser(Model model, @ModelAttribute("newUser") User nam) {
           this.userService.deleteAUser(nam.getId());
             return "redirect:/admin/user";
         }


      
}
