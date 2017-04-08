/**
 * Created by lenovo on 17-4-8.
 */
function delete_user(id){
    alert("确定删除");
    get_ajax('/user_information/delete_user?user_id='+id,'',function(data){
        show_warn_model("删除用户成功",'true');
        jump_page('/user_information/get_all_user')
    },function(){})
}

