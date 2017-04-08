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


function revise_psw(){
    $('.edit_note').show();
}

function confirm_revise_pas(){
    if($('#psw').val() != '' &&$('#psw').val() == $('#re_psw').val()){
        post_ajax('user_information/update_password',{password: $('#psw').val()},function(data){
            show_warn_model("改密成功",'true')
            $('.edit_note').hide();
        },function(){})
    }else{
        show_warn_model("密码不一致",'true')
    }

}

function cancel() {
    $('.edit_note').hide();
}