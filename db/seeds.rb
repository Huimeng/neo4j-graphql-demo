# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

nodes = []

20.times do
  user_id = SecureRandom.uuid
  node = User.create(
    user_id: user_id,
    name: FFaker::NameCN.name,
    screen_name: FFaker::Name.last_name
  )
  nodes << node
end

follower_ids = []

30.times do
  follower_group = nodes.sample(2)
  unless follower_ids.include?(follower_group.map(&:user_id))
    Follow.create(from_node: follower_group[0], to_node: follower_group[1])
    puts "#{follower_group[0][:screen_name]} -> #{follower_group[1][:screen_name]}"
    follower_ids << follower_group.map(&:user_id)
  end
end
