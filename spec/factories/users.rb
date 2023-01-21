# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'testuser@example.com' }
    password { 'Useruser1' }
    confirmed_at { Time.zone.today }
  end
end
