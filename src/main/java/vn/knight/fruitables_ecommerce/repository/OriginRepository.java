package vn.knight.fruitables_ecommerce.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import vn.knight.fruitables_ecommerce.domain.Origin;

@Repository
public interface OriginRepository extends JpaRepository<Origin, Long> {
    List<Origin> findAll();

    Origin findByName(String name);

    Origin save(Origin origin);

    Origin findById(long id);

    void deleteById(Long id);

    @Query(value = "SELECT u.* FROM Origin u JOIN Image i ON u.avatar  = i.id WHERE i.id = :imageId", nativeQuery = true)
    List<Origin> findOriginByImgId(@Param("imageId") Long imageId);
}
