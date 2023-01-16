# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it 'is invalid without password' do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include('を入力してください')
  end

  it 'is invalid a password that only uppercase letters' do
    user = FactoryBot.build(:user, password: 'ABCDEFGH')
    user.valid?
    expect(user.errors[:password]).to include('はアルファベット大文字・小文字・数字を各1文字以上使用してください。')
  end

  it 'is invalid a password that only lowercase letters' do
    user = FactoryBot.build(:user, password: 'abcdefgh')
    user.valid?
    expect(user.errors[:password]).to include('はアルファベット大文字・小文字・数字を各1文字以上使用してください。')
  end

  it 'is invalid a password that only numbers' do
    user = FactoryBot.build(:user, password: '12345678')
    user.valid?
    expect(user.errors[:password]).to include('はアルファベット大文字・小文字・数字を各1文字以上使用してください。')
  end

  it 'is invalid a password that only uppercase and lowercase letters' do
    user = FactoryBot.build(:user, password: 'ABCDabcd')
    user.valid?
    expect(user.errors[:password]).to include('はアルファベット大文字・小文字・数字を各1文字以上使用してください。')
  end

  it 'is invalid a password that only uppercase letters and numbers' do
    user = FactoryBot.build(:user, password: 'ABCD1234')
    user.valid?
    expect(user.errors[:password]).to include('はアルファベット大文字・小文字・数字を各1文字以上使用してください。')
  end

  it 'is invalid a password that only lowercase letters and numbers' do
    user = FactoryBot.build(:user, password: 'abcd1234')
    user.valid?
    expect(user.errors[:password]).to include('はアルファベット大文字・小文字・数字を各1文字以上使用してください。')
  end
end
