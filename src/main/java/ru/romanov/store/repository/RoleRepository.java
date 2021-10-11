package ru.romanov.store.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import ru.romanov.store.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
}
