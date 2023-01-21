# frozen_string_literal: true

FactoryBot.define do
  factory :target do
    total { 10 }
    year { 2023 }
    month { 1 }
    achievement { false }
    association :user
  end
end
