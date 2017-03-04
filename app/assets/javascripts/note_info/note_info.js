/**
 * Created by lenovo on 17-3-4.
 */
function show_comment_fram(){
    $('#comment_input_fram').show();
    $('#comment_button').hide();
    $('#change_comment_fram').focus();
}

function get_comment_(id){
    var comment = $('#comment').val();
    console.log(comment);
    var data = {
        note_id: id,
        comment_content: comment
    };
    post_ajax('comment/add_comment',data,function(data){
            console.log(data);
            $('#comment').val('');
            show_warn_model('评论成功','true');
        },function(){}
    );
}

function change(){
    $('#comment_input_fram').hide();
    $('#comment_button').show();
}

