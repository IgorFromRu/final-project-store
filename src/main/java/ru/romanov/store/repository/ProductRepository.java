package ru.romanov.store.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.romanov.store.entity.Product;
import ru.romanov.store.entity.User;

public interface ProductRepository extends JpaRepository <Product, Long> {

    Product findByName(String name);
}
