# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Practices::Practices', js: true, type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    FactoryBot.create(:practice, user:)
    FactoryBot.create(:target, user:)
    travel_to Time.zone.local(2023, 1, 1)
    sign_in user
    visit root_path
  end

  it 'can display top page' do
    expect(page).to have_content '2023年 1月'
    expect(page).to have_selector '.calendar-title', text: '2023年1月'
    expect(page).to have_selector '#practices-list', text: 'memo'
  end

  it 'can input practice' do
    click_link '練習記録を入力'

    fill_in 'practice[date]', with: Time.zone.local(2023, 1, 2)
    fill_in 'practice[shooting_count]', with: 1
    fill_in 'practice[memo]', with: 'memomemo'
    click_button '登録する'

    expect(page).to have_content '記録を保存しました。'
    expect(page).to have_selector '.calendar-title', text: '2023年1月'
  end

  it 'can update practice' do
    within '#practices' do
      click_link '編集', match: :first
    end

    fill_in 'practice[shooting_count]', with: 1
    fill_in 'practice[memo]', with: 'memomemo'
    click_button '更新する'

    expect(page).to have_content '記録を更新しました。'
  end

  it 'can delete practice' do
    within '#practices' do
      click_link '編集', match: :first
    end

    click_link '削除する'

    page.accept_confirm

    expect(page).to have_content '記録を削除しました。'
  end
end
