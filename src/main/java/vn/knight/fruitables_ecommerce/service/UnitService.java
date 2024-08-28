package vn.knight.fruitables_ecommerce.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.knight.fruitables_ecommerce.domain.Unit;
import vn.knight.fruitables_ecommerce.repository.UnitRepository;

@Service
public class UnitService {
    private final UnitRepository unitRepository;

    public UnitService(UnitRepository unitRepository) {
        this.unitRepository = unitRepository;
    }

    public List<Unit> getAllUnits() {
        return this.unitRepository.findAll();
    }

    public Unit saveUnit(Unit unit) {
        return this.unitRepository.save(unit);
    }

    public Unit getUnitById(Long id) {
        return this.unitRepository.findById(id).get();
    }

    public void deleteAUnit(Long id) {
        this.unitRepository.deleteById(id);
    }
}
