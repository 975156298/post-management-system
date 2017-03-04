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
    $('#comment_input_fram'+id).show();
    $('.comment_input_fram').focus();
}
function lose_change(){
    $('.comment_input_fram').hide();
}

function get_comment(id){
    var comment = $('#comment').val();
    console.log(comment);
    var data = {
        note_id: id,
        comment_content: comment
    };
    post_ajax('comment/add_comment',data,function(data){
            console.log(data)
            $('#comment').val('');
    },function(){}
    );
}