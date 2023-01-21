# frozen_string_literal: true

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

  def self.setting_target(start_date, current_user)
    Target.where(year: start_date.year, month: start_date.month, user_id: current_user)
  end

  def self.cancel_target_achievement(target_data, remaining_shots)
    return if target_data.blank? || !(remaining_shots.positive? && (target_data.first[:achievement] == true))

    target_data.first.update(achievement: false)
  end
end
