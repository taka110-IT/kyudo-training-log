class Practice < ApplicationRecord
  belongs_to :user

  validates :date, uniqueness: { scope: :user_id }
  validates :shooting_count, numericality: { greater_than_or_equal_to: 0 }

  def start_time
    date
  end
end
