namespace :db do
  desc "remake database data"

  task create_master_data: :environment do
    Rake::Task["db:migrate:reset"].invoke
    puts "0. create admin"
    Admin.create! username: "admin", password: "123456",
      password_confirmation: "123456"

    puts "1. create category"
    Category.create! name: "勉強"
    Category.create! name: "学校"
    Category.create! name: "家族"

    puts "2. create blogs"
     (1..21).each do |i|
       Blog.create title: "ブログ管理",
         category_id: 1,
         public_time: "04/07/2017".to_date,
         public_status: rand(0..1),
         suggest_status: rand(0..1),
         remote_intro_image_url: "http://images.media-allrecipes.com/userphotos/560x315/1077229.jpg",
         author_name: "ナルフォード",
         author_position: "塾講師",
         author_age: 26,
         remote_author_image_url: "http://images.media-allrecipes.com/userphotos/560x315/1077229.jpg"
     end
  end
end
