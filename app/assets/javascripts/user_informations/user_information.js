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
            if(data.date.birthday_time != null && data.date.birthday_time != ''){
                $('#date_birth').text(data.date.birthday_time.slice(0,10));
            }else{
                $('#date_birth').text('1995-07-15');
            }
            if(data.date.name != null && data.date.name != ''){
                $('#name').text(data.date.name)
            }
            if(data.date.contact != null && data.date.contact != ''){
                $('#photo').text(data.date.contact)
            }
            if(data.date.sex != null && data.date.sex != ''){
                $('#sex').text(data.date.sex)
            }
            if(data.date.height != null && data.date.height != ''){
                $('#height').text(data.date.height)
            }
            if(data.date.hobby != null && data.date.hobby != ''){
                $('#hobby').text(data.date.hobby)
            }
            if(data.date.degree != null && data.date.degree != ''){
                $('#degree').text(data.date.degree)
            }
            if(data.date.work != null && data.date.work != ''){
                $('#work').text(data.date.work)
            }
            if(data.date.star != null && data.date.star != ''){
                $('#star').text(data.date.star)
            }
            if(data.date.address != null && data.date.address != ''){
                $('#address').text(data.date.address)
            }
    },
        function(){}
    );
}

function set_user_information(){
    var url = 'user_information/update';
    var data = {
        'sex':$('#sex').text(),
        'birthday_time':$('#date').val(),
        'name': $('#name').text(),
        'height':$("#height").text(),
        'star': $("#star").text(),
        'work':$("#work").text(),
        'phone':$('#photo').text(),
        'address':$("#address").text(),
        'degree':$("#degree").text(),
        'hobby':$("#hobby").text()
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

function set_name(){
    get_ajax('/user_information/get_user_info','',function(data){
        if(data.date.name == null){
            $("#input_name").val($('#name').text())
            $('#input_name').show();
            $('#name').hide()
        }else{
            show_warn_model('name不可更改','true')
        }
    },function(){})
}

function get_name(val){
    var status = true;
    get_ajax('/user_information/get_all_user','',function(data){
        for(var i in data.data){
            if(data.data[i].name == val){
                show_warn_model('name以存在','true');
                $('.confirm_button1').attr('disabled',true)
                status = false
                break
            }
        }
        if(val == '' || val == '无' || val.length < 0 || val.length > 8){
            show_warn_model('name的值为1~8位','true');
            $('.confirm_button1').attr('disabled',true)
        }else if(status){
            $('.confirm_button1').attr('disabled',false);
            $('#name').text(val);
            $('#name').show();
            $('#input_name').hide()
        }
    },function(){})
}

function set_sex(){
    $('#sex').hide();
    $('#sex_list').show();
}

function get_sex(val){
    $('#sex').text(val);
    $('#sex').show();
    $('#sex_list').hide();
}

function set_date(){
    //$("#date").attr("value",$('#date_birth').text());
    $('#date').val($('#date_birth').text());
    $('#date_birth').hide();
    $('#date').show();
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

function set_photo(){
    $('#photo').hide();
    $('#input_photo').val( $('#photo').text());
    $('#input_photo').show();
}

function get_photo(val){
    if(val == ''){
        show_warn_model('请输入电话','true')
    }else{
        $('#photo').text(val);
        $('#photo').show();
        $('#input_photo').hide();
    }
}









