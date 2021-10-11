package ru.romanov.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ru.romanov.store.entity.Product;
import ru.romanov.store.repository.ProductRepository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.io.File;
import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    @PersistenceContext
    private EntityManager em;
    @Autowired
    ProductRepository productRepository;
    @Value("${upload.path}")
    private String uploadPath;

    public Product findProductById(Long productId) {
        Optional<Product> productFromDb = productRepository.findById(productId);
        return productFromDb.orElseThrow(() -> new UsernameNotFoundException("Продукт не найден"));
    }

    public List<Product> allProducts() {
        return productRepository.findAll();
    }

    public boolean saveProduct(Product product) {
        Product productFromDB = productRepository.findByName(product.getName());

        if (productFromDB != null) {
            return false;
        }

        productRepository.save(product);
        return true;
    }

    public boolean deleteProduct(Long productId) {
        Optional<Product> product = productRepository.findById(productId);
        if (product.isPresent()) {
            new File(uploadPath + "/" + product.get().getFileName()).delete();
            productRepository.deleteById(productId);
            return true;
        }
        return false;
    }
}
