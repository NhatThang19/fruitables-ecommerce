package vn.knight.fruitables_ecommerce.controller.admin;

import java.time.Instant;
import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
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
import vn.knight.fruitables_ecommerce.domain.User;
import vn.knight.fruitables_ecommerce.service.ImageService;
import vn.knight.fruitables_ecommerce.service.UserService;

@Controller
public class UserController {
    private final UserService userService;
    private final ImageService imageService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, ImageService imageService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.imageService = imageService;
        this.passwordEncoder = passwordEncoder;
    }

    String path = "user";

    @GetMapping("/admin/user")
    public String getUserDashboard(Model model) {
        model.addAttribute("path", path);
        List<User> users = this.userService.getAllUser();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("path", path);
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String createUserHandle(Model model, @ModelAttribute("newUser") @Valid User newUser,
            BindingResult newUserBindingResult,
            @RequestParam("avatarFile") MultipartFile file) {
        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>" + error.getField() + " - " +
                    error.getDefaultMessage());
        }

        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }

        String avatar = this.imageService.handleSaveUploadOneImg(file, "user");
        String hashPassword = this.passwordEncoder.encode(newUser.getPassword());

        newUser.setPassword(hashPassword);
        newUser.setRole(this.userService.getRoleByName(newUser.getRole().getName()));
        newUser.setCreatedDate(Instant.now());
        newUser.setImage(this.imageService.getImgByName(avatar));
        newUser.setLastModifiedDate(newUser.getCreatedDate());
        this.userService.handleSaveUser(newUser);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/{id}")
    public String getUserPage(Model model, @PathVariable long id) {
        model.addAttribute("path", path);
        User user = this.userService.findUserById(id);
        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        User user = this.userService.findUserById(id);
        model.addAttribute("user", user);
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String deleteUserHandle(Model model, @ModelAttribute("user") User user) {
        this.userService.deleteAUserById(user.getId());
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        model.addAttribute("path", path);
        User user = this.userService.findUserById(id);
        model.addAttribute("currentUser", user);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String updateUserHandle(Model model, @ModelAttribute("currentUser") @Valid User user,
            BindingResult currentUserBindingResult,
            @RequestParam("avatarFile") MultipartFile file) {

        model.addAttribute("path", path);

        List<FieldError> errors = currentUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>" + error.getField() + " - " +
                    error.getDefaultMessage());
        }

        if (currentUserBindingResult.hasErrors()) {
            return "admin/user/update";
        }

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
