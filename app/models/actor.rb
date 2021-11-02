class Actor < ApplicationRecord 
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.order_by_age_asc 
    order(age: :asc)
  end 

  def self.avg_age
    average(:age).round(2)
  end 

  def self.find_id_by_name(text)
    where(name: text)[0].id
  end 
end 