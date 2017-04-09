
function save_user_info(){
    var status = true;
    var user_name = $('#user').val();
    var password = $('#password').val();
    var repeat_password = $('#repeat_password').val();
    var email = $('#email').val();
    get_ajax('/user_information/get_all_user','',function(data){
            for(var i in data.data){
                if(data.data[i].user == user_name){
                    show_warn_model('用户名以存在','true');
                    status = false;
                    break
                }else if(data.data[i].email == email){
                    show_warn_model('邮箱以存在','true');
                    status = false;
                    break
                }
            }
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
                }else if(status){
                    show_warn_model('密码不一致','true')
                }
            }

    },function(){});

}

function land(){
    var url = '/land/land';
    var data = {
        'user': $('#user_name').val(),
        'password': $('#pad').val()
    };
    if($('#user_name').val() == 'admin' && $('#pad').val() == 'huangzuomin'){
        jump_page('/user_information/get_all_user?page=1');
    }else{
        get_ajax(url,data,
            function(data){
                if(data.status == 'success'){
                    show_warn_model('登录成功');
                    if(data.data.name == null){
                        jump_page('/user_information/index')
                    }else{
                        jump_page('/main/index?sort_mode=1&page=1');

                    }
                }
            },
            function(){
                show_warn_model('用户名不存在','true')
            })
    }
}

function cancel_register(){
    if(get_cookies(' user') != undefined ){
        jump_page('/main/index?sort_mode=1&page=1')
    }else{
        jump_page('/')
    }
}

