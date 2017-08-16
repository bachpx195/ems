namespace :db do
  desc "remake database data"

  task create_master_data: :environment do
    Rake::Task["db:migrate:reset"].invoke
    puts "0. create admin"
    Admin.create! username: "admin", password: "123456",
      password_confirmation: "123456"

    puts "0. create user"
    Admin.create! username: "user", password: "123456",
        password_confirmation: "123456"

    puts "1. create category"
    Category.create! name: "勉強"
    Category.create! name: "学校"
    Category.create! name: "家族"

    puts "2. create blogs"
     (1..50).each do |i|
       Blog.create! title: "ブログ管理#{i}",
         category_id: rand(1..3),
         public_time: "04/07/2017".to_date,
         set_public: 1,
         suggest_status: rand(0..1),
         public_status: 1,
         remote_intro_image_url: "http://truyenhay18.com/wp-content/uploads/2014/08/gap-tu-linh-nu-sinh-viet-co-nu-cuoi-toa-nang-hut-hon-cu-dan-mang.jpg",
         author_name: "ナルフォード",
         author_position: "塾講師",
         author_age: 26,
         remote_intro_image_url: "http://truyenhay18.com/wp-content/uploads/2014/08/gap-tu-linh-nu-sinh-viet-co-nu-cuoi-toa-nang-hut-hon-cu-dan-mang.jpg",
         content: "<p><b>Trong ng&agrave;y mưa m&aacute;t mẻ, c&aacute;c m&oacute;n ốc, chuối nếp nướng, b&aacute;nh kh&uacute;c, s&uacute;p cua hay thịt nướng l&agrave; những m&oacute;n được nhắc đến nhiều nhất.</b></p>\r\n\r\n<p><br />\r\n<img alt=\"\" border=\"0\" src=\"http://img.f21.ngoisao.vnecdn.net/2017/07/20/mua1-9463-1500374032-6981-1500523260.jpg\" />&nbsp;<br />\r\n<b>Ốc&nbsp;</b><br />\r\nỐc l&agrave; m&oacute;n ăn được &quot;gọi t&ecirc;n&quot; nhiều nhất trong những ng&agrave;y mưa. Trong tiết trời m&aacute;t mẻ của những cơn mưa m&ugrave;a hạ, chui r&uacute;c v&agrave;o một qu&aacute;n nhỏ, h&iacute;t h&agrave; m&ugrave;i ốc hấp l&aacute; chanh lan tỏa từ căn bếp nhỏ thật kh&ocirc;ng c&oacute; g&igrave; bằng. D&ugrave; c&aacute;c m&oacute;n ốc c&oacute; thể chế biến tại nh&agrave; một c&aacute;ch dễ d&agrave;ng, sạch sẽ nhưng dường như nhiều người vẫn th&iacute;ch c&aacute;i cảm gi&aacute;c ngồi ở hi&ecirc;n một qu&aacute;n vỉa h&egrave;, nhể từng con ốc b&eacute;o m&uacute;p, chấm v&agrave;o thứ nước chấm gia truyền m&agrave; hương vị kh&ocirc;ng dễ g&igrave; học được. Ngo&agrave;i ốc hấp l&aacute; chanh thuộc loại &quot;kinh điển&quot;, nhiều phi&ecirc;n bản kh&aacute;c cũng đắt kh&aacute;ch kh&ocirc;ng k&eacute;m như ốc x&agrave;o dừa, sốt me...<br />\r\n<img alt=\"\" border=\"0\" src=\"http://img.f21.ngoisao.vnecdn.net/2017/07/20/mua5-4590-1500374032-3635-1500523260.jpg\" />&nbsp;<br />\r\n<b>Chuối nếp nướng</b><br />\r\nMột m&oacute;n ăn vỉa h&egrave; S&agrave;i G&ograve;n lọt v&agrave;o danh s&aacute;ch l&agrave; chuối nếp nướng. Ng&agrave;y thường, bắt gặp một xe rong b&aacute;n m&oacute;n ăn giản dị n&agrave;y quả l&agrave; &quot;dễ như trở b&agrave;n tay&quot;. Nhưng thử tưởng tượng, đang chạy xe ngo&agrave;i đường trong một ng&agrave;y mưa tầm t&atilde;, chợt tạt v&agrave;o qu&aacute;n ven đường, thưởng thức một miếng chuối nếp nướng n&oacute;ng hổi, ngọt b&ugrave;i th&igrave; c&oacute; ngon hơn ng&agrave;y thường kh&ocirc;ng. Chuối l&agrave;m b&aacute;nh l&agrave; chuối sứ, hay c&ograve;n gọi l&agrave; chuối Xi&ecirc;m vừa ch&iacute;n tới, bọc b&ecirc;n ngo&agrave;i l&agrave; x&ocirc;i nếp dẻo, quấn trong l&aacute; chuối tươi, nướng đến khi v&agrave;ng lớp x&ocirc;i bọc b&ecirc;n ngo&agrave;i th&igrave; cắt khoanh rồi b&agrave;y l&ecirc;n đĩa, tưới nước cốt dừa, rắc đậu phộng. Chỉ đơn giản l&agrave; vậy m&agrave; chuối nếp nướng đ&atilde; nức tiếng xa gần, thậm ch&iacute; c&ograve;n lưu t&ecirc;n trong nhiều danh s&aacute;ch ẩm thực quốc tế. Ảnh:&nbsp;<i>Mr True</i>.<br />\r\n<img alt=\"\" border=\"0\" src=\"http://img.f21.ngoisao.vnecdn.net/2017/07/20/mua4-trangmin95-2639-150037403-6287-8499-1500523260.jpg\" />&nbsp;<br />\r\n<b>B&aacute;nh kh&uacute;c&nbsp;</b><br />\r\nNhiều người H&agrave; Nội thổ lộ rằng điều họ nhung nhớ nhất trong những ng&agrave;y mưa hay se se lạnh ch&iacute;nh l&agrave; tiếng rao &quot;x&ocirc;i lạc b&aacute;nh kh&uacute;c đ&acirc;y&quot;, c&ugrave;ng m&oacute;n ăn bốc kh&oacute;i g&oacute;i trong lớp l&aacute; dong d&acirc;n d&atilde;. B&aacute;nh kh&uacute;c hay x&ocirc;i kh&uacute;c l&agrave; một m&oacute;n ăn truyền thống hiếm hoi c&ograve;n s&oacute;t lại, m&agrave; vẫn được thực kh&aacute;ch hiện đại &quot;y&ecirc;u thương&quot; giữa đầy rẫy m&oacute;n ăn du nhập từ nước ngo&agrave;i. Lớp x&ocirc;i b&ecirc;n ngo&agrave;i dẻo dẻo, lớp l&aacute; kh&uacute;c b&ecirc;n trong được gi&atilde; nhuyễn thơm nhẹ, bao bọc lấy lớp đậu xanh v&agrave; thịt mỡ. Hương vị vừa vặn, đủ no bụng cho bữa xế chiều. M&oacute;n ăn chỉ c&ograve;n được t&igrave;m thấy ở c&aacute;c h&agrave;ng rong hay c&aacute;c qu&aacute;n h&agrave;ng ở c&aacute;c khu chợ b&igrave;nh d&acirc;n. Ảnh:&nbsp;<i>trangmin95.</i><br />\r\n<img alt=\"\" border=\"0\" src=\"http://img.f21.ngoisao.vnecdn.net/2017/07/20/mua7-8794-1500374033-6423-1500523260.jpg\" />&nbsp;<br />\r\n<b>S&uacute;p cua&nbsp;</b><br />\r\nĐ&acirc;y l&agrave; m&oacute;n ăn đặc sản của S&agrave;i G&ograve;n nhưng nay cũng đ&atilde; xuất hiện kh&aacute; nhiều ở vỉa h&egrave; H&agrave; Nội. D&ugrave; b&aacute;n v&agrave;o c&aacute;c ng&agrave;y trong năm nhưng dường như chỉ v&agrave;o những chiều mưa buồn man m&aacute;c, người ta mới nhớ đến n&oacute; nhiều hơn. M&oacute;n ăn d&acirc;n d&atilde;, rẻ tiền, &iacute;t khi b&aacute;n trong c&aacute;c nh&agrave; h&agrave;ng sang trọng m&agrave; quen thuộc trong c&aacute;c g&aacute;nh h&agrave;ng đơn sơ nơi hi&ecirc;n nh&agrave;, h&egrave; phố. S&uacute;p cua kh&aacute; phong ph&uacute; về th&agrave;nh phần, được nấu từ thịt cua, bột năng, trứng đ&aacute;nh tan, trứng c&uacute;t, nấm đ&ocirc;ng c&ocirc;, thịt g&agrave;... c&oacute; vị ngọt tự nhi&ecirc;n, n&oacute;ng hổi, ăn tới đ&acirc;u ấm bụng tới đ&oacute;. Ảnh:&nbsp;<i>Nguy&ecirc;n Chi.</i><br />\r\n<img alt=\"\" border=\"0\" src=\"http://img.f21.ngoisao.vnecdn.net/2017/07/20/mua3-8294-1500374033-5176-1500523260.jpg\" />&nbsp;<br />\r\n<b>Thịt nướng&nbsp;</b><br />\r\nDường như trong những ng&agrave;y h&egrave; n&oacute;ng nực, c&aacute;c qu&aacute;n thịt nướng từ thịt xi&ecirc;n vỉa h&egrave; cho tới c&aacute;c nh&agrave; h&agrave;ng kiểu H&agrave;n, kiểu Nhật đều bị kh&aacute;ch h&agrave;ng &quot;hờ hững&quot;. Nhưng cứ một v&agrave;i ng&agrave;y mưa &quot;đi lạc&quot; giữa m&ugrave;a h&egrave;, người ta lại rủ nhau tới thưởng thức hương vị thơm nức mũi của c&aacute;c m&oacute;n thịt nướng. Ban đầu l&agrave; do ảnh hưởng của c&aacute;c bộ phim H&agrave;n Quốc nhưng l&acirc;u dần, việc tới nh&agrave; h&agrave;ng ăn thịt nướng kiểu &quot;sang chảnh&quot; đ&atilde; trở th&agrave;nh th&oacute;i quen của nhiều người Việt. Thịt được tẩm ướp gia vị vừa miệng, đậm đ&agrave;, nướng tr&ecirc;n l&ograve; ngay tại b&agrave;n, cuốn với c&aacute;c loại gia vị &quot;nhập khẩu&quot; như kim chi, l&aacute; vừng, chấm nước chấm sền sệt đặc trưng. Ngo&agrave;i c&aacute;c m&oacute;n ăn ch&iacute;nh, bạn c&oacute; thể ăn th&ecirc;m canh kim chi, miến trộn, cơm trộn...<br />\r\n<img alt=\"\" border=\"0\" src=\"http://img.f21.ngoisao.vnecdn.net/2017/07/20/mua6-1396-1500374033-6978-1500523260.jpg\" />&nbsp;<br />\r\n<b>Lẩu</b><br />\r\nCuối c&ugrave;ng l&agrave; lẩu, m&oacute;n ăn hầu như ai cũng đều c&oacute; thể ăn được. Lẩu c&oacute; lẽ l&agrave; m&oacute;n c&oacute; nhiều phi&ecirc;n bản nhất, ph&ugrave; hợp cho c&aacute;c thực kh&aacute;ch v&agrave; tương ứng với từng loại sản vật ở c&aacute;c v&ugrave;ng miền, như lẩu ri&ecirc;u cua bắp b&ograve;, lẩu nấm, lẩu kim chi, lẩu b&ograve; nh&uacute;ng dấm, lẩu ếch, lẩu c&aacute; k&egrave;o l&aacute; giang, lẩu t&ocirc;m, lẩu cua... Với đặc điểm l&agrave; ăn n&oacute;ng s&ocirc;i n&ecirc;n th&iacute;ch hợp nhất l&agrave; ăn trong một ng&agrave;y mưa m&aacute;t mẻ.</p>\r\n\r\n<div class=\"ckeditor-html5-video\" style=\"text-align: center;\">\r\n<video controls=\"controls\" src=\"/uploads/ckeditor/attachments/1/mov_bbb.mp4\">&nbsp;</video>\r\n</div>\r\n\r\n<p>&nbsp;</p>\r\n"
     end

    puts "3. create user and comment"
    (1..10).each do |i|
      user = User.create! username: "User#{i}", email: "skyy#{i}@gmail.com", password: "123456",
        password_confirmation: "123456", remote_avatar_url: "https://tapchianhdep.com/wp-content/uploads/2016/04/top-hinh-anh-avatar-girl-xinh-thu-hut-nhat-facebook-1.jpg"
      (1..10).each do |j|
        user.comments.create! blog_id: rand(1..40),
          content: "user#{i} comment #{j}"
      end
    end

    puts "4. create reaction"
    (1..1000).each do |i|
      Reaction.create! user_id: rand(1..10),
        blog_id: rand(1..40),
        rate_type: rand(1..4)
    end
    Blog.published.each do |x|
      a = Reaction.where(blog_id: x.id).select(:rate_type).group(:rate_type).count
      a['biglike'] = 0 unless a['biglike']
      a['like'] = 0 unless a['like']
      a['dislike'] = 0 unless a['dislike']
      a['bigdislike'] = 0 unless a['bigdislike']
      Blog.find(x.id).update(biglikes_count: a['biglike'],
                                likes_count: a['like'],
                                dislikes_count: a['dislike'],
                                bigdislikes_count: a['bigdislike'])
    end
  end
end
