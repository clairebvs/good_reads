class Book < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  def average_rating
    users.average(:rating)
  end

  def highest_rating
    reviews.order('rating DESC').first.rating
  end

  def lowest_rating
    reviews.order('rating ASC').first.rating
  end
end
