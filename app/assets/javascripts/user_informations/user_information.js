var hobby = [];
var hobby_id = [];
$(document).ready(function(){
    set_info();
});
set_info();
function set_info(){
    get_ajax('/user_information/get_user_info','',
        function(data){
            console.log(data);
            console.log(data.date.birthday_time.slice(0,10));
            $("#date_birth").attr("value",data.birthday_time);
    },
        function(){

        }
    )
    var address = sessionStorage.getItem("address");
    var degree = sessionStorage.getItem("degree");
    var height = sessionStorage.getItem("height");
    var hobbys = sessionStorage.getItem("hobbys");
    var star = sessionStorage.getItem("star");
    var work = sessionStorage.getItem("work");
    //;
    $('#address').text(address);
    $('#degree').text(degree);
    $('#height').text(height);
    $('#hobby').text(hobbys);
    $('#star').text(star);
    $('#work').text(work);
}

function set_user_information(){
    var url = 'user_information/update';
    var data = {
        'sex':'nv',
        'birthday_time':$('#date_birth').val(),
        'name':'',
        'height':sessionStorage.getItem("height"),
        'star':sessionStorage.getItem("star"),
        'work':sessionStorage.getItem("work"),
        'phone':'',
        'address':sessionStorage.getItem("address"),
        'degree':sessionStorage.getItem("degree"),
        'hobby':sessionStorage.getItem("hobbys")
    };
    post_ajax(url, data,
        function(data){
            show_warn_model('保存成功','true');
            jump_page('/user_center/index');
    }),
        function(err){
            console.log('=======shib===========')
    }
}

function get_hobby_info(kind,id){
    if($('#hobby-'+kind+'-'+id).css('background-color') == 'rgb(255, 0, 0)'){
        $('#hobby-'+kind+'-'+id).css('background-color','#FFFFFF');
        for(var i in hobby){
            if(hobby[i] == $('#hobby-'+kind+'-'+id).text()){
                hobby.splice(i,1);
                hobby_id.splice(i,1);
            }
        }
    }else{
        $('#hobby-'+kind+'-'+id).css('background-color','red');
        hobby.push($('#hobby-'+kind+'-'+id).text())
        hobby_id.push(kind+'-'+id);
    }
    if(hobby.length<=3){
        sessionStorage.setItem('hobbys',hobby);
        sessionStorage.setItem('hobbys_id',hobby_id);
    }else{
        show_warn_model('最多只能选择3个兴趣爱好','true')
    }
}

function get_hobby(){
    $('#user_info_list').hide();
    $('#hobby_list').show();
    var hobby_id = sessionStorage.getItem("hobbys_id");
    for(var i in hobby_id){
        $('#hobby-'+hobby_id[i]).css('background-color','red');
        console.log(hobby_id[i])
    }
}

function set_hobby(){
    $('#user_info_list').show();
    $('#hobby_list').hide();
    var hobbys = sessionStorage.getItem("hobbys")
    $('#hobby').text(hobbys);
}

function get_degree(){
    $('#user_info_list').hide();
    $('#degree_list').show();
    $('#degree-'+sessionStorage.getItem("degree_id")).css('background-color','red');
}

function get_degree_info(id){
    var fore_id = sessionStorage.getItem('degree_id');
    $('#degree-'+fore_id).css('background-color','#FFFFFF');
    sessionStorage.setItem('degree_id', id);
    $('#degree-'+id).css('background-color','red');
    sessionStorage.setItem('degree', $('#degree-'+id).text());
}

function set_degree(){
    $('#user_info_list').show();
    $('#degree_list').hide();
    var degree = sessionStorage.getItem("degree")
    $('#degree').text(degree);
}

function get_height(){
    $('#user_info_list').hide();
    $('#height_list').show();
    $('#height-'+sessionStorage.getItem("height_id")).css('background-color','red');
}

function get_height_info(id){
    var fore_id = sessionStorage.getItem('height_id');
    $('#height-'+fore_id).css('background-color','#FFFFFF');
    sessionStorage.setItem('height_id', id);
    $('#height-'+id).css('background-color','red');
    sessionStorage.setItem('height', $('#height-'+id).text())
}

function set_height(){
    $('#user_info_list').show();
    $('#height_list').hide();
    var height = sessionStorage.getItem("height")
    $('#height').text(height);
}

function get_work(){
    $('#user_info_list').hide();
    $('#work_list').show();
    $('#work-'+sessionStorage.getItem("work_id")).css('background-color','red');
}

function get_work_info(province,id){
    var fore_id = sessionStorage.getItem('work_id');
    $('#work-'+fore_id).css('background-color','#FFFFFF');
    sessionStorage.setItem('work_id', province+'-'+id);
    $('#work-'+province+'-'+id).css('background-color','red');
    sessionStorage.setItem('work', $('#work-'+province+'-'+id).text())
}

function set_work(){
    $('#user_info_list').show();
    $('#work_list').hide();
    var work = sessionStorage.getItem("work")
    $('#work').text(work);
}

function get_address(){
    $('#user_info_list').hide();
    $('#address_list').show();
    $('#address-'+sessionStorage.getItem("address_id")).css('background-color','red');
}

function get_address_info(province,id){
    var fore_id = sessionStorage.getItem('address_id');
    $('#address-'+fore_id).css('background-color','#FFFFFF');
    sessionStorage.setItem('address_id', province+'-'+id);
    $('#address-'+province+'-'+id).css('background-color','red');
    sessionStorage.setItem('address', $('#address-'+province+'-'+id).text())
}

function set_address(){
    $('#user_info_list').show();
    $('#address_list').hide();
    var address = sessionStorage.getItem("address")
    $('#address').text(address);
}

function get_star(){
    $('#user_info_list').hide();
    $('#star_list').show();
    $('#star-'+sessionStorage.getItem("star_id")).css('background-color','red');
}

function get_star_info(id){
    var fore_id = sessionStorage.getItem('star_id');
    $('#star-'+fore_id).css('background-color','#FFFFFF');
    sessionStorage.setItem('star_id', id);
    $('#star-'+id).css('background-color','red');
    sessionStorage.setItem('star', $('#star-'+id).text())
}

function set_star(){
    $('#user_info_list').show();
    $('#star_list').hide();
    var star = sessionStorage.getItem("star")
    $('#star').text(star);
}

function get_photo(){
    $('#user_info_list').hide();

}









