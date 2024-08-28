package vn.knight.fruitables_ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.knight.fruitables_ecommerce.domain.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name);
}
