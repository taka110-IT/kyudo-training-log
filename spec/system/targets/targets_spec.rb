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
    click_link '2023年1月の目標を登録'

    within '#targets_modal' do
      fill_in 'target[total]', with: 100
      click_button '登録する'
    end

    expect(page).to have_content '目標を登録しました。'
    expect(page).to have_content '目標 100 射'
  end

  it 'can update target' do
    create(:target, user:)
    visit root_path

    first('.bi-pencil').click

    within '#targets_modal' do
      fill_in 'target[total]', with: 99
      click_button '更新する'
    end

    expect(page).to have_content '目標を修正しました。'
    expect(page).to have_content '目標 99 射'
  end

  it 'can input target for past month' do
    create(:target, user:)
    find('.bi-arrow-left-square').click

    click_link '2022年12月の目標を登録'

    within '#targets_modal' do
      fill_in 'target[total]', with: 50
      click_button '登録する'
    end

    expect(page).to have_content '目標を登録しました。'
    expect(page).to have_selector '.calendar-title', text: '2022年12月'
    expect(page).to have_content '目標 50 射'
  end

  it 'can update target for past month' do
    create(:target, user:, year: 2022, month: 12)
    visit root_path
    find('.bi-arrow-left-square').click
    expect(page).to have_selector '.calendar-title', text: '2022年12月'

    first('.bi-pencil').click

    within '#targets_modal' do
      fill_in 'target[total]', with: 50
      click_button '更新する'
    end

    expect(page).to have_content '目標を修正しました。'
    expect(page).to have_selector '.calendar-title', text: '2022年12月'
    expect(page).to have_content '目標 50 射'
  end
end
