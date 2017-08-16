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
//= require bootstrap-sprockets
//= require slick.min
//= require jquery.inview.min.js
//= require "admin/blogs.js"
//= require social-share-button
//= require_tree .

$(function() {
    $('.autoplay').slick({
        infinite: true,
        speed: 300,
        slidesToShow: 1,
        centerMode: true,
        variableWidth: true,
        focusOnSelect: true,
        slidesToScroll: 1
    });

    $('.menu-bar ul button').hide();

    var loading_posts = false;
    $('a.load-more-posts').on('inview', function(e, visible) {
        if(loading_posts == true || visible == true){
            loading_posts = true;
            $.getScript($(this).attr('href'), function () {
                loading_posts = false;
            });
        };
    });

    $('.welcome').on('click', function (e) {
        if(sessionStorage["PopupShown"] != 'yes'){
            $('#modal-body-comment').html("");
            $('#modal-main-welcome-ems').modal();
            e.preventDefault();
        } else {
            var link = $(this).attr('id')
            window.location.href = link
        }
        sessionStorage["PopupShown"] = 'yes';
    });

    $('#btn-back-ems').on('click', function(e) {
        window.history.back();
    })
});


// .on('inview', function(event, isInView) {