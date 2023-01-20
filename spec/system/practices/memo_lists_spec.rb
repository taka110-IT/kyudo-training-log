# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Practices::MemoLists', type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    FactoryBot.create(:practice, user:)
    FactoryBot.create(:practice, :important, user:)
    travel_to Time.zone.local(2023, 1, 1)
    sign_in user
    visit root_path
  end

  # 記録一覧のタブをクリック→一覧切り替え確認
  it "can switch memo list with tabs" do
    expect(page).to have_selector '.nav-link.active', text: '全てのメモ'
    expect(page.all('div', id: /^practice_/).count).to eq 2

    click_link '大切なメモ'

    expect(page).to have_selector '.nav-link.active', text: '大切なメモ'
    expect(page.all('div', id: /^practice_/).count).to eq 1
  end
end
