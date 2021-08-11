package ru.romanov.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.romanov.store.entity.User;
import ru.romanov.store.service.ProductService;
import ru.romanov.store.service.UserService;

@Controller
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private ProductService productService;

    @GetMapping("/userlistproduct")
    public String userList(@AuthenticationPrincipal User user, Model model) {
        model.addAttribute("allProductsOfUser", userService.UsergtListProducts(user));
        return "userlistproduct";
    }
}
