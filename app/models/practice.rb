class Practice < ApplicationRecord
  belongs_to :user

  validates :date, uniqueness: { scope: :user_id }

  def start_time
    date
  end
end
