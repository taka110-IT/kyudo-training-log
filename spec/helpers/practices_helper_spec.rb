# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PracticesHelper, type: :helper do
  let!(:practice) { create(:practice) }
  let!(:practice_important) { create(:practice, :important, user: practice.user) }
  let!(:practice_fixed) { create(:practice, :fixed, user: practice.user) }

  context 'when important is true' do
    it 'is displayed ⭐️' do
      expect(helper.practice_important_icon(practice_important)).to eq '⭐️'
    end
  end

  context 'when important is false' do
    it 'is not displayed ⭐️' do
      expect(helper.practice_important_icon(practice)).to eq ''
    end
  end

  context 'when fixed is true' do
    it 'is displayed 📌' do
      expect(helper.practice_fixed_icon(practice_fixed)).to eq '📌'
    end
  end

  context 'when fixed is false' do
    it 'is not displayed 📌' do
      expect(helper.practice_fixed_icon(practice)).to eq ''
    end
  end

  context 'when shooting_count is nil' do
    it 'is displayed 0' do
      practice_shooting_count_is_nil = build(:practice, shooting_count: nil)
      expect(helper.practice_shooting_count_display(practice_shooting_count_is_nil)).to eq '0射'
    end
  end

  context 'when shooting_count is exist' do
    it 'is displayed shooting_count' do
      expect(helper.practice_shooting_count_display(practice)).to eq '2射'
    end
  end

  context 'when memo is nil' do
    it 'is displayed "No Memos"' do
      practice_memo_is_nil = build(:practice, memo: nil)
      expect(helper.practice_memo_blank_message(practice_memo_is_nil)).to eq 'メモはありません'
    end
  end

  context 'when memo is exist' do
    it 'is displayed memo' do
      expect(helper.practice_memo_blank_message(practice)).to eq 'memo'
    end
  end
end
