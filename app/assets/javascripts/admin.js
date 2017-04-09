/**
 * Created by lenovo on 17-4-8.
 */
function delete_user(id){
    $("#edit_note"+id).show();
    /*alert("确定删除");*/

}

function confirm_delete(id){
    if($('#text'+id).val() == 'huangzuomin'){
        get_ajax('/user_information/delete_user?user_id='+id,'',function(data){
            show_warn_model("删除用户成功",'true');
            jump_page('/user_information/get_all_user')
        },function(){})
    }else{
        $('#text'+id).val('')
        show_warn_model("密码错误",'true');
    }
}

function confirm_delete_note(id){
    get_ajax('/note_info/del_note?note_id='+id,'',function(data){
        if(data.status == 200){
            show_warn_model("删除帖子成功",'true');
            jump_page('/note_info/index')
        }
    },function(){})
}

function cancel(id){
    $("#edit_note"+id).hide();
}

function show_photo(id){
    $('#edit_note_image'+id).show();
}

function hide_photo(id){
    $('#edit_note_image'+id).hide();
}

function page_jump(total,url){
    console.log(parseInt($('#jump_page').val()))
    if(parseInt($('#jump_page').val()) >=1 && parseInt($('#jump_page').val()) <= total ){
        console.log('222')
        jump_page(url + '?page=' + parseInt($('#jump_page').val()))
    }else{
        show_warn_model('输入数字超出范围','true')
    }
}

function search_note(url){
    if($('#search_val').val() != ''){
        jump_page(url + '?page=1&search=' + $('#search_val').val())
    }else{
        show_warn_model('输入不能为空','true')
    }

}