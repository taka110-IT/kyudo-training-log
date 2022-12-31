class Target < ApplicationRecord
  belongs_to :user

  validates :total, numericality: { greater_than: 0, less_than_or_equal_to: 10_000 }
  validates :user_id, uniqueness: { scope: %i[year month] }
end
