package vn.knight.fruitables_ecommerce.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;
import vn.knight.fruitables_ecommerce.domain.Image;

@Service
public class UploadImgService {
    private final ServletContext servletContext;
    private final ImageService imageService;

    public UploadImgService(ServletContext servletContext, ImageService imageService) {
        this.servletContext = servletContext;
        this.imageService = imageService;
    }

    public String handleSaveUploadOneImg(MultipartFile file, String targetFolder) {
        if (file.isEmpty()) {
            return "default_user.jpg";
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
        this.imageService.handleSaveImg(newImg);

        return finalName;
    }

}