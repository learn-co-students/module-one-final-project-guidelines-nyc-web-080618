ENV["ACTIVE_RECORD_ENV"] ||= "development"
require_relative '../config/environment'


  puts "Hello! Welcome to eventchecker!"
  puts "Please enter your name!"
  user_name = gets.chomp.to_s
  user = User.create(name:user_name)
  puts "hello #{user.name}"


  puts "Please select 1.city or 2.Artist to browse all our events"
  puts "Please enter 1 or 2"
  choice=gets.chomp


  if choice == "1"
    puts City.pluck(:name)
    puts "Please enter the City's name"
    city_name = gets.chomp
      city = City.find_by(name: city_name)
      puts city.events.map{|event|
        "Event name:#{event.name}, Time:#{event.time}, Price:#{event.price}, Artist:
      #{event.artist.name}"}
      puts "Please enter the name of the event you want to save"
      event_name = gets.chomp
      event = Event.find_by(name: event_name)
      UserEvent.create!(user_id: user.id, event_id: event.id)
      puts "Event is saved successfully"
  else
      puts Artist.pluck(:name)
      puts "Please enter the Aritst's name"
      artist_name = gets.chomp
      artist = Artist.find_by(name: artist_name)
      puts artist.events.map {|event|
      "Event name:#{event.name}, Time:#{event.time}, Price:#{event.price},
      City:#{event.city.name}"}
      puts "Please enter the name of the event you want to save"
      event_name = gets.chomp
      event = Event.find_by(name: event_name)
      UserEvent.create!(user_id: user.id, event_id: event.id)
      puts "Event is saved successfully"

  end
