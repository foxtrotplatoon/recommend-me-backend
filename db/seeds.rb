# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(first_name: 'testboy', last_name: 'testington', birthdate: "01/03/2010", email: 'testboy@test.com', password: 'testtest', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")

User.create!(first_name: 'testgirl', last_name: 'testington', birthdate: "01/03/2010", email: 'testgirl@test.com', password: 'testtest', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")

Recc.create!(name: "Weird Tree", description: "Come check out this weird tree", location: "41.879591, -87.650078", owner: User.find(1))

Rating.create!(score: 5, user: User.find(2), recc_id: Recc.find(1).id)

Comment.create!(comment_text: "Wow, cool tree!", user: User.find(2), recc_id: Recc.find(1).id)

