package ru.romanov.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.romanov.store.service.ProductService;

@Controller
public class HomeController {

    @Autowired
    private ProductService productService;

    @GetMapping("/home")
    public String productList(Model model){
        model.addAttribute("allProducts", productService.allProducts());
        return "home";
    }
}
