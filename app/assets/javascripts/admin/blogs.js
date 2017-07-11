$(function() {
    if (jQuery().datepicker) {
        $('.date-picker').datepicker({
            rtl: App.isRTL(),
            orientation: "bottom",
            autoclose: true
        });
    }

    var $createBlog = $('#create-blog-account-page');

    $createBlog.on('click', '.edit-img', function() {
        $(this).parent().find('.file-field input').first().click();
    });

    function readURL(input, dom) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                dom.parent().next().find('img').first().attr('src', e.target.result);
                dom.parent().next().find('a').first().attr('href', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $createBlog.on('change', '.file-field input', function() {
        readURL(this, $(this));
    });

    $('.inline-edit').on('click', function () {
        var idBlog = $(this).parent().parent().find("input").attr('id');
        idBlogStr = '#' + idBlog;
        $(idBlogStr).prop("type","text")
    });
});
