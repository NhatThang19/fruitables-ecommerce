package vn.knight.fruitables_ecommerce.controller.admin;

import java.time.Instant;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.knight.fruitables_ecommerce.domain.User;
import vn.knight.fruitables_ecommerce.service.ImageService;
import vn.knight.fruitables_ecommerce.service.UserService;

@Controller
public class UserController {
    private final UserService userService;
    private final ImageService imageService;

    public UserController(UserService userService, ImageService imageService) {
        this.userService = userService;
        this.imageService = imageService;
    }

    String path = "user";

    @GetMapping("/admin/user")
    public String getDashboard(Model model) {
        model.addAttribute("path", path);
        List<User> users = this.userService.getAllUser();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @GetMapping("/admin/user/create")
    public String createUserPage(Model model) {
        model.addAttribute("path", path);
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String createUserHandel(Model model, @ModelAttribute("newUser") User newUser,
            @RequestParam("avatarFile") MultipartFile file) {
        String avatar = this.imageService.handleSaveUploadOneImg(file, "avatar");
        newUser.setRole(this.userService.getRoleByName(newUser.getRole().getName()));
        newUser.setCreatedDate(Instant.now());
        newUser.setImage(this.imageService.getImgByName(avatar));
        this.userService.handleSaveUser(newUser);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/{id}")
    public String showUserPage(Model model, @PathVariable long id) {
        model.addAttribute("path", path);
        User user = this.userService.findUserById(id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String showDeleteUserPage(Model model, @PathVariable long id) {
        User user = this.userService.findUserById(id);
        model.addAttribute("user", user);
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String deleteUser(Model model, @ModelAttribute("user") User user) {
        this.userService.deleteAUserById(user.getId());
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/update/{id}")
    public String showUpdateUserPage(Model model, @PathVariable long id) {
        model.addAttribute("path", path);
        User user = this.userService.findUserById(id);
        model.addAttribute("currentUser", user);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String updateUserPage(Model model, @ModelAttribute("currentUser") User user,
            @RequestParam("avatarFile") MultipartFile file) {
        model.addAttribute("path", path);
        User currentUser = this.userService.findUserById(user.getId());
        if (currentUser != null) {
            if (!file.isEmpty()) {
                String avatar = this.imageService.handleSaveUploadOneImg(file, "avatar");
                currentUser.setImage(this.imageService.getImgByName(avatar));
            }
            currentUser.setAddress(user.getAddress());
            currentUser.setPhone(user.getPhone());
            currentUser.setSurname(user.getSurname());
            currentUser.setName(user.getName());
            currentUser.setRole(this.userService.getRoleByName(user.getRole().getName()));
            currentUser.setGender(user.getGender());
            currentUser.setStatus(user.getStatus());
            currentUser.setLastModifiedDate(Instant.now());

            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

}
