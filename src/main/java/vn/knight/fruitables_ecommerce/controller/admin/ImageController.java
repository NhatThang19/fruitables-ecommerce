package vn.knight.fruitables_ecommerce.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.knight.fruitables_ecommerce.domain.Category;
import vn.knight.fruitables_ecommerce.domain.Image;
import vn.knight.fruitables_ecommerce.domain.Origin;
import vn.knight.fruitables_ecommerce.domain.Product;
import vn.knight.fruitables_ecommerce.domain.User;
import vn.knight.fruitables_ecommerce.service.CategoryService;
import vn.knight.fruitables_ecommerce.service.ImageService;
import vn.knight.fruitables_ecommerce.service.OriginService;
import vn.knight.fruitables_ecommerce.service.ProductService;
import vn.knight.fruitables_ecommerce.service.UserService;

import java.util.List;

@Controller
public class ImageController {

    private final UserService userService;
    private final ImageService imageService;
    private final ProductService productService;
    private final CategoryService categoryService;
    private final OriginService originService;

    public ImageController(UserService userService, ImageService imageService, ProductService productService,
            CategoryService categoryService, OriginService originService) {
        this.userService = userService;
        this.imageService = imageService;
        this.productService = productService;
        this.categoryService = categoryService;
        this.originService = originService;
    }

    String path = "image";

    @GetMapping("/admin/gallery")
    public String getGalleryPage(Model model) {
        model.addAttribute("path", path);
        List<Image> images = this.imageService.getAllImg();
        model.addAttribute("images", images);
        return "admin/image/gallery";
    }

    @GetMapping("/admin/gallery/delete/{id}")
    public String getDeleteImgPage(Model model, @PathVariable long id) {
        Image image = this.imageService.findImageById(id);
        model.addAttribute("image", image);
        return "admin/image/delete";
    }

    @PostMapping("/admin/gallery/delete")
    public String deleteImageHandle(Model model, @ModelAttribute("image") Image image_Image,
            @RequestParam("avatarFile") MultipartFile file) {
        Image image = this.imageService.findImageById(image_Image.getId());

        List<User> users = this.userService.getUsersByImageId(image.getId());
        for (User user : users) {
            String avatar = this.imageService.handleSaveUploadOneImg(file, "user");
            user.setImage(this.imageService.getImgByName(avatar));
            this.userService.handleSaveUser(user);
        }

        List<Product> products = this.productService.getProductsByImageId(image.getId());
        for (Product product : products) {
            String avatar = this.imageService.handleSaveUploadOneImg(file, "product");
            product.setImage(this.imageService.getImgByName(avatar));
            this.productService.handleSaveProduct(product);
        }

        List<Category> categories = this.categoryService.getCategoryByImageId(image.getId());
        for (Category category : categories) {
            String avatar = this.imageService.handleSaveUploadOneImg(file, "category");
            category.setImage(this.imageService.getImgByName(avatar));
            this.categoryService.handleCreateCategory(category);
        }

        List<Origin> origins = this.originService.getOriginByImageId(image.getId());
        for (Origin origin : origins) {
            String avatar = this.imageService.handleSaveUploadOneImg(file, "origin");
            origin.setImage(this.imageService.getImgByName(avatar));
            this.originService.handleCreateOrigin(origin);
        }

        this.imageService.deleteAImg(image);

        return "redirect:/admin/gallery";
    }
}
