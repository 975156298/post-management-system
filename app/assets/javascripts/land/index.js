
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
        alert('注册信息填写不完整')
    }
    if(password == repeat_password && status){
        var url = 'http://localhost:3000/land/set_register_info';
        var data = {
            'user' : user_name,
            'password' : password,
            'email' : email
        };
        post_ajax(url, data,
            function(data){
                console.log(data);
            },
            function(){
                console.log('error')
            });
    }else{
        alert('密码不一致')
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
            if(data.status == 'success') jump_page('/main/index');
        },
        function(){
            alert('用户名不存在')
        })
}

