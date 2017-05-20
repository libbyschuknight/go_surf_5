class SurfSpot < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { minumum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :place, presence: true, length: { minimum: 3, maximum: 50 }
  validates :region, presence: true, length: { minimum: 3, maximum: 50 }
  validates :user_id, presence: true
end
