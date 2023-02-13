# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Practices::Calendars', js: true, type: :system do
  let(:user) { create(:user) }

  before do
    create(:practice, user:)
    create(:practice, user:, date: '2022-12-1', shooting_count: 5)
    create(:target, user:)
    travel_to Time.zone.local(2023, 1, 1)
    sign_in user
    visit root_path
  end

  it 'can switch month' do
    click_link '<<'

    expect(page).to have_selector '.calendar-title', text: '2022年12月'

    click_link '>>'

    expect(page).to have_selector '.calendar-title', text: '2023年1月'
  end

  it 'can show practice from calendars' do
    click_link '2'

    expect(page).to have_content '2023年01月01日の記録'
  end

  it 'can update practice from calendars' do
    click_link '2'

    within '#practices_modal' do
      find('.bi-pencil').click
    end

    fill_in 'practice[shooting_count]', with: 1
    click_button '更新する'

    expect(page).to have_content '記録を更新しました。'
  end

  it 'can delete practice from calendars' do
    click_link '2'

    within '#practices_modal' do
      find('.bi-pencil').click
    end

    click_link '削除する'

    page.accept_confirm

    expect(page).to have_content '記録を削除しました。'
  end

  it 'can update practice from past calendars' do
    click_link '<<'
    click_link '5'

    within '#practices_modal' do
      find('.bi-pencil').click
    end

    fill_in 'practice[shooting_count]', with: 2
    click_button '更新する'

    expect(page).to have_content '記録を更新しました。'
    expect(page).to have_selector '.calendar-title', text: '2022年12月'
  end

  it 'can delete practice from past calendars' do
    click_link '<<'
    click_link '5'

    within '#practices_modal' do
      find('.bi-pencil').click
    end

    click_link '削除する'

    page.accept_confirm

    expect(page).to have_content '記録を削除しました。'
    expect(page).to have_selector '.calendar-title', text: '2022年12月'
  end
end
