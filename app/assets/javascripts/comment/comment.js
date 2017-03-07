/**
 * Created by lenovo on 17-3-6.
 */
function show_comment(id){
    var fore_id = sessionStorage.getItem('comment_id');
    sessionStorage.setItem('comment_id',id);
    $('#comment_input_fram'+fore_id).hide();
    $('#comment_input_fram'+id).show();
}

function send_comment(id,note_id,to_user_id){
    var comment = $('#comment'+id).val();
    console.log(comment.length);
    if(comment.length >= 1){
        console.log('333333333333');
        var data = {
            note_id: note_id,
            to_uesr_id: to_user_id,
            comment_content: comment,
            is_read: false
        };
        post_ajax('comment/add_comment',data,function(data){
                $('#comment'+id).val('');
                show_warn_model('评论成功','true');
                $('#comment_input_fram'+id).hide()
            },function(){}
        );
    }else{
        console.log('wwwwwwwww');
        show_warn_model('请输入内容','true');
    }
}
