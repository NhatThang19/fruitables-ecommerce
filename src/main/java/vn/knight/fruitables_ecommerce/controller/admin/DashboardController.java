package vn.knight.fruitables_ecommerce.controller.admin;

import jakarta.servlet.http.HttpServletRequest;
import vn.knight.fruitables_ecommerce.service.ProductService;
import vn.knight.fruitables_ecommerce.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {
    private final UserService userService;
    private final ProductService productService;

    public DashboardController(UserService userService, ProductService productService) {
        this.userService = userService;
        this.productService = productService;
    }

    String path = "admin";

    @GetMapping("/admin")
    public String getDashboard(HttpServletRequest httpServletRequest, Model model) {
        model.addAttribute("path", path);
        long totalUser = this.userService.countTotal();
        model.addAttribute("totalUser", totalUser);
        long totalProduct = this.productService.countTotal();
        model.addAttribute("totalProduct", totalProduct);

        return "admin/dashboard/show";
    }
}
