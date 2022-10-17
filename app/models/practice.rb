class Practice < ApplicationRecord
  belongs_to :user

  def start_time
    date
  end
end
