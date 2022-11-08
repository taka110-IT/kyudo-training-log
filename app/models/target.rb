class Target < ApplicationRecord
  belongs_to :user

  validates :total, numericality: { greater_than: 0 }
end
