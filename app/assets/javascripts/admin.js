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