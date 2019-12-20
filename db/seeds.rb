10.times do
  User.create email: FFaker::Internet.email,
    password: "Aa@123456", password_confirmation: "Aa@123456"
end

100.times do
  Post.create user: User.all.sample,
    title: FFaker::Lorem.sentence, content: FFaker::Lorem.paragraph
end
