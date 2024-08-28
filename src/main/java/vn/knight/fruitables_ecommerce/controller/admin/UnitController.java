package vn.knight.fruitables_ecommerce.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import vn.knight.fruitables_ecommerce.domain.Origin;
import vn.knight.fruitables_ecommerce.domain.Product;
import vn.knight.fruitables_ecommerce.domain.Unit;
import vn.knight.fruitables_ecommerce.service.ProductService;
import vn.knight.fruitables_ecommerce.service.UnitService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.validation.Valid;

@Controller
public class UnitController {
    private final UnitService unitService;
    private final ProductService productService;

    public UnitController(UnitService unitService, ProductService productService) {
        this.unitService = unitService;
        this.productService = productService;
    }

    String path = "tag";

    @GetMapping("/admin/unit")
    public String getUnitDashboard(Model model) {
        model.addAttribute("path", path);
        List<Unit> units = this.unitService.getAllUnits();
        model.addAttribute("units", units);
        return "admin/unit/show";
    }

    @GetMapping("/admin/unit/create")
    public String getUnitCreateUnitPage(Model model) {
        model.addAttribute("path", path);
        model.addAttribute("newUnit", new Unit());
        return "admin/unit/create";
    }

    @PostMapping("/admin/unit/create")
    public String createUnitHandle(Model model, @ModelAttribute("newUnit") @Valid Unit unit,
            BindingResult newUnitBindingResult) {
        List<FieldError> errors = newUnitBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>" + error.getField() + " - " +
                    error.getDefaultMessage());
        }

        if (newUnitBindingResult.hasErrors()) {
            return "admin/unit/create";
        }

        this.unitService.saveUnit(unit);
        return "redirect:/admin/unit";
    }

    @GetMapping("/admin/unit/update/{id}")
    public String getUpdateUnitPage(Model model, @PathVariable("id") Long id) {
        model.addAttribute("path", path);
        Unit unit = this.unitService.getUnitById(id);
        model.addAttribute("currentUnit", unit);
        return "admin/unit/update";
    }

    @PostMapping("/admin/unit/update")
    public String updateUnitHandle(Model model, @ModelAttribute("currentUnit") @Valid Unit unit,
            BindingResult currentUnitBindingResult) {
        List<FieldError> errors = currentUnitBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>" + error.getField() + " - " +
                    error.getDefaultMessage());
        }

        if (currentUnitBindingResult.hasErrors()) {
            return "admin/unit/update";
        }

        Unit currentUnit = this.unitService.getUnitById(unit.getId());
        currentUnit.setName(unit.getName());
        currentUnit.setDescription(unit.getDescription());

        this.unitService.saveUnit(currentUnit);

        return "redirect:/admin/unit";
    }

    @GetMapping("/admin/unit/delete/{id}")
    public String getDeleteUnitPage(Model model, @PathVariable Long id) {
        Unit unit = this.unitService.getUnitById(id);
        model.addAttribute("unit", unit);
        return "admin/unit/delete";
    }

    @PostMapping("/admin/unit/delete")
    public String deleteUnitHandle(Model model, @ModelAttribute("unit") Unit unit) {
        List<Product> products = this.productService.getProductsByUnitId(unit.getId());
        for (Product product : products) {
            product.setUnit(null);
            this.productService.handleSaveProduct(product);
        }

        this.unitService.deleteAUnit(unit.getId());
        return "redirect:/admin/unit";
    }
}
