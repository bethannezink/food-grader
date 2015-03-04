class Restaurant < ActiveRecord::Base

  has_many :inspections

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Restaurant.all.find {|restaurant| restaurant.slug == slug}
  end

  def inspection_grade
    !!self.inspections.first.grade ? self.inspections.first.grade : "Grade Pending"
  end

  def titleized_name
    !!self.name ? self.name.downcase.split.map(&:capitalize).join(" ") : ""
  end

  # add line breaks to address to format
  # def formatted_address
  #   !!self.address ? self.address... : "Address not provided"
  # end

  # add parantheses to area code -- how to add "(" to beginning of string?
  # def formatted_phone
  #   !!self.phone ? self.phone... : "Phone number not provided"
  #end

end
