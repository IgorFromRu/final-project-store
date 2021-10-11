package ru.romanov.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.romanov.store.entity.Product;
import ru.romanov.store.entity.Role;
import ru.romanov.store.entity.User;
import ru.romanov.store.repository.RoleRepository;
import ru.romanov.store.repository.UserRepository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class UserService implements UserDetailsService {
    @PersistenceContext
    private EntityManager em;
    @Autowired
    UserRepository userRepository;
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    ProductService productService;
    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) {
        User user = userRepository.findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("Пользователь не найден");
        }
        return user;
    }

    public User findUserById(Long userId) {
        Optional<User> userFromDb = userRepository.findById(userId);
        return userFromDb.orElseThrow(() -> new UsernameNotFoundException("Пользователь не найден"));
    }

    public List<User> findAllUsers() {
        return userRepository.findAll();
    }

    public User createUser(User user) {
        User usersFromDb = userRepository.findByUsernameOrEmail(user.getUsername(), user.getEmail());
        if (usersFromDb != null) {
            throw new IllegalArgumentException("Пользователь с таким именем или почтой уже существует");
        }

        user.setRoles(Collections.singleton(new Role(1L, "ROLE_USER")));
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        return user;
    }

    public boolean deleteUser(Long userId) {
        if (userRepository.findById(userId).isPresent()) {
            userRepository.deleteById(userId);
            return true;
        }
        return false;
    }

    public List<Product> getUserListProducts(User user) {
        return userRepository.findByUsername(user.getUsername()).getProductList();
    }

    @Transactional
    public boolean addProductToUserList(User user, Long productId) {
        Product productDB = productService.findProductById(productId);
        em.createNativeQuery("INSERT INTO user_product_list (user_id, product_list_id) VALUES (?,?)")
                .setParameter(1, user.getId())
                .setParameter(2, productDB.getId())
                .executeUpdate();
        return true;
    }

    @Transactional
    public boolean deleteProductFromUserList(User user, Long productId) {
        em.createNativeQuery("DELETE FROM  user_product_list WHERE user_id = ? AND product_list_id = ? limit 1;")
                .setParameter(1, user.getId())
                .setParameter(2, productId)
                .executeUpdate();
        return true;
    }
}
