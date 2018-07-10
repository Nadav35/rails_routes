# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all
  Artwork.destroy_all
  ArtworkShare.destroy_all
  
  u1 = User.create!(username: "Nadav")
  u2 = User.create!(username: "Garbo")
  u3 = User.create!(username: "Elmo")
  
  a1 = Artwork.create!(title: "shitty artwork", artist_id: u1.id, image_url: "www.nadav.co.il")
  a2 = Artwork.create!(title: "amazingly shitty artwork", artist_id: u2.id, image_url: "www.garbo.co.do")
  
  as1 = ArtworkShare.create!(artwork_id: a1.id, viewer_id: u2.id)
  as2 = ArtworkShare.create!(artwork_id: a2.id, viewer_id: u1.id)
end




