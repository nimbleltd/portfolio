# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end
puts "3 topics create"

10.times do |blog|
  Blog.create!(
    title: "My blogpost #{blog}",
    body: "Integer non sem non magna tempus vestibulum et nec ex. Etiam erat purus, sagittis nec volutpat id, interdum rutrum arcu. Donec sem elit, interdum quis sodales eu, feugiat sed risus. Integer eget ipsum leo. Pellentesque rhoncus mollis ante, sed tincidunt ipsum lacinia eu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In luctus quam ac lacus semper interdum. Donec sed ipsum et risus cursus accumsan. Vivamus tristique ut enim aliquet ultrices. Praesent sed enim libero. Donec rutrum, lectus non pretium elementum, massa ligula ultricies sem, at venenatis libero dolor sed metus.",
    topic_id: Topic.last.id
  )
end

puts "10 blog posts created"

5.times do |skill|
  Skill.create!(
    title: "rails #{skill}",
    percent_utilized: "#{skill}"
  )
end

puts "5 skills created"

8.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Ruby on Rails",
    body: "body",
    main_image: "http://via.placeholder.com/600x400",
    thumb_image: "http://via.placeholder.com/100x50"
  )
end

1.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Angular",
    body: "body",
    main_image: "http://via.placeholder.com/600x400",
    thumb_image: "http://via.placeholder.com/100x50"
  )
end

puts "9 portfolio items created"
