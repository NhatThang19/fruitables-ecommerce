package vn.knight.fruitables_ecommerce.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.knight.fruitables_ecommerce.domain.Category;
import vn.knight.fruitables_ecommerce.repository.CategoryRepository;

@Service
public class CategoryService {
    private final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public List<Category> getAllCategory() {
        return this.categoryRepository.findAll();
    }

    public Category handleCreateCategory(Category category) {
        return this.categoryRepository.save(category);
    }

    public Category getCategoryById(Long id) {
        return this.categoryRepository.findById(id).get();
    }

    public List<Category> getCategoryByImageId(Long imageId) {
        return categoryRepository.findCategoryByImgId(imageId);
    }

    public void deleteCategoryById(Long id) {
        this.categoryRepository.deleteById(id);
    }
}
