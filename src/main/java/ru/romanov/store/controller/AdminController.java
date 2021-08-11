package ru.romanov.store.controller;

import ru.romanov.store.service.ProductService;
import ru.romanov.store.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private ProductService productService;

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
}
