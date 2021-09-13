package ru.romanov.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.romanov.store.entity.User;
import ru.romanov.store.service.ProductService;
import ru.romanov.store.service.UserService;

@Controller
public class HomeController {

    @Autowired
    private ProductService productService;
    @Autowired
    private UserService userService;

    @GetMapping("/home")
    public String productList(Model model){
        model.addAttribute("allProducts", productService.allProducts());
        return "home";
    }

    @PostMapping("/addproduct")
    public String addProduct(@AuthenticationPrincipal User user,
                             @RequestParam(required = true, defaultValue = "" ) Long productId,
                             Model model) {
        if (!userService.addProductUserList(user, productId)){
            model.addAttribute("addError", "Продукт не добавлен в корзину");
            return "redirect:/home";
        }
        return "redirect:/home";
    }
}
