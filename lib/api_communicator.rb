require 'rest-client'
require 'json'
require 'pry'

def get_response_hash(url) #helper method to get hash
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
end

def get_school_data
  school_data_url = "https://data.cityofnewyork.us/resource/m7gz-2fpe.json"
  school_hash = get_response_hash(school_data_url)
  school_hash.each do |school|
    School.where(name: school["locname"], location: school["address"]).first_or_create
  end
  
end
