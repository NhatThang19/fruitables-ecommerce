package vn.knight.fruitables_ecommerce.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.knight.fruitables_ecommerce.domain.Image;

@Repository
public interface ImageRepository extends JpaRepository<Image, Long> {
    Image findByName(String name);

    Image save(Image img);

    List<Image> findAll();

    Image findById(long id);

    void deleteById(long id);
}
