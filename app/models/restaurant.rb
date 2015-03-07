class Restaurant < ActiveRecord::Base

  has_many :inspections
  has_many :violations, through: :inspections

  def slug
    self.id.to_s
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

  def formatted_address
    self.address.downcase.split.map(&:capitalize).join(" ")
  end
  # # def address_pieces
  #   self.address.partition(self.borough)
  # end

  # def first_half_address
  #   !!self.address ? address_pieces[0] : "Address unavailable"
  # end

  # def second_half_address
  #   !!self.address ? address_pieces[1] + address_pieces[2]  : ""
  #   #add a space between pieces 1 and 2, or is that still there from earlier?
  # end 

  # def formatted_phone
  #   !!self.phone_number ? self.phone_number.insert(0, "(").insert(4, ") ").insert(9, "-") : "Phone number unavailable"
  # end

  # refactor this bad boy -- right now it doesn't work right
  # def violation_listed?
  #   !self.violations.select {|violation| violation.description == nil } ? true : false
  # end

end

