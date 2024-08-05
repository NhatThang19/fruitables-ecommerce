package vn.knight.fruitables_ecommerce.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.knight.fruitables_ecommerce.domain.Image;
import vn.knight.fruitables_ecommerce.service.ImageService;
import vn.knight.fruitables_ecommerce.service.UploadImgService;

@Controller
public class ImageController {
    private final UploadImgService uploadImgService;
    private final ImageService imageService;

    public ImageController(UploadImgService uploadImgService, ImageService imageService) {
        this.uploadImgService = uploadImgService;
        this.imageService = imageService;
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
    public String getDashboard(Model model) {
        model.addAttribute("path", path);
        List<Image> images = this.imageService.getAllImg();
        model.addAttribute("images", images);
        return "admin/image/gallery";
    }
}
