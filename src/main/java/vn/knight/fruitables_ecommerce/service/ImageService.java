package vn.knight.fruitables_ecommerce.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.knight.fruitables_ecommerce.domain.Image;
import vn.knight.fruitables_ecommerce.repository.ImageRepository;

@Service
public class ImageService {
    private final ImageRepository imageRepository;

    public ImageService(ImageRepository imageRepository) {
        this.imageRepository = imageRepository;
    }

    public Image getImgByName(String name) {
        return this.imageRepository.findByName(name);
    }

    public Image handleSaveImg(Image img) {
        return this.imageRepository.save(img);
    }

    public List<Image> getAllImg() {
        return this.imageRepository.findAll();
    }

}
