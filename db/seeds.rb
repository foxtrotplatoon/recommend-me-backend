# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(first_name: 'Bartleby', last_name: 'Molpis', birthdate: "01/03/2010", email: 'testboy@test.com', password: 'testtest', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")

User.create!(first_name: 'Sereh', last_name: 'Melmo', birthdate: "01/03/2010", email: 'testgirl@test.com', password: 'testtest', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")

User.create!(first_name: 'Bernhardt', last_name: 'Gumpsious', birthdate: "01/05/2008", email: "testdude@test.com", password: 'testtest', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")

User.create!(first_name: 'Wotan', last_name: 'Bloodfist', birthdate: "01/05/2008", email: "testlady@test.com", password: 'testtest', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1")

Recc.create!(name: "Weird Tree in the Park", description: "Come check out this weird tree I found.", location: "41.879591, -87.650078", picture_key: "CmRaAAAAJoLqAWxOnHtR31ur-2f7eEFPjx3mQddTYy6tgOlsoFU-v53s_yX-oc28-35goNuLq48Mb7-3lW2Z98nwTzSof4hyAqClN7nNfi27Bu6kgW14vToBXRtA6EkMFMmS4YACEhBpvPDdThrZ-tal90Q2xJCSGhQ9oP65Shnm0i3WPJoMcTjnyfxY-A", owner: User.find(1))

Recc.create!(name: "Sears Tower", description: "Anyone else notice this big tower here?", location: "Willis Tower", picture_key: "CmRaAAAA9w_VWLbGTwxsiQwu5_MtpyCavahL00EYE1hn2Wpc8Oa7em9iOfx7urHQK50eo8Z8TncGUa_Xl0XpkTaHz_c95-gpLzHUWKYRlXvcBHmOQs6E4nbL7yzk8deXP0Sve-RxEhBrjTrpiPMVgHfbK4QpOtNQGhRZ8JmBAYxHS0x5TuQ9pQ4loikgZg", owner: User.find(2))

Recc.create!(name: "Chicago Navy Pier", description: "This place is great! Treats, games, prizes, and a Ferris Wheel!", location: "Navy Pier", picture_key: "CmRaAAAAsfv8m5vbCC5--eZHVUIY0u4I69qXdU6JqhJc9Epne20aYkIRGvMy6WMPEi8_UGRqZwL6WSMm26x4TU72Bzx_dRSFyXhUV6rZzPZKdoYDa0ekpbqLIoQjmycjENpCq7GOEhBZW7i2xEK0YEE0nJp_X0yjGhTS0u6ZuJtz4gsqpRc5X9beWBIEIg", owner: User.find(2))

Recc.create!(name: "8th Light", description: "A wonderful office full of wonderful coders.", location: "25 E Washington St #509, Chicago, IL 60602", picture_key: "CmRaAAAAxuKvmF1X2GuUA3JZkgTqc06eBC2t_HbtlTXVuQ1YKYHI3u5gTg9ij_0ihFN-gVG4NSjiwate4dTg31S4yOx2MSgRvN1k4WvkO-b63R6MQiDJ7QSbdIlzkOXopho9po7rEhBjrM0v7vycbZUJVElJ1JQDGhSWAYhYHGC6QFs1VShs8XtTE0ihyQ", owner: User.find(3))

Recc.create!(name: "Jay Pritzker Pavilion", description: "What a wonderful view walking up Washington!", location: "201 E Randolph St, Chicago, IL 60601", picture_key: "CmRaAAAAZ70bhKsBZ-Gjfdq10m-DtVXslY6y9hyOWykOFf15lryRsp6VmSBRGfdlchx9AOaHeJD6DBK1wPZvHvuvXEbNVksvtGku2hOL3UbnvwMnhlD2waV-uVVg-LkHyq7EkF91EhDObvJHn9PokCeGW2LmDlUfGhS3DU8J_v5OyIURndYOJsaMk1GVpQ", owner: User.find(4))

Suggestion.create!(suggestion_comment: "Check out this tree", recipient: User.find(2), proposal: Recc.find(1))

Suggestion.create!(suggestion_comment: "Check out this tree", recipient: User.find(3), proposal: Recc.find(1))

Suggestion.create!(suggestion_comment: "Check out this tree", recipient: User.find(4), proposal: Recc.find(1))

Suggestion.create!(suggestion_comment: "Check out this tall tower!", recipient: User.find(1), proposal: Recc.find(2))

Suggestion.create!(suggestion_comment: "Check out this tall tower!", recipient: User.find(3), proposal: Recc.find(2))

Suggestion.create!(suggestion_comment: "Check out this tall tower!", recipient: User.find(4), proposal: Recc.find(2))

Suggestion.create!(suggestion_comment: "Wow what a fun place", recipient: User.find(1), proposal: Recc.find(3))

Suggestion.create!(suggestion_comment: "Wow what a fun place", recipient: User.find(3), proposal: Recc.find(3))

Suggestion.create!(suggestion_comment: "Wow what a fun place", recipient: User.find(4), proposal: Recc.find(3))

Suggestion.create!(suggestion_comment: "Great office to work at", recipient: User.find(1), proposal: Recc.find(4))

Suggestion.create!(suggestion_comment: "Great office to work at", recipient: User.find(2), proposal: Recc.find(4))

Suggestion.create!(suggestion_comment: "Great office to work at", recipient: User.find(4), proposal: Recc.find(4))

Suggestion.create!(suggestion_comment: "I love this view", recipient: User.find(1), proposal: Recc.find(5))

Suggestion.create!(suggestion_comment: "I love this view", recipient: User.find(2), proposal: Recc.find(5))

Suggestion.create!(suggestion_comment: "I love this view", recipient: User.find(3), proposal: Recc.find(5))

Rating.create!(score: 5, user: User.find(2), recc_id: Recc.find(1).id)

Rating.create!(score: 0, user: User.find(1), recc_id: Recc.find(2).id)

Rating.create!(score: 3, user: User.find(1), recc_id: Recc.find(3).id)

Comment.create!(comment_text: "Whoa. Cool tree my man; very cool!", user: User.find(2), recc_id: Recc.find(1).id)

Comment.create!(comment_text: "I have never seen such a tree as this before in all my years.", user: User.find(3), recc_id: Recc.find(1).id)

Comment.create!(comment_text: "This tree inspires me with courage.", user: User.find(4), recc_id: Recc.find(1).id)

Comment.create(comment_text: "Yes, I believe I've seen this tower before. Thank you for showing it to me.", user: User.find(1), recc_id: Recc.find(2).id)

Comment.create(comment_text: "A tower of this height is surely indicative of modern man's hubris.", user: User.find(3), recc_id: Recc.find(2).id)

Comment.create(comment_text: "It was okay.", user: User.find(1), recc_id: Recc.find(3).id)

Comment.create(comment_text: "Clean, safe, and most importantly: friendly. I love 8th Light!", user: User.find(1), recc_id: Recc.find(4).id)

Comment.create(comment_text: "You know how I feel about pavilions. Do not reccme any more of these.", user: User.find(3), recc_id: Recc.find(5).id)

