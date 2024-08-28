package vn.knight.fruitables_ecommerce.service;

import java.util.List;

import org.springframework.stereotype.Service;

import jakarta.servlet.ServletContext;
import vn.knight.fruitables_ecommerce.domain.Category;
import vn.knight.fruitables_ecommerce.domain.Origin;
import vn.knight.fruitables_ecommerce.domain.Product;
import vn.knight.fruitables_ecommerce.domain.Unit;
import vn.knight.fruitables_ecommerce.repository.CategoryRepository;
import vn.knight.fruitables_ecommerce.repository.OriginRepository;
import vn.knight.fruitables_ecommerce.repository.ProductRepository;
import vn.knight.fruitables_ecommerce.repository.UnitRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository;
    private final OriginRepository originRepository;
    private final UnitRepository unitRepository;

    public ProductService(ProductRepository productRepository, CategoryRepository categoryRepository,
            OriginRepository originRepository, ServletContext servletContext, ImageService imageService,
            UnitRepository unitRepository) {
        this.productRepository = productRepository;
        this.categoryRepository = categoryRepository;
        this.originRepository = originRepository;
        this.unitRepository = unitRepository;

    }

    public Product handleSaveProduct(Product newProduct) {
        return this.productRepository.save(newProduct);
    }

    public Category getCategoryByName(String name) {
        return this.categoryRepository.findByName(name);
    }

    public Origin getOriginByName(String name) {
        return this.originRepository.findByName(name);
    }

    public Unit getUnitByName(String name) {
        return this.unitRepository.findByName(name);
    }

    public Product getProductById(long id) {
        return this.productRepository.findById(id);
    }

    public List<Product> getAllProduct() {
        return this.productRepository.findAll();
    }

    public void deleteProductById(long id) {
        this.productRepository.deleteById(id);
    }

    public long countTotal() {
        return this.productRepository.count();
    }

    public List<Product> getProductsByImageId(Long imageId) {
        return this.productRepository.findProductsByImageId(imageId);
    }

    public List<Product> getProductsByUnitId(Long unitId) {
        return this.productRepository.findAllByUnitId(unitId);
    }

    public List<Product> getProductsByCategoryId(Long categoryId) {
        return this.productRepository.findALlByCategoryId(categoryId);
    }

    public List<Product> getProductsByOriginId(Long originId) {
        return this.productRepository.findALlByOriginId(originId);
    }

}
