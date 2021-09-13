package ru.romanov.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ru.romanov.store.entity.Product;
import ru.romanov.store.repository.ProductRepository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    @PersistenceContext
    private EntityManager em;
    @Autowired
    ProductRepository productRepository;

    public Product loadProductByName(String name) {
        Product product = productRepository.findByName(name);

        if (product == null) {
            throw new UsernameNotFoundException("Продукт не найден");
        }

        return product;
    }

    public Product findProductById(Long productId) {
        Optional<Product> productFromDb = productRepository.findById(productId);
        return productFromDb.orElse(new Product());
    }

    public List<Product> allProducts() {
        return productRepository.findAll();
    }

    public boolean saveProduct(Product product) {
        Product productFromDB = productRepository.findByName(product.getName());

        if (productFromDB != null) {
            return false;
        }

        product.setName(product.getName());
        product.setPrice(product.getPrice());
        productRepository.save(product);
        return true;
    }

    public boolean deleteProduct(Long productId) {
        if (productRepository.findById(productId).isPresent()) {
            productRepository.deleteById(productId);
            return true;
        }
        return false;
    }

    public List<Product> productgtList(Long idMin) {
        return em.createQuery("SELECT p FROM Product p WHERE p.id > :paramId", Product.class)
                .setParameter("paramId", idMin).getResultList();
    }
}
