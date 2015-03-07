class Violation < ActiveRecord::Base

  belongs_to :inspection
  belongs_to :restaurant

  def slug
    self.code.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Violation.all.find {|violation| violation.slug == slug}
  end

  def display_formatted_date
    self.date ? formatted_date : " "
  end

  def formatted_date
    self.date.split("-").rotate.join("/")
  end

  # def number_of_restaurants
  #   count = 0
  #   Restaurant.all.each do |reataurant|
  #     restaurant.violations.each do |violation|
  #       if violation.code == self.code
  #     count += 1
  #   end
  #   count
  # end

  # or, better yet, make a restaurants method, and call count on it

  # def restaurants_per_violation_code
  #   Restaurant.all.collect do |restaurant|
  #     restaurant.violations.select {|violation| violation.code == self.code }
  #   end.sort
  # end
    ### do i need to flatten the above???

  # then....
  # def number_of_restaurants
  #   self.restaurants.count
  # end

  # def percentage_of_restaurants
  #   self.number_of_restaurants/Restaurant.all.count
  # end

  # look into time period in which data occurs- violation percentages? in restaurant model? 

  # def number_of_points_deducted
#       case "self.code"
#       when "2A", "3A", "3B", "3E", "3F", "4B", "4D", "4F", "4G", "5A", "5B", "5D", "5E", "5F", "5G", "5H", "5I", "6G", "6I"
#         "10, 28"
#       when "2B", "2G", "2H", "2J", "3C", "3D", "4C", "4E", "4H", "4K", "4L", "4M", "4N", "5C"
#         "7-10, 28"
#       when "2C", "2D", "2I", "3G", "4I", "4O", "6A", "6B", "6C", "6D", "6E"
#         "5-8"
#       when "8B", "9A", "9B", "9C", "10A", "10C", "10D", "10E", "10F", "10G", "10H", "10I"
#         "2-5"
#       when "8C", "10B", "99B"
#         "2-5, 28"
#       when "6H", "7A"
#         "28"
#       when "2F", "4J"
#         "8"
#       when "2E"
#         "5-6"
#       when "4A"
#         "10"
#       when "6F"
#         "5-7"
#       when "8A"
#         "4-5"
#       when "10J"
#         "2"        
#       end
  # end
     

  #how to determine count per year?
  #how to filter out different types of inspections?

end