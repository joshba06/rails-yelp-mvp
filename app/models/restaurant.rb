class Restaurant < ApplicationRecord
  has_many :reviews

  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }

  before_destroy :linked_reviews_deleted

  private

  def linked_reviews_deleted
    Review.where(restaurant: self).destroy_all
  end

end
