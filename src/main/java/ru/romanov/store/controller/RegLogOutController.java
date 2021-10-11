package ru.romanov.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import ru.romanov.store.entity.User;
import ru.romanov.store.service.UserService;

import javax.validation.Valid;


@Controller
public class RegLogOutController {

    @Autowired
    private UserService userService;

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @PostMapping("/registration")
    public String createUser(@ModelAttribute("userForm") @Valid User userForm, Model model) {

        try {
            userService.createUser(userForm);
            return "redirect:/login";
        } catch (IllegalArgumentException e) {
            model.addAttribute("usernameError", e.getMessage());
            return "registration";
        }
    }
}
