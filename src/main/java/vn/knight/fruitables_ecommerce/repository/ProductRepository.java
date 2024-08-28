package vn.knight.fruitables_ecommerce.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import vn.knight.fruitables_ecommerce.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    Product save(Product product);

    List<Product> findAll();

    Product findById(long id);

    void deleteById(long id);

    long count();

    @Query(value = "SELECT u.* FROM Product u JOIN Image i ON u.avatar  = i.id WHERE i.id = :imageId", nativeQuery = true)
    List<Product> findProductsByImageId(@Param("imageId") Long imageId);

    @Query("SELECT p FROM Product p WHERE p.unit.id = :unitId")
    List<Product> findAllByUnitId(Long unitId);

    @Query("SELECT p FROM Product p WHERE p.category.id = :categoryId")
    List<Product> findALlByCategoryId(Long categoryId);

    @Query("SELECT p FROM Product p WHERE p.origin.id = :originId")
    List<Product> findALlByOriginId(Long originId);
}
