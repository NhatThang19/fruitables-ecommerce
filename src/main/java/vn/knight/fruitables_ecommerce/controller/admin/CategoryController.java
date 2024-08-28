package vn.knight.fruitables_ecommerce.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import vn.knight.fruitables_ecommerce.domain.Category;
import vn.knight.fruitables_ecommerce.domain.Product;
import vn.knight.fruitables_ecommerce.service.CategoryService;
import vn.knight.fruitables_ecommerce.service.ImageService;
import vn.knight.fruitables_ecommerce.service.ProductService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CategoryController {
    private final CategoryService categoryService;
    private final ImageService imageService;
    private final ProductService productService;

    public CategoryController(CategoryService categoryService, ImageService imageService,
            ProductService productService) {
        this.categoryService = categoryService;
        this.imageService = imageService;
        this.productService = productService;
    }

    String path = "tag";

    @GetMapping("/admin/category")
    public String getCategoryDashboard(Model model) {
        model.addAttribute("path", path);
        List<Category> categories = this.categoryService.getAllCategory();
        model.addAttribute("categories", categories);
        return "admin/category/show";
    }

    @GetMapping("/admin/category/create")
    public String getCreateCategoryPage(Model model) {
        model.addAttribute("path", path);
        model.addAttribute("newCategory", new Category());
        return "admin/category/create";
    }

    @PostMapping("/admin/category/create")
    public String createCategoryHandle(Model model, @ModelAttribute("newCategory") @Valid Category newCategory,
            BindingResult newCategoryBindingResult,
            @RequestParam("avatarFile") MultipartFile file) {
        List<FieldError> errors = newCategoryBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>" + error.getField() + " - " +
                    error.getDefaultMessage());
        }

        if (newCategoryBindingResult.hasErrors()) {
            return "admin/category/create";
        }

        String avatar = this.imageService.handleSaveUploadOneImg(file, "category");
        newCategory.setImage(this.imageService.getImgByName(avatar));

        this.categoryService.handleCreateCategory(newCategory);

        return "redirect:/admin/category";
    }

    @GetMapping("/admin/category/delete/{id}")
    public String getDeleteCategoryPage(Model model, @PathVariable Long id) {
        Category category = this.categoryService.getCategoryById(id);
        model.addAttribute("category", category);
        return "admin/category/delete";
    }

    @PostMapping("/admin/category/delete")
    public String handleDeleteCategory(Model model, @ModelAttribute("category") Category category) {
        List<Product> products = this.productService.getProductsByCategoryId(category.getId());
        for (Product product : products) {
            product.setCategory(null);
            this.productService.handleSaveProduct(product);
        }

        this.categoryService.deleteCategoryById(category.getId());
        return "redirect:/admin/category";

    }

    @GetMapping("/admin/category/update/{id}")
    public String getUpdateCategoryPage(Model model, @PathVariable long id) {
        model.addAttribute("path", path);
        Category category = this.categoryService.getCategoryById(id);
        model.addAttribute("currentCategory", category);
        return "admin/category/update";
    }

    @PostMapping("/admin/category/update")
    public String handleUpdateCategory(Model model, @ModelAttribute("currentCategory") @Valid Category category,
            BindingResult currentCategoryBindingResult,
            @RequestParam("avatarFile") MultipartFile file) {
        model.addAttribute("path", path);
        List<FieldError> errors = currentCategoryBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>" + error.getField() + " - " +
                    error.getDefaultMessage());
        }

        if (currentCategoryBindingResult.hasErrors()) {
            return "admin/category/update";
        }

        Category currentCategory = this.categoryService.getCategoryById(category.getId());
        if (currentCategory != null) {
            if (!file.isEmpty()) {
                String avatar = this.imageService.handleSaveUploadOneImg(file, "category");
                currentCategory.setImage(this.imageService.getImgByName(avatar));
            }
            currentCategory.setName(category.getName());
            currentCategory.setDescription(category.getDescription());

            this.categoryService.handleCreateCategory(currentCategory);
        }
        return "redirect:/admin/category";
    }

}
