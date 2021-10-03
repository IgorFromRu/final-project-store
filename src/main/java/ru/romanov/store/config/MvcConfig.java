package ru.romanov.store.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer {

    @Value("${upload.path}")
    private String uploadPath;

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/login").setViewName("login");
        registry.addViewController("/admin").setViewName("admin");
        registry.addViewController("/contacts").setViewName("contacts");
        registry.addViewController("/registration").setViewName("registration");
        registry.addViewController("/news").setViewName("news");
        registry.addViewController("/about").setViewName("about");
        registry.addViewController("/home").setViewName("home");
        registry.addViewController("/adminproduct").setViewName("adminproduct");
        registry.addViewController("/userlistproduct").setViewName("userlistproduct");
        registry.addViewController("/userprofile").setViewName("userprofile");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/img/**")
                .addResourceLocations("file://" + uploadPath + "/");
        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");
    }
}
