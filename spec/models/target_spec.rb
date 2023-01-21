# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Target, type: :model do
  let!(:target) { create(:target) }
  let!(:start_date) { described_class.display_start_date(target).to_date }

  it 'is created start_date from target' do
    expect(described_class.display_start_date(target)).to eq '2023-1-1'
  end

  describe 'display notice' do
    context 'when target achieved' do
      it 'returns achievement' do
        expect(described_class.display_notice_message('achievement')).to eq 'achievement'
      end
    end

    context 'when target updated' do
      it 'returns updated message' do
        expect(described_class.display_notice_message('')).to eq '目標を修正しました。'
      end
    end
  end

  it 'is target set' do
    expect(described_class.setting_target(start_date, target.user).first.total).to eq 10
  end

  it 'changes achievement to false' do
    target_data = described_class.setting_target(start_date, target.user)
    target_data.first[:achievement] = true
    remaining_shots = 10
    expect(described_class.cancel_target_achievement(target_data, remaining_shots)).to be true
  end
end
