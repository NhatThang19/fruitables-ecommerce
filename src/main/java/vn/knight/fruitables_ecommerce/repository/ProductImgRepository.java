package vn.knight.fruitables_ecommerce.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.knight.fruitables_ecommerce.domain.Image;
import vn.knight.fruitables_ecommerce.domain.ProductImage;

@Repository
public interface ProductImgRepository extends JpaRepository<ProductImage, Long> {
    ProductImage save(ProductImage product_image);

    List<ProductImage> findByProductId(Long productId);

    ProductImage findByImage(Image image);
}
