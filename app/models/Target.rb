class Target < ApplicationRecord
  belongs_to :user

  validates :total, greater_than_or_equal_to: 0
end
