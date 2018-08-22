# Artist.destroy_all
# City.destroy_all
# Event.destroy_all
# Invitation.destroy_all
# GuestStar.destroy_all

10.times do
  Artist.create(name:Faker::Artist.unique.name)
end

10.times do
  City.create(name:Faker::Address.city, country:Faker::Address.country)
end

event_type = ["Concert", "Dancing", "Standup", "Magic Show", "Opera"]

20.times do
  Event.create(name:Faker::FunnyName.unique.name, time:Faker::Time.forward(90, :evening), price: Faker::Number.between(10, 500), artist_id: Artist.all.sample.id,
   city_id: City.all.sample.id, event_type: event_type.sample)
end

10.times do
  GuestStar.create(name:Faker::Artist.unique.name)
end

performance = ["Playing Piano", "Talk Show", "Ballet Dance", "Magic", "Playing Erhu", "Free Style Hip Hop", "Jazz Dance"]
30.times do
  Invitation.create(guest_star_id: GuestStar.all.sample.id, event_id: Event.all.sample.id, guest_performance: performance.sample)
end
