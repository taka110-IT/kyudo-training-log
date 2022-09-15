require 'rails_helper'

RSpec.describe "practices/show", type: :view do
  before(:each) do
    @practice = assign(:practice, Practice.create!(
      shooting_count: 2,
      memo: "MyText",
      fixed: false,
      important: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
