package vn.knight.fruitables_ecommerce.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;
import vn.knight.fruitables_ecommerce.domain.Image;
import vn.knight.fruitables_ecommerce.domain.User;
import vn.knight.fruitables_ecommerce.service.ImageService;
import vn.knight.fruitables_ecommerce.service.UserService;

import java.io.File;
import java.util.List;

@Controller
public class ImageController {

    private final UserService userService;
    private final ImageService imageService;
    private final ServletContext servletContext;

    public ImageController(UserService userService, ImageService imageService,
            ServletContext servletContext) {
        this.userService = userService;
        this.imageService = imageService;
        this.servletContext = servletContext;
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
    public String showDeleteImgPage(Model model, @PathVariable long id) {
        Image image = this.imageService.findImageById(id);
        model.addAttribute("image", image);
        return "admin/image/delete";
    }

    @PostMapping("/admin/gallery/delete")
    public String deleteImage(Model model, @ModelAttribute("image") Image image,
            @RequestParam("avatarFile") MultipartFile file) {
        image = this.imageService.findImageById(image.getId());
        List<User> users = this.userService.getUsersByImageId(image.getId());
        for (User user : users) {
            String avatar = this.imageService.handleSaveUploadOneImg(file, "");
            user.setImage(this.imageService.getImgByName(avatar));
            this.userService.handleSaveUser(user);
        }

        this.imageService.deleteAImg(image);

        return "redirect:/admin/gallery";
    }
}
