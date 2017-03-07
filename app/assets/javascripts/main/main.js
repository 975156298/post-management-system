/**
 * Created by lenovo on 17-2-11.
 */
function delete_note(id){
    get_ajax('http://localhost:3000/note_info/del_note',{note_id:id},
        function(data){
            show_warn_model('success','true');
            jump_page('/')
        },
        function(){
            show_warn_model('error')
        }
    )
}

function get_note_id(id){
    document.cookie = "note_id=" + id
    jump_page('/note_info/get_note')
}

function get_comment_fram(id){
    console.log('-------------')
    console.log('#comment_input_fram'+id)
    var fore_id = sessionStorage.getItem('comment_id');
    sessionStorage.setItem('comment_id',id);
    $('#comment_input_fram'+fore_id).hide();
    $('#change_comment_fram').hide();
    $('#comment_input_fram'+id).show();
}

function get_comment(id,to_user_id){
    var comment = $('#comment'+id).val();
    console.log(comment.length);
    if(comment.length >= 1){
        console.log('333333333333');
        var data = {
            note_id: id,
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