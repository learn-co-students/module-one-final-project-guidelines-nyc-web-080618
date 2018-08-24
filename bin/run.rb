# ENV["ACTIVE_RECORD_ENV"] ||= "development"
# require_relative '../config/environment'
#
#   def welcome
#     puts "Hello! Welcome to eventchecker!"
#     puts "Please enter your name!"
#     user_name = gets.chomp.to_s
#     user = User.find_or_create_by!(name:user_name)
#     puts "hello #{user.name}"
#   end
#
#
#     puts city.events.map{|event|
#       "Event name:#{event.name}, Time:#{event.time}, Price:#{event.price}, Artist:
#     #{event.artist.name}"}
#   end
#
#
#   def main_manu
#     while true
#     puts "Please select 1.city or 2.Artist to browse all our events"
#     puts "Please enter 1 or 2"
#     choice=gets.chomp
#
#
#     if choice == "1"
#       puts City.pluck(:name)
#       puts "Please enter the City's name"
#       city_name = gets.chomp
#         city = City.find_by(name: city_name)
#         puts city.events.map{|event|
#           "Event name:#{event.name}, Time:#{event.time}, Price:#{event.price}, Artist:
#         #{event.artist.name}"}
#         puts "Please enter the name of the event you want to save"
#         event_name = gets.chomp
#         event = Event.find_by(name: event_name)
#         UserEvent.create!(user_id: user.id, event_id: event.id)
#         puts "Event is saved successfully"
#     elsif choice == "2"
#         puts Artist.pluck(:name)
#         puts "Please enter the Aritst's name"
#         artist_name = gets.chomp
#         artist = Artist.find_by(name: artist_name)
#         puts artist.events.map {|event|
#         "Event name:#{event.name}, Time:#{event.time}, Price:#{event.price},
#         City:#{event.city.name}"}
#         puts "Please enter the name of the event you want to save"
#         event_name = gets.chomp
#         event = Event.find_by(name: event_name)
#         UserEvent.create!(user_id: user.id, event_id: event.id)
#         puts "Event is saved successfully"
#       else
#         puts "the number you entered is not valid, please enter again"
#         load 'bin/run.rb'
#
#     end
#


ENV["ACTIVE_RECORD_ENV"] ||= "development"
require_relative '../config/environment'


def invalid_input
  puts "You entered the wrong option please try again"
  puts "Please enter your option correctly "
end


def show_events(value)
  if value == nil
    invalid_input
    load 'bin/run.rb'
  elsif value.events.count == 0
    puts "This city/artist doesn't have any events,please check others"
    return "empty"
  else
    puts value.events.map {|event|
      table(event.name, event.time, event.price, event.city.name, event.artist.name, event.find_guest_star.join(", "))
    }
    # "Event name: #{event.name}, Time: #{event.time}, Price: #{event.price},
    # City: #{event.city.name}, Aritst: #{event.artist.name}, GuestStar: #{event.find_guest_star}"}
  end
end

  def table(name, time, price, city, artist, guest)
     table = Terminal::Table.new do |t|
       t << ["Event name", name]
       t << :separator
       t.add_row ["Event Time", time]
       t.add_separator
       t.add_row ["Event Price", price]
       t.add_separator
       t.add_row ["Event City", city]
       t.add_separator
       t.add_row ["Artist", artist]
       t.add_separator
       t.add_row ["Guest", guest]
       t.add_separator
  end
end

def event_table(name, time, price)
  table = Terminal::Table.new do |t|
    t << ["Event name", name]
    t << :separator
    t.add_row ["Event Time", time]
    t.add_separator
    t.add_row ["Event Price", price]
    t.add_separator
  end
end

def save_event(user)
  puts "Please enter the name of the event you want to save"
  event_name = gets.chomp
  event = Event.find_by(name: event_name)
  if event == nil
    invalid_input
  else
    UserEvent.create!(user_id: user.id, event_id: event.id)
    puts "Event is saved successfully"
  end
end


def welcome
  puts "Hello! Welcome to EventChecker!"
  puts "Please enter your name!"
  user_name = gets.chomp
  user = User.find_or_create_by!(name:user_name)
  puts "Hello #{user.name}"
  user
end

def main_menu(user)
    while true
      puts "Please select"
      puts "1.City"
      puts "2.Artist"
      puts "3.Your saved events"
      puts "4.Exit".red
      puts "Please enter your option"
      choice = gets.chomp

      if choice == "1"
          cities = City.pluck(:name)
          i = 1
          while i < cities.length
            puts "#{i}. #{cities[i]}"
            i += 1
          end
          puts "Please select:"
          puts ""
          puts "To select a city, enter 1."
          puts "Go back to main menu, enter 2 "
          option = gets.chomp
          if option == "1"
              puts "Please enter the City's name"
              city_name = gets.chomp
              city = City.find_by(name: city_name)

              if show_events(city) != "empty"
                 save_event(user)
              else
                 next
              end

          else
              next
          end
       elsif choice == "2"
            artists =  Artist.pluck(:name)
            i = 1
            while i < artists.length
              puts "#{i}. #{artists[i]}"
              i += 1
            end
            puts "Please select:"
            puts ""
            puts "To select an artist, enter 1."
            puts "Go back to main menu, enter 2 "
            option = gets.chomp
            if option=="1"
                puts "Please enter the Aritst's name"
                artist_name = gets.chomp
                artist = Artist.find_by(name: artist_name)

                if show_events(artist)!= "empty"
                   save_event(user)
                else
                   next
                end

            else
                next
            end
       elsif choice == "3"
           if user.events.count == 0
             puts "You don't have any saved events"
           else
             puts "Your saved events list"
             puts ""

             all_events = user.events
             puts all_events.map {|event| event_table(event.name, event.time, event.price)}

             puts "Enter 1 to return to main manu"
             puts "Enter 2 to delete your saved event"
             option = gets.chomp
             if option == "2"
                user.destroy
                puts "You have successfully deleted your saved events"
             else
               next
             end
           end

       elsif choice == "4"
         a = Artii::Base.new :font => 'slant'
         puts a.asciify('Thank you ! Bye').red
           # puts "Thank you! Bye"
           break
       else
           invalid_input
       end
    end
end




user=welcome

main_menu(user)
