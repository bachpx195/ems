$(function() {
    $('#datetimepicker4').datetimepicker({
        format: 'YYYY-MM-DD HH:mm'
    });

    var $createBlog = $('#create-blog-account-page');

    $createBlog.on('click', '.edit-img', function() {
        $(this).parent().parent().find('.file-field input').first().click();
    });

    function readURL(input, dom) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                dom.parent().next().find('img').first().attr('src', e.target.result);
                dom.parent().next().find('a').first().attr('href', e.target.result);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }

    $createBlog.on('change', '.file-field input', function() {
        readURL(this, $(this));
    });

    $('.inline-edit').on('click', function (e) {
        e.preventDefault();

        var idBlog = $(this).parent().parent().find("input").attr('id');
        var idBlogText = $(this).parent().parent().find("span").attr('id');
        var dateTime = $(this).parent().parent().find(".datetime-value").attr('id');
        var id = $(this).parent().parent().find(".datetime-value").attr('value');
        idBlogStr = '#' + idBlog;
        idBlogTextStr = '#' + idBlogText;
        $(idBlogStr).prop("type","text");
        $(idBlogTextStr).hide();
        $('.datetimepicker1').datetimepicker({
            format: 'YYYY-MM-DD HH:mm',
            defaultDate: moment(dateTime, "YYYY-MM-DD HH:mm")
        });
        $("input").blur(function(){
            var datetime = $(this).val();
            $.ajax({
                url: 'blogs/' + id,
                // dataType: 'json',
                dataType: 'script',
                method: "patch",
                data: { blog: { public_time:  datetime}, type: "change_time" }
            })
        });
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

            sHTML = editor.config.docType + '<html dir="' + editor.config.contentsLangDirection + '">' +
                '<head>' +
                baseTag +
                '<title>' + editor.lang.preview.preview + '</title>' +
                CKEDITOR.tools.buildStyleHtml( editor.config.contentsCss ) +
                '</head>' + bodyHtml +
                editor.getData() +
                '</body></html>';
        }

        $('#preview-content').html(sHTML);

        $('#modal-window').modal();
    });
});
