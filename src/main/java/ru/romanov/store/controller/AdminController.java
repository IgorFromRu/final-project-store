package ru.romanov.store.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ru.romanov.store.entity.Product;
import ru.romanov.store.entity.User;
import ru.romanov.store.service.ProductService;
import ru.romanov.store.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private ProductService productService;
    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/admin")
    public String userList(Model model) {
        model.addAttribute("allUsers", userService.allUsers());
        return "admin";
    }

    @PostMapping("/admin")
    public String  deleteUser(@RequestParam(required = true, defaultValue = "" ) Long userId,
                              @RequestParam(required = true, defaultValue = "" ) String action,
                              Model model) {
        if (action.equals("delete")){
            userService.deleteUser(userId);
        }
        return "redirect:/admin";
    }

    @GetMapping("/admin/gt/{userId}")
    public String  gtUser(@PathVariable("userId") Long userId, Model model) {
        model.addAttribute("allUsers", userService.usergtList(userId));
        return "admin";
    }

    @GetMapping("/adminproduct")
    public String productList(Model model) {
        model.addAttribute("allProducts", productService.allProducts());
        return "adminproduct";
    }

    @PostMapping("/adminproduct")
    public String  deleteProducts(@RequestParam(required = true, defaultValue = "" ) Long productId,
                              @RequestParam(required = true, defaultValue = "" ) String action,
                              Model model) {
        if (action.equals("delete")){
            productService.deleteProduct(productId);
        }
        return "redirect:/adminproduct";
    }

    @GetMapping("/adminproduct/gt/{productId}")
    public String  gtProduct(@PathVariable("productId") Long productId, Model model) {
        model.addAttribute("allProducts", productService.productgtList(productId));
        return "adminproduct";
    }

    @PostMapping("/adminproduct/addproduct")
    public String addProduct(@ModelAttribute("productForm")
                             @Valid Product productForm,
                             @RequestParam("file") MultipartFile file,
                             Model model) throws IOException {
        if (file != null){
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file.getOriginalFilename();
            file.transferTo(new File(uploadPath + "/" + resultFileName));
            productForm.setFileName(resultFileName);
        }
        if (!productService.saveProduct(productForm)){
            model.addAttribute("productNameError", "Продукт с таким именем уже существует");
            return "redirect:/adminproduct";
        }
        return "redirect:/adminproduct";
    }
}


 