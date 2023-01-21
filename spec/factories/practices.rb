# frozen_string_literal: true

FactoryBot.define do
  factory :practice do
    sequence(:id) { |i| i }
    date { '2023-1-1' }
    shooting_count { 2 }
    memo { 'memo' }
    fixed { false }
    important { false }
    association :user

    trait :important do
      date { '2023-1-2' }
      important { true }
    end

    trait :fixed do
      date { '2023-1-3' }
      fixed { true }
    end
  end
end
