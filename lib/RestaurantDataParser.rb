require 'open-uri'
require 'json'
require 'pry'

class RestaurantDataParser 

    def data_hash
        data = open('https://data.cityofnewyork.us/api/views/xx67-kt59/rows.json?accessType=DOWNLOAD').read
        health_hash ||= JSON.parse(data)
    end
    
    def parse_data
     data_hash["data"].each do |restaurant_array| 
        restaurant = Restaurant.find_or_create_by(name: restaurant_array[9].to_s, address: (restaurant_array[11].to_s.strip + " " + restaurant_array[12].to_s.strip.downcase.split.map(&:capitalize).join(" ") + " " + restaurant_array[10].to_s.strip.downcase.capitalize + ", " + "New York " + restaurant_array[13].to_s.strip), phone_number: restaurant_array[14].to_s, cuisine_style: restaurant_array[15].to_s, borough: restaurant_array[10].to_s.downcase.capitalize)
        inspection = Inspection.find_or_create_by(restaurant_id: restaurant.id, inspection_date: restaurant_array[16].to_s.slice(0, 10), inspection_type: restaurant_array[25].to_s, grade: restaurant_array[22].to_s, score: restaurant_array[21], grade_date: restaurant_array[23].to_s.slice(0, 10))
        violation = Violation.find_or_create_by(inspection_id: inspection.id, date: restaurant_array[16].to_s.slice(0, 10), code: restaurant_array[18].to_s, severity_level: restaurant_array[20].to_s, description: restaurant_array[19].to_s)
      end
    end     
end
