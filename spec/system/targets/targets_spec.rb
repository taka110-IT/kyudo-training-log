# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Targets::Targets', js: true, type: :system do
  let(:user) { create(:user) }

  before do
    travel_to Time.zone.local(2023, 1, 1)
    sign_in user
    visit root_path
  end

  it 'can input target' do
    click_link '2023年1月の目標を入力'

    within '#targets_modal' do
      fill_in 'target[total]', with: 100
      click_button '登録する'
    end

    expect(page).to have_content '目標を設定しました。'
    expect(page).to have_content '目標 100射'
  end

  it 'can update target' do
    create(:target, user:)
    visit root_path

    click_link '目標を修正'

    within '#targets_modal' do
      fill_in 'target[total]', with: 99
      click_button '更新する'
    end

    expect(page).to have_content '目標を修正しました。'
    expect(page).to have_content '目標 99射'
  end

  it 'can input target for past month' do
    create(:target, user:)
    click_link '<<'

    click_link '2022年12月の目標を入力'

    within '#targets_modal' do
      fill_in 'target[total]', with: 50
      click_button '登録する'
    end

    expect(page).to have_content '目標を設定しました。'
    expect(page).to have_selector '.calendar-title', text: '2022年12月'
    expect(page).to have_content '目標 50射'
  end

  it 'can update target for past month' do
    create(:target, user:, year: 2022, month: 12)
    visit root_path
    click_link '<<'

    click_link '目標を修正'

    within '#targets_modal' do
      fill_in 'target[total]', with: 50
      click_button '更新する'
    end

    expect(page).to have_content '目標を修正しました。'
    expect(page).to have_selector '.calendar-title', text: '2022年12月'
    expect(page).to have_content '目標 50射'
  end
end
