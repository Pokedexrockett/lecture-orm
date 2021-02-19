# execute application from here
require_relative "./environment"

Song.create_table

s = Song.create(name: "a new song", copies_sold: 30000)

puts s.id
 

s = Song.find_by_name("a new song")

puts s.id

s = Song.update("a newer song", 9)

puts s.id