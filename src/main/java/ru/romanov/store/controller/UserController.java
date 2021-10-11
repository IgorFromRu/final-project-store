package ru.romanov.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.romanov.store.entity.User;
import ru.romanov.store.service.UserService;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/userlistproduct")
    public String userList(@AuthenticationPrincipal User user, Model model) {
        model.addAttribute("allProductsOfUser", userService.getUserListProducts(user));
        return "userlistproduct";
    }

    @PostMapping("/deleteproduct")
    public String deleteProduct(@AuthenticationPrincipal User user,
                                @RequestParam(required = true, defaultValue = "") Long productId,
                                Model model) {
        if (!userService.deleteProductFromUserList(user, productId)) {
            model.addAttribute("deleteError", "Продукт не удалился");
            return "redirect:/userlistproduct";
        }
        return "redirect:/userlistproduct";
    }

    @GetMapping("/userprofile")
    public String userProfile(@AuthenticationPrincipal User user, Model model) {
        model.addAttribute("user", userService.findUserById(user.getId()));
        return "userprofile";
    }

    @PostMapping("/addproduct")
    public String addProduct(@AuthenticationPrincipal User user,
                             @RequestParam(required = true, defaultValue = "") Long productId,
                             Model model) {
        if (!userService.addProductToUserList(user, productId)) {
            model.addAttribute("addError", "Продукт не добавлен в корзину");
            return "redirect:/home";
        }
        return "redirect:/home";
    }
}
