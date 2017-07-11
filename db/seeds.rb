puts "0. create admin"
Admin.create! username: "admin", password: "123456",
  password_confirmation: "123456"

puts "1. create category"
Category.create! name: "Study"
Category.create! name: "School"
Category.create! name: "Family"