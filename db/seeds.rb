# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'nokogiri'

Idea.delete_all

path = "/home/eashan/Pictures/coolCars/0805_coolest_concept_cars/text"
(2..21).each do |i|
	str = %{#{i}}.rjust(2,'0')
	image = %x{ls app/assets/images/#{str}*.jpg | xargs -n 1 basename}.strip	
	Idea.create!(name: Nokogiri::HTML( %x{head -n +1 #{path}/#{i}.txt}.strip ).text,
			description: Nokogiri::HTML( %x{tail -n +3 #{path}/#{i}.txt}.strip ).text,
			picture: 'sample.jpg')
end
