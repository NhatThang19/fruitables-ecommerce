package vn.knight.fruitables_ecommerce.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.knight.fruitables_ecommerce.domain.Origin;
import vn.knight.fruitables_ecommerce.repository.OriginRepository;

@Service
public class OriginService {
    private final OriginRepository originRepository;

    public OriginService(OriginRepository originRepository) {
        this.originRepository = originRepository;
    }

    public List<Origin> getAllOrigin() {
        return this.originRepository.findAll();
    }

    public Origin handleCreateOrigin(Origin origin) {
        return this.originRepository.save(origin);
    }

    public Origin getOriginById(Long id) {
        return this.originRepository.findById(id).get();
    }

    public List<Origin> getOriginByImageId(Long imageId) {
        return originRepository.findOriginByImgId(imageId);
    }

    public void deleteOriginById(Long id) {
        this.originRepository.deleteById(id);
    }
}
