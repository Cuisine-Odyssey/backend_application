# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
user_1 = User.create(first_name: 'Chuck', last_name: 'Norris', email: 'chuck@gmail.com')
user_2 = User.create(first_name: 'Samuel', last_name: 'Jackson', email: 'SammyBoy@gmail.com')
user_3 = User.create(first_name: 'Will', last_name: 'Ferrel', email: 'the_real_chad_smith@gmail.com')
user_4 = User.create(first_name: 'Luke', last_name: 'SkyWalker', email: 'the_force@gmail.com')
user_5 = User.create(first_name: 'Eddie', last_name: 'Murphey', email: 'worst_actor@gmail.com')
user_6 = User.create(first_name: 'Owen', last_name: 'Wilson', email: 'marleyandme@gmail.com')
user_7 = User.create(first_name: 'Jerry', last_name: 'Garcia', email: 'direwolf@gmail.com')
user_8 = User.create(first_name: 'Han', last_name: 'Solo', email: 'milleniumfalcon@gmail.com')
user_9 = User.create(first_name: 'Chew', last_name: 'Bacca', email: 'wookie@gmail.com')
user_10 = User.create(first_name: 'Bob', last_name: 'Weir', email: 'TheOtherOne@gmail.com')
user_11 = User.create(first_name: 'Jimi', last_name: 'Hendrix', email: 'purplehaze@gmail.com')
