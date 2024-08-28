// Preview input img
$(document).ready(() => {
    CKEDITOR.replace('detailDesc');
    imagePreview();
    imagesPreview();
});


function imagePreview() {
    const avatarFile = $("#avatarFile");
    const urlImage = $('#avatarPreview').attr('data-src');
    if (urlImage != null) {
        $("#avatarPreview").attr("src", urlImage);
        $("#avatarPreview").css({ "display": "block" });
    }

    avatarFile.change(function (e) {
        const imgURL = URL.createObjectURL(e.target.files[0]);
        $("#avatarPreview").attr("src", imgURL);
        $("#avatarPreview").css({ "display": "block" });
    });
}

// preview many input image
function imagesPreview() {
    const avatarFile = $("#productImgs");
    const previewContainer = $('#productPreviewContainer');
    const urlImage = previewContainer.attr('data-src');

    if (urlImage != null) {
        const imgElement = $('<img>').attr('src', urlImage);
        previewContainer.append(imgElement);
    }

    avatarFile.change(function (e) {
        previewContainer.empty();

        Array.from(e.target.files).forEach(file => {
            const imgURL = URL.createObjectURL(file);
            const imgElement = $('<img>').attr('src', imgURL);
            previewContainer.append(imgElement);
        });
    });
}
