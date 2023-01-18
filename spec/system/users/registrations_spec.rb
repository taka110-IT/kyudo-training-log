# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users::Registrations', type: :system do
  let(:email) { 'testuser@example.com' }
  let(:password) { 'Useruser1' }

  it 'can sign up' do
    visit new_user_registration_path

    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    click_button 'アカウント登録'
    expect(page).to have_content '本人確認用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。'

    User.find_by(email: 'testuser@example.com').confirm

    visit new_user_session_path

    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    click_button 'ログイン'
    expect(page).to have_content 'ログインしました。'
  end
end
