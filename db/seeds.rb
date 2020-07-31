# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
  Todo.create(title: "my title #{i+1}", created_by: "Author #{i+1}")
  todo = Todo.last
  4.times do |j|
    todo.items.create(name: "my item #{j+1}", done: false)
  end
end
