# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Practices::Achievements', js: true, type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    FactoryBot.create(:target, user:)
    travel_to Time.zone.local(2023, 1, 1)
    sign_in user
    visit root_path
  end

  it 'can display achievement message' do
    expect(page).to have_selector '.calendar-title', text: '2023年1月'
    click_link '練習記録を入力'

    fill_in 'practice[shooting_count]', with: 10
    fill_in 'practice[memo]', with: 'memo'
    click_button '登録する'

    within '#achievement_message_modal' do
      expect(page).to have_content '🎉目標を達成しました🎉'
      click_button '閉じる'
    end

    expect(page).to have_content '🎉目標を達成しました🎉'
  end
end
