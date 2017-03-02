
function save_user_info(){
    var status = true;
    var user_name = $('#user').val();
    var password = $('#password').val();
    var repeat_password = $('#repeat_password').val();
    var email = $('#email').val();
    console.log(user_name);
    console.log(password);
    console.log(repeat_password);
    console.log(email);
    if(user_name == '' || password == '' || repeat_password == '' || email == ''){
        status = false;
        show_warn_model('注册信息填写不完整','true')
    }else
    {
        if(password == repeat_password && status){
            var url = 'land/set_register_info';
            var data = {
                'user' : user_name,
                'password' : password,
                'email' : email
            };
            post_ajax(url, data,
                function(data){
                    show_warn_model('注册成功')
                },
                function(err){
                    console.log(err)
                });
        }else{
            show_warn_model('密码不一致','true')
        }
    }
}

function land(){
    var url = '/land/land';
    var data = {
        'user': $('#user_name').val(),
        'password': $('#pad').val()
    };
    get_ajax(url,data,
        function(data){
            if(data.status == 'success'){
                //$('#land_success').text('退出');
                //alert( $('#land_success').text())
                show_warn_model('登录成功');
                jump_page('/');
            }
        },
        function(){
            show_warn_model('用户名不存在','true')
        })
}

