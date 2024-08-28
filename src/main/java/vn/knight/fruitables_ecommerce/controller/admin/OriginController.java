package vn.knight.fruitables_ecommerce.controller.admin;

import java.util.List;

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
import vn.knight.fruitables_ecommerce.domain.Origin;
import vn.knight.fruitables_ecommerce.domain.Product;
import vn.knight.fruitables_ecommerce.service.ImageService;
import vn.knight.fruitables_ecommerce.service.OriginService;
import vn.knight.fruitables_ecommerce.service.ProductService;

@Controller
public class OriginController {
    public final OriginService originService;
    private final ImageService imageService;
    private final ProductService productService;

    public OriginController(OriginService originService, ImageService imageService, ProductService productService) {
        this.originService = originService;
        this.imageService = imageService;
        this.productService = productService;
    }

    String path = "tag";

    @GetMapping("/admin/origin")
    public String getOriginDashboard(Model model) {
        model.addAttribute("path", path);
        List<Origin> origins = this.originService.getAllOrigin();
        model.addAttribute("origins", origins);
        return "admin/origin/show";
    }

    @GetMapping("/admin/origin/create")
    public String getCreateOriginPage(Model model) {
        model.addAttribute("path", path);
        model.addAttribute("newOrigin", new Origin());
        return "admin/origin/create";
    }

    @PostMapping("/admin/origin/create")
    public String createOriginHandle(Model model, @ModelAttribute("newOrigin") @Valid Origin newOrigin,
            BindingResult newOriginBindingResult,
            @RequestParam("avatarFile") MultipartFile file) {
        List<FieldError> errors = newOriginBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>" + error.getField() + " - " +
                    error.getDefaultMessage());
        }

        if (newOriginBindingResult.hasErrors()) {
            return "admin/origin/create";
        }

        String avatar = this.imageService.handleSaveUploadOneImg(file, "origin");
        newOrigin.setImage(this.imageService.getImgByName(avatar));

        this.originService.handleCreateOrigin(newOrigin);

        return "redirect:/admin/origin";
    }

    @GetMapping("/admin/origin/update/{id}")
    public String getUpdateOriginPage(Model model, @PathVariable long id) {
        model.addAttribute("path", path);
        Origin origin = this.originService.getOriginById(id);
        model.addAttribute("currentOrigin", origin);
        return "admin/origin/update";
    }

    @PostMapping("/admin/origin/update")
    public String handleUpdateOrigin(Model model, @ModelAttribute("currentOrigin") @Valid Origin origin,
            BindingResult currentOriginBindingResult,
            @RequestParam("avatarFile") MultipartFile file) {
        model.addAttribute("path", path);
        List<FieldError> errors = currentOriginBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>" + error.getField() + " - " +
                    error.getDefaultMessage());
        }

        if (currentOriginBindingResult.hasErrors()) {
            return "admin/origin/update";
        }

        Origin currentOrigin = this.originService.getOriginById(origin.getId());
        if (currentOrigin != null) {
            if (!file.isEmpty()) {
                String avatar = this.imageService.handleSaveUploadOneImg(file, "origin");
                currentOrigin.setImage(this.imageService.getImgByName(avatar));
            }
            currentOrigin.setName(origin.getName());
            currentOrigin.setDescription(origin.getDescription());

            this.originService.handleCreateOrigin(currentOrigin);
        }
        return "redirect:/admin/origin";
    }

    @GetMapping("/admin/origin/delete/{id}")
    public String getDeleteOriginPage(Model model, @PathVariable Long id) {
        Origin origin = this.originService.getOriginById(id);
        model.addAttribute("origin", origin);
        return "admin/origin/delete";
    }

    @PostMapping("/admin/origin/delete")
    public String handleDeleteOrigin(Model model, @ModelAttribute("origin") Origin origin) {
        List<Product> products = this.productService.getProductsByOriginId(origin.getId());
        for (Product product : products) {
            product.setOrigin(null);
            this.productService.handleSaveProduct(product);
        }

        this.originService.deleteOriginById(origin.getId());
        return "redirect:/admin/origin";
    }

}
