package vn.knight.fruitables_ecommerce.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.knight.fruitables_ecommerce.domain.Role;
import vn.knight.fruitables_ecommerce.domain.User;
import vn.knight.fruitables_ecommerce.repository.RoleRepository;
import vn.knight.fruitables_ecommerce.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public User handleSaveUser(User newUser) {
        return this.userRepository.save(newUser);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public List<User> getAllUser() {
        return this.userRepository.findAll();
    }

    public User findUserById(long id) {
        return this.userRepository.findById(id);
    }

    public void deleteAUserById(Long id) {
        this.userRepository.deleteById(id);
    }

    public long countTotal() {
        return this.userRepository.count();
    }

    public List<User> getUsersByImageId(Long imageId) {
        return userRepository.findUsersByImageId(imageId);
    }

    public User getUseByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }
}
