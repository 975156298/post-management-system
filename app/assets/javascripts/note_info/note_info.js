/**
 * Created by lenovo on 17-3-4.
 */
function show_comment_fram(){
    $('#comment_input_fram').show();
    $('#comment_button').hide();
}

function get_comment_(id,to_user_id){
    var comment = $('#comment').val();
    console.log(comment);
    if(comment.length >0){
        var data = {
            note_id: id,
            to_uesr_id: to_user_id,
            comment_content: comment
        };
        post_ajax('comment/add_comment',data,function(data){
                console.log(data);
                $('#comment').val('');
                show_warn_model('评论成功','true');
            },function(){}
        );
    }else{
        show_warn_model('请输入内容','true');
    }
}

function change(){
    $('#comment_input_fram').hide();
    $('#comment_button').show();
}

