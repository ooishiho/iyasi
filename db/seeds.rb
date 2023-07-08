# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'iyasi@sample.com',
  password: 'iyasi.0522'
  )

users = User.create!(
  [
    {email: 'apple@a',name: 'apple', password: 'password1' },
    {email: 'rails@a',name: 'rail', password: 'password2' },
    {email: 'rank@a',name: 'rank', password: 'password3' }
  ]
)

post_image1 = PostItem.create!(user_id: users[0].id )
post_image1.image.attach(io: File.open('./app/javascript/images/AMEMAN1222041_TP_V4.jpg'), filename: 'test.jpg')

post_image2 = PostItem.create!(user_id: users[1].id )
post_image2.image.attach(io: File.open('./app/javascript/images/chris-smith-ZeIFgSO3MAU-unsplash.jpg'), filename: 'test.jpg')

post_image3 = PostItem.create!(user_id: users[2].id )
post_image3.image.attach(io: File.open('./app/javascript/images/shikun20220402_122123_TP_V4.jpg'), filename: 'test.jpg')

