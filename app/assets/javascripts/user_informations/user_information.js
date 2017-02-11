function set_user_information(){
    var url = 'user_information/update';
    var data = {
        'user': document.cookie.slice(5),
        'sex':'nv',
        'birthday_time':'',
        'name':'',
        'height':'',
        'star':'',
        'work':'',
        'phone':'',
        'address':'',
        'degree':''
    };
    post_ajax(url, data,
        function(data){
            show_warn_model('保存成功','true');
            jump_page('/user_center/index')
    }),
        function(err){
            console.log('=======shib===========')
    }
}

function get_hobby(){
    $('#user_info_list').hide();
    $('#hobby_list').show();
    $('#hobby').text('下棋')
    hobby_info();
}

function hobby_info(){
    var hobbdy = [
        {
            kind: '生活', tastes: ['投资理财', '数码产品', '旅游','花草','宠物','做饭','烘焙']
        },
        {
            kind: '体育', tastes: ['游泳','跑步','篮球','滑雪','瑜伽','羽毛球','野外露营','台球','健身','足球','爬山']
        },
        {
            kind: '休闲', tastes: ['游戏','摄影','钓鱼','歌舞话剧','阅读','电影','音乐','酒吧/KTV','麻将','书法/绘画']
        },
        {
            kind: '乐器', tastes: ['钢琴','小提琴','大提琴','吉他','双簧管']
        }
    ];
    for(var i in hobbdy){
        $('#hobby_info').append("<div class='title' id="+'kind'+i +"><p>" + hobbdy[i].kind + '</p></div>');
        $('#kind'+i).append('<div class="hobby-tags"  id='+"tastes"+i+'></div>')
        for(var j in hobbdy[i].tastes){
            $('#tastes'+i).append('<input type="checkbox"  class="hobby-tag" value='+hobbdy[i].tastes[j]+'/>');
        }
    }
}






