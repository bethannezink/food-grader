class Inspection < ActiveRecord::Base

  belongs_to :restaurant
  has_many :violations

  def formatted_date
    self.inspection_date.split("-").rotate.join("/")
  end

  def display_formatted_date
    !!self.inspection_date ? formatted_date : " "
  end

  def has_violation?
    self.violations.empty?
  end

  # what is value of nil cells?
  # def display_formatted_grade
  #   self.grade.empty? ? "N/A" : self.grade
  # end

end