# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TabHelper, type: :helper do
  let(:target_name) { 'important' }

  it 'is current page' do
    request.host = ('localhost:3000/?locale=ja&memos=important')
    expect(current_page_tab_or_not(target_name)).to eq 'active'
  end

  it 'is not current page' do
    request.host = ('localhost:3000/?locale=ja')
    expect(current_page_tab_or_not(target_name)).to eq ''
  end
end
