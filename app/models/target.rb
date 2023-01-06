class Target < ApplicationRecord
  belongs_to :user

  validates :total, numericality: { greater_than: 0, less_than_or_equal_to: 10_000 }
  validates :user_id, uniqueness: { scope: %i[year month] }

  def self.display_start_date(target)
    [target[:year], target[:month], 1].join('-')
  end

  def self.display_notice_message(message)
    message == 'achievement' ? 'achievement' : I18n.t('controllers.targets.update')
  end
end
