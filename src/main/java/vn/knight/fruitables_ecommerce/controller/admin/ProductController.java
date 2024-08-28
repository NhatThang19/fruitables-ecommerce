package vn.knight.fruitables_ecommerce.controller.admin;

import java.util.List;
import java.time.Instant;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.knight.fruitables_ecommerce.domain.Category;
import vn.knight.fruitables_ecommerce.domain.Origin;
import vn.knight.fruitables_ecommerce.domain.Product;
import vn.knight.fruitables_ecommerce.domain.ProductImage;
import vn.knight.fruitables_ecommerce.domain.Unit;
import vn.knight.fruitables_ecommerce.repository.ProductImgRepository;
import vn.knight.fruitables_ecommerce.service.CategoryService;
import vn.knight.fruitables_ecommerce.service.ImageService;
import vn.knight.fruitables_ecommerce.service.OriginService;
import vn.knight.fruitables_ecommerce.service.ProductService;
import vn.knight.fruitables_ecommerce.service.UnitService;

@Controller
public class ProductController {
    private final ProductService productService;
    private final CategoryService categoryService;
    private final OriginService originService;
    private final ImageService imageService;
    private final ProductImgRepository productImgRepository;
    private final UnitService unitService;

    public ProductController(ProductService productService, CategoryService categoryService,
            OriginService originService, ImageService imageService, ProductImgRepository productImgRepository,
            UnitService unitService) {
        this.productService = productService;
        this.categoryService = categoryService;
        this.originService = originService;
        this.imageService = imageService;
        this.productImgRepository = productImgRepository;
        this.unitService = unitService;
    }

    String path = "product";

    @GetMapping("/admin/product")
    public String getProductDashboard(Model model) {
        model.addAttribute("path", path);
        List<Product> products = this.productService.getAllProduct();
        model.addAttribute("products", products);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("path", path);
        model.addAttribute("newProduct", new Product());
        List<Category> categoryList = this.categoryService.getAllCategory();
        model.addAttribute("categoryList", categoryList);
        List<Origin> originList = this.originService.getAllOrigin();
        model.addAttribute("originList", originList);
        List<Unit> unitList = this.unitService.getAllUnits();
        model.addAttribute("unitList", unitList);
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProductHandel(Model model, @ModelAttribute("newProduct") @Valid Product newProduct,
            BindingResult newProductBindingResult,
            @RequestParam("avatarFile") MultipartFile file, @RequestParam("images") List<MultipartFile> files) {
        List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>" + error.getField() + " - " +
                    error.getDefaultMessage());
        }

        if (newProductBindingResult.hasErrors()) {
            List<Category> categoryList = this.categoryService.getAllCategory();
            model.addAttribute("categoryList", categoryList);
            List<Origin> originList = this.originService.getAllOrigin();
            model.addAttribute("originList", originList);
            List<Unit> unitList = this.unitService.getAllUnits();
            model.addAttribute("unitList", unitList);
            return "admin/product/create";
        }

        String avatar = this.imageService.handleSaveUploadOneImg(file, "product");
        newProduct.setImage(this.imageService.getImgByName(avatar));
        if (newProduct.getCategory() != null) {
            newProduct.setCategory(this.productService.getCategoryByName(newProduct.getCategory().getName()));
        }
        if (newProduct.getOrigin() != null) {
            newProduct.setOrigin(this.productService.getOriginByName(newProduct.getOrigin().getName()));
        }
        if (newProduct.getUnit() != null) {
            newProduct.setUnit(this.productService.getUnitByName(newProduct.getUnit().getName()));
        }
        newProduct.setCreatedDate(Instant.now());
        newProduct.setLastModifiedDate(newProduct.getCreatedDate());
        this.productService.handleSaveProduct(newProduct);
        for (MultipartFile filez : files) {
            if (filez.getOriginalFilename().isEmpty()) {
                return "redirect:/admin/product";
            }
        }
        this.imageService.handelUpdateMultiFile(files, "product", newProduct);

        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductPage(Model model, @PathVariable long id) {
        model.addAttribute("path", path);
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        List<ProductImage> productImgs = this.productImgRepository.findByProductId(product.getId());

        model.addAttribute("productImgs", productImgs);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        model.addAttribute("path", path);
        Product product = this.productService.getProductById(id);
        List<Category> categoryList = this.categoryService.getAllCategory();
        model.addAttribute("categoryList", categoryList);
        List<Origin> originList = this.originService.getAllOrigin();
        model.addAttribute("originList", originList);
        List<Unit> unitList = this.unitService.getAllUnits();
        model.addAttribute("unitList", unitList);
        List<ProductImage> listImg = this.productImgRepository.findByProductId(product.getId());
        model.addAttribute("listImg", listImg);
        model.addAttribute("currentProduct", product);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String updateProductHandle(Model model, @ModelAttribute("currentProduct") @Valid Product product,
            BindingResult currentProductBindingResult,
            @RequestParam("avatarFile") MultipartFile file, @RequestParam("images") List<MultipartFile> files) {
        model.addAttribute("path", path);

        List<FieldError> errors = currentProductBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>" + error.getField() + " - " +
                    error.getDefaultMessage());
        }

        if (currentProductBindingResult.hasErrors()) {
            List<Category> categoryList = this.categoryService.getAllCategory();
            model.addAttribute("categoryList", categoryList);
            List<Origin> originList = this.originService.getAllOrigin();
            model.addAttribute("originList", originList);
            List<Unit> unitList = this.unitService.getAllUnits();
            model.addAttribute("unitList", unitList);
            return "/admin/product/update";
        }

        Product currentProduct = this.productService.getProductById(product.getId());
        if (currentProduct != null) {
            if (!file.isEmpty()) {
                String avatar = this.imageService.handleSaveUploadOneImg(file, "product");
                currentProduct.setImage(this.imageService.getImgByName(avatar));
            }
            if (product.getCategory() != null) {
                currentProduct.setCategory(this.productService.getCategoryByName(product.getCategory().getName()));
            }
            if (product.getOrigin() != null) {
                currentProduct.setOrigin(this.productService.getOriginByName(product.getOrigin().getName()));
            }
            if (product.getUnit() != null) {
                currentProduct.setUnit(this.productService.getUnitByName(product.getUnit().getName()));
            }
            currentProduct.setLastModifiedDate(Instant.now());
            currentProduct.setShortDesc(product.getShortDesc());
            currentProduct.setDetailDesc(product.getDetailDesc());
            currentProduct.setName(product.getName());
            currentProduct.setPrice(product.getPrice());
            currentProduct.setStatus(product.getStatus());
            for (MultipartFile filez : files) {
                if (filez.getOriginalFilename().isEmpty()) {
                    return "redirect:/admin/product";
                }
            }
            this.imageService.handelUpdateMultiFile(files, "product", currentProduct);
        }
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String getDeleteHandle(Model model, @ModelAttribute("product") Product product) {
        List<ProductImage> listP = this.productImgRepository.findByProductId(product.getId());
        for (ProductImage img : listP) {
            this.productImgRepository.deleteById(img.getId());
        }
        this.productService.deleteProductById(product.getId());
        return "redirect:/admin/product";
    }

}
