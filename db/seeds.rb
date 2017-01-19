# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.find_or_create_by(username: 'ariel') do |user|
  user.name = 'Ariel Pérez'
  user.email = 'arielperezch@gmail.com'
  user.password = 'password'
  user.password_confirmation = 'password'
end

User.find_or_create_by(username: 'programador123') do |user|
  user.name = 'Programador'
  user.email = 'programador@example.com'
  user.password = '123456'
  user.password_confirmation = '123456'
end

Bug.find_or_create_by(name: 'Bug #1') do |bug|
  bug.description = 'The first bug ever found'
  bug.priority = 0
  bug.resolved = false
  bug.user_id = User.last.id
  bug.score = 10
end

Bug.find_or_create_by(name: 'Bug #2') do |bug|
  bug.description = 'The second bug found'
  bug.priority = 0
  bug.resolved = false
  bug.user_id = User.last.id
  bug.score = 15
end

Bug.find_or_create_by(name: 'Bug #3') do |bug|
  bug.description = 'The last bug found'
  bug.priority = 2
  bug.resolved = false
  bug.user_id = User.last.id
  bug.score = 10
end

Bug.find_or_create_by(name: 'Bug #4') do |bug|
  bug.description = 'The datetime layout is not working'
  bug.priority = 0
  bug.resolved = false
  bug.user_id = User.last.id
  bug.score = 10
end

Tag.find_or_create_by(name: 'Web')
Tag.find_or_create_by(name: 'Algorithm')
Tag.find_or_create_by(name: 'Deployment')

b = Bug.first
t = Tag.first

if not b.tags
  b.tags.push(t)
end

User.all.each do |user|
  Event.find_or_create_by(user_id: user.id) do |event|
    event.event_type = :joined
  end
end
