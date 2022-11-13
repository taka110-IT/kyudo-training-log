class Target < ApplicationRecord
  belongs_to :user

  validates :total, numericality: { greater_than: 0 }
  validates :user_id, uniqueness: { scope: %i[year month] }
end
