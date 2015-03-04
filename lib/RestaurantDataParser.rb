 require 'open-uri'
require 'json'
require 'pry'

class RestaurantDataParser 


  def parse_data
    content = open('https://data.cityofnewyork.us/api/views/xx67-kt59/rows.json?accessType=DOWNLOAD').read
    health_hash ||= JSON.parse(content)
  
    health_hash["data"].collect do |restaurant_array|
        inspection = Inspection.new(date: restaurant_array[16].slice(0, 10), grade: restaurant_array[22].to_s, score: restaurant_array[21], violation_code: restaurant_array[18], violation_type: restaurant_array[20], violation_details: restaurant_array[19].to_s)
        inspection.restaurant_id = Restaurant.find_or_create_by(name: restaurant_array[9], address: (restaurant_array[11].to_s.strip + " " + restaurant_array[12].to_s.strip.downcase.split.map(&:capitalize).join(" ") + " " + restaurant_array[10].to_s.strip.downcase.capitalize + ", " + "New York " + restaurant_array[13].to_s.strip), phone_number: restaurant_array[14].to_s, restaurant_style: restaurant_array[15], borough: restaurant_array[10]).id
        inspection.save
    end

  end


end
