# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Profile.destroy_all
TodoList.destroy_all


[ ["Carly Fiorina", 1954, "female"],
  ["Donald Trump", 1946, "male"],
  ["Ben Carson", 1951, "male"],
  ["Hillary Clinton", 1947, "female"]
].each { |x|
  name = x[0].split

  u = User.create!( username: name[1], password_digest: Digest::MD5.hexdigest(name[0]) )
  u.create_profile(gender: x[2], birth_year: x[1], first_name: name[0], last_name: name[1])

  due = Date.today + 1.year
  l = TodoList.create(list_due_date: due)
  u.todo_lists << l

  (1..5).each { |i|
    t = TodoItem.create(due_date: due, title: name[0] + i.to_s, description: "do this")
    l.todo_items << t
  }
}





