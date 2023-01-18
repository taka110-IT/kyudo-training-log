# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users::Edits', js: true, type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
    visit edit_user_registration_path
  end

  it 'can change user data' do
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password
    fill_in 'user[current_password]', with:user.password
    click_button '更新'

    expect(page).to have_content 'アカウント情報を変更しました。'
  end

  it 'can delete user' do
    click_button 'アカウント削除'

    page.accept_confirm

    expect(page).to have_content 'アカウントを削除しました'
  end
end
