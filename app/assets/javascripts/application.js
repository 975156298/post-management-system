// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks


function post_ajax(url, data, suc_fun, err_fun) {
    $.ajax({
        url: "http://localhost:3000/"+url,
        method: 'POST',
        data: data,
        success: function (data) {
            suc_fun(data)
        },
        error: function (err) {
            err_fun(err)
        }
    })
}

function get_ajax(url,data,suc_fun,err_fun){
    $.ajax({
        url: url,
        method: 'GET',
        data: data,
        success: function (data) {
            suc_fun(data)
        },
        error: function () {
            err_fun()
        }
    })
}

function jump_page(url){
    window.location.href = window.location.protocol + '//' + window.location.host + url;
}

function show_warn_model(message,is_wait) {

    $('body').append("<div class='warning-model'><div class='warning'>" + message + "</div></div>");
    if(is_wait == 'true'){
        setTimeout(function(){
            $('.warning-model').remove()
        },1000)
    }
}

function get_cookies(val){
    for(var i in document.cookie.split(';')){
        if(document.cookie.split(';')[i].split('=')[0] == val){
            return document.cookie.split(';')[i].split('=')[1]
        }
    }
}

/*function delete_cookies(val){
    var now_month = new Date();
    now_month.setTime(now_month.getTime() - 1);
    var value = [];
    for(var i in document.cookie.split(';')){
        if(document.cookie.split(';')[i].split('=')[0] == val){
            value = document.cookie.split(';')[i].split('=')
        }
    }
    document.cookie = value[0] + "=" + value[1]+ ";expires=" +now_month.toGMTString();
}*/



