package vn.knight.fruitables_ecommerce.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.knight.fruitables_ecommerce.domain.Unit;

@Repository
public interface UnitRepository extends JpaRepository<Unit, Long> {
    List<Unit> findAll();

    Unit findByName(String name);

    Unit save(Unit unit);

    Unit findById(long id);

    void deleteById(long id);
}
