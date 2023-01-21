# frozen_string_literal: true

class Practice < ApplicationRecord
  belongs_to :user

  validates :date, uniqueness: { scope: :user_id }
  validates :shooting_count, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 500 }

  def self.practices_tab_contents(memos)
    memos == 'important' ? Practice.where(important: true) : Practice.all
  end

  def self.setting_user_practices(practices, current_user)
    practices.where(user_id: current_user).order(fixed: :desc, date: :desc)
  end

  def self.setting_results(start_date, current_user)
    Practice.where(date: start_date.in_time_zone.all_month, user_id: current_user).sum(:shooting_count)
  end

  def self.remaining_to_target(target_data, results)
    target_data.first[:total] - results
  end

  def self.display_start_date(practice)
    [practice.date.year, practice.date.mon, practice.date.day].join('-')
  end

  def start_time
    date
  end
end
