package ru.romanov.store.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.romanov.store.entity.User;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
    User findByUsernameOrEmail(String username, String email);
}
