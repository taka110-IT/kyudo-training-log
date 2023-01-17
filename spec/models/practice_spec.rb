# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Practice, type: :model do
  let!(:practice) { FactoryBot.create(:practice) }
  let!(:practices) { described_class.setting_user_practices(described_class.all, practice.user) }
  let!(:start_date) { described_class.display_start_date(practice).to_date }

  before do
    FactoryBot.create(:practice, :important, user: practice.user)
    FactoryBot.create(:practice, :fixed, user: practice.user)
    FactoryBot.create(:target, user: practice.user)
  end

  describe 'tab contents' do
    context 'when important tab actived' do
      it 'displayed important practices' do
        memos = 'important'
        important_practices = described_class.practices_tab_contents(memos)
        expect(important_practices.length).to eq 1
      end
    end

    context 'when all tab actived' do
      it 'displayed all practices' do
        memos = 'all'
        all_practices = described_class.practices_tab_contents(memos)
        expect(all_practices.length).to eq 3
      end
    end
  end

  describe 'set practices' do
    it 'is practices set' do
      expect(practices.length).to eq 3
    end

    it 'is fixed practice at top' do
      expect(practices[0].date).to eq '2023-1-3'.to_date
    end

    it 'is descending order' do
      expect(practices[1].date).to eq '2023-1-2'.to_date
    end
  end

  it 'is results set' do
    expect(described_class.setting_results(start_date, practice.user)).to eq 6
  end

  it 'is set remaining to target' do
    results = described_class.setting_results(start_date, practice.user)
    expect(described_class.remaining_to_target(Target.all, results)).to eq 4
  end

  it 'is created start_date from practice' do
    expect(described_class.display_start_date(practice)).to eq '2023-1-1'
  end
end
