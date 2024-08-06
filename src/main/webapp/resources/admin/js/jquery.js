// Preview img
$(document).ready(() => {
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
});




