function open_upload(){
    $('.upload_image_fram').show();
}

function close_upload(){
    $('.upload_image_fram').hide();
}

function preview_image(input){
    if (input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#upload_image').attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

function get_into_hobby(){
    jump_page('/user_information/index')
}
