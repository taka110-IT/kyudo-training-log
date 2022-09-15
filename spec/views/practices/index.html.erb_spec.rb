require 'rails_helper'

RSpec.describe "practices/index", type: :view do
  before(:each) do
    assign(:practices, [
      Practice.create!(
        shooting_count: 2,
        memo: "MyText",
        fixed: false,
        important: false
      ),
      Practice.create!(
        shooting_count: 2,
        memo: "MyText",
        fixed: false,
        important: false
      )
    ])
  end

  it "renders a list of practices" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
