package vn.knight.fruitables_ecommerce.controller.admin;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {
    String path = "admin";

    @GetMapping("/admin")
    public String getDashboard(HttpServletRequest httpServletRequest, Model model) {
        model.addAttribute("path", path);
        return "admin/dashboard/show";
    }
}
