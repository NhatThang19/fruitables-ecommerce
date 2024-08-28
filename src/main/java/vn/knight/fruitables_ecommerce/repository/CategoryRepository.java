package vn.knight.fruitables_ecommerce.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import vn.knight.fruitables_ecommerce.domain.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
    List<Category> findAll();

    Category findByName(String name);

    Category save(Category category);

    Category findById(long id);

    void deleteById(Long id);

    @Query(value = "SELECT u.* FROM Category u JOIN Image i ON u.avatar  = i.id WHERE i.id = :imageId", nativeQuery = true)
    List<Category> findCategoryByImgId(@Param("imageId") Long imageId);
}
