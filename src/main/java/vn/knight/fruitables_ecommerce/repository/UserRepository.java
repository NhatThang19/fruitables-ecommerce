package vn.knight.fruitables_ecommerce.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import vn.knight.fruitables_ecommerce.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User user);

    List<User> findAll();

    User findById(long id);

    void deleteById(long id);

    long count();

    User findByEmail(String email);

    @Query(value = "SELECT u.* FROM User u JOIN Image i ON u.avatar  = i.id WHERE i.id = :imageId", nativeQuery = true)
    List<User> findUsersByImageId(@Param("imageId") Long imageId);
}