# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Post.delete_all
User.delete_all
Tag.delete_all

users = [
  User.create(name: 'Anastacia Correa', email: 'anastacia.correa@example.com', password: 'password1'),
  User.create(name: 'Gerardo Montana', email: 'gerardo.montana@example.com', password: 'password2'),
  User.create(name: 'Eric Torrealba', email: 'eric.torrealba@example.com', password: 'password3'),
  User.create(name: 'Pedro Cofre', email: 'pedro.cofre@example.com', password: 'password4'),
  User.create(name: 'Florencia Martinez', email: 'florencia.martinez@example.com', password: 'password5')
]


posts = [
  users[0].posts.create(title: 'Post 1', content: 'Post 1 Content'),
  users[1].posts.create(title: 'Post 2', content: 'Post 2 Content'),
  users[2].posts.create(title: 'Post 3', content: 'Post 3 Content'),
  users[3].posts.create(title: 'Post 4', content: 'Post 4 Content'),
  users[4].posts.create(title: 'Post 5', content: 'Post 5 Content'),
  users[0].posts.create(title: 'Post 6', content: 'Post 6 Content'),
  users[1].posts.create(title: 'Post 7', content: 'Post 7 Content'),
  users[2].posts.create(title: 'Post 8', content: 'Post 8 Content'),
  users[3].posts.create(title: 'Post 9', content: 'Post 9 Content'),
  users[4].posts.create(title: 'Post 10', content: 'Post 10 Content')
]


tags = [
  Tag.create(name: 'Tag 1'),
  Tag.create(name: 'Tag 2'),
  Tag.create(name: 'Tag 3'),
  Tag.create(name: 'Tag 4'),
  Tag.create(name: 'Tag 5')
]


posts.each_with_index do |post, index|
  post.tags << tags[index % tags.length]
  tags[index % tags.length].posts << post
end

