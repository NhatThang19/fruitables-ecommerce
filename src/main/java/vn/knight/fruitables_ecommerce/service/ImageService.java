package vn.knight.fruitables_ecommerce.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;
import vn.knight.fruitables_ecommerce.domain.Image;
import vn.knight.fruitables_ecommerce.domain.Product;
import vn.knight.fruitables_ecommerce.domain.ProductImage;
import vn.knight.fruitables_ecommerce.repository.ImageRepository;
import vn.knight.fruitables_ecommerce.repository.ProductImgRepository;

@Service
public class ImageService {
    private final ImageRepository imageRepository;
    private final ServletContext servletContext;
    private final ProductImgRepository product_imgRepository;

    public ImageService(ImageRepository imageRepository, ServletContext servletContext,
            ProductImgRepository product_imgRepository) {
        this.imageRepository = imageRepository;
        this.servletContext = servletContext;
        this.product_imgRepository = product_imgRepository;
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

    public Image findImageById(long id) {
        return this.imageRepository.findById(id);
    }

    public void deleteAImgByIdSQL(Long id) {
        this.imageRepository.deleteById(id);
    }

    public void deleteAImg(Image image) {
        ProductImage pImage = this.product_imgRepository.findByImage(image);
        if (pImage != null) {
            this.product_imgRepository.deleteById(pImage.getId());
        }

        String relativeFilePath = File.separator + "resources" + image.getSrc();

        if (relativeFilePath != null && !relativeFilePath.isEmpty()) {

            String absoluteFilePath = servletContext.getRealPath(relativeFilePath);

            File fileToDelete = new File(absoluteFilePath);
            if (fileToDelete.exists()) {
                if (fileToDelete.delete()) {
                    System.out.println("File deleted successfully.");
                } else {
                    System.out.println("Failed to delete the file.");
                }
            } else {
                System.out.println("File not found.");
            }
        } else {
            System.out.println("File path is null or empty.");
        }

        this.deleteAImgByIdSQL(image.getId());
    }

    public String handleSaveUploadOneImg(MultipartFile file, String targetFolder) {
        if (file.isEmpty()) {
            if (targetFolder == "user") {
                return "default_user.jpg";
            } else if (targetFolder == "product") {
                return "default_fruit.jpg";
            } else if (targetFolder == "category") {
                return "default_category.jpg";
            } else if (targetFolder == "origin") {
                return "default_origin.jpg";
            }
        }

        String rootPath = this.servletContext.getRealPath("/resources/admin/images");
        String finalName = "";
        String src = "";
        try {
            byte[] bytes = file.getBytes();

            File dir = new File(rootPath + File.separator + targetFolder);
            if (!dir.exists())
                dir.mkdirs();

            finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();

            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);

            src = "/admin/images" + "/" + targetFolder + "/" + finalName;

            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        Image newImg = new Image();
        newImg.setSrc(src);
        newImg.setName(finalName);
        this.handleSaveImg(newImg);

        newImg.getId();

        return finalName;
    }

    public String handelUpdateMultiFile(List<MultipartFile> files, String targetFolder, Product product) {
        List<ProductImage> pImage = this.product_imgRepository.findByProductId(product.getId());
        for (ProductImage img : pImage) {
            this.product_imgRepository.deleteById(img.getId());
        }
        String rootPath = this.servletContext.getRealPath("/resources/admin/images");
        String finalName = "";
        String src = "";
        for (MultipartFile file : files) {
            try {
                byte[] bytes = file.getBytes();

                File dir = new File(rootPath + File.separator + targetFolder);
                if (!dir.exists())
                    dir.mkdirs();

                finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();

                File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);

                src = "/admin/images" + "/" + targetFolder + "/" + finalName;

                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }

            Image newImg = new Image();
            newImg.setSrc(src);
            newImg.setName(finalName);
            this.handleSaveImg(newImg);

            ProductImage newProImgs = new ProductImage();
            newProImgs.setImage(newImg);
            newProImgs.setProduct(product);

            this.product_imgRepository.save(newProImgs);
        }
        return "oke";
    }

}
