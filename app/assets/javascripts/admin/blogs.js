$(function() {
    $('#datetimepicker4').datetimepicker({
        format: 'YYYY-MM-DD HH:mm'
    });

    var $createBlog = $('#create-blogs-account-page');

    $createBlog.on('click', '.edit-img', function() {
        $(this).parent().parent().find('.file-field input').first().click();
        $(this).parent().parent().find('.image-preview a').first().removeClass("hide");
    });

    function readURL(input, dom) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                dom.parent().next().find('img').first().attr('src', "");
                dom.parent().next().find('img').first().removeClass("hide")
                dom.parent().next().find('img').first().attr('src', e.target.result);
                dom.parent().parent().next().find('img').first().attr('src', e.target.result);
                console.log(dom.parent().next().find('img').first().prop("tagName"));
            };
            reader.readAsDataURL(input.files[0]);
        }
    }

    $createBlog.on('change', '.file-field input', function() {
        readURL(this, $(this));
    });

    $('#body-blogs').on('click','.inline-edit',function (event) {
        $(this).addClass("hide");
        $(this).parent().find(".done-edit").first().removeClass("hide");
        var idBlog = $(this).parent().parent().find("input").attr('id');
        var idBlogText = $(this).parent().parent().find("span").attr('id');
        var dateTime = $(this).parent().parent().find(".datetime-value").attr('id');
        var id = $(this).parent().parent().find(".datetime-value").attr('value');
        idBlogStr = '#' + idBlog;
        idBlogTextStr = '#' + idBlogText;
        idBlogDatePicker = '.datetimepicker' + id;
        $(idBlogStr).prop("type","text");
        $(idBlogTextStr).hide();
        $(idBlogDatePicker).datetimepicker({
            format: 'YYYY-MM-DD HH:mm',
            defaultDate: moment(dateTime, "YYYY-MM-DD HH:mm")
        });
        $(idBlogStr).on("dp.change",function(){

        });
        event.preventDefault()
    });

    $('#body-blogs').on('click','.done-edit',function (event) {
        var idBlog = $(this).parent().parent().find("input").attr('id');
        var id = $(this).parent().parent().find(".datetime-value").attr('value');
        idBlogStr = '#' + idBlog;
        var datetime = $(this).parent().parent().find(idBlogStr).val();
        $.ajax({
            url: 'blogs/' + id,
            cache: true,
            dataType: 'script',
            method: "patch",
            data: { blog: { public_time:  datetime}, type: "change_time" },
            success: function(){
            }
        })
        event.preventDefault()
    });

    $('#preview-button').on('click', function (e) {
        e.preventDefault();
        var editor = CKEDITOR.instances.editor1
        var sHTML,
            config = editor.config,
            baseTag = config.baseHref ? '<base href="' + config.baseHref + '"/>' : '',
            eventData;

        if ( config.fullPage )
            sHTML = editor.getData().replace( /<head>/, '$&' + baseTag ).replace( /[^>]*(?=<\/title>)/, '$& &mdash; ' + editor.lang.preview.preview );
        else {
            var bodyHtml = '<body ',
                body = editor.document && editor.document.getBody();

            if ( body ) {
                if ( body.getAttribute( 'id' ) )
                    bodyHtml += 'id="' + body.getAttribute( 'id' ) + '" ';
                if ( body.getAttribute( 'class' ) )
                    bodyHtml += 'class="' + body.getAttribute( 'class' ) + '" ';
            }

            bodyHtml += '>';

            sHTML = editor.getData()
        }

        $('#preview-content').html(sHTML);

        $('#modal-window').modal();
    });
});
