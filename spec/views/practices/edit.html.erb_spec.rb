require 'rails_helper'

RSpec.describe "practices/edit", type: :view do
  before(:each) do
    @practice = assign(:practice, Practice.create!(
      shooting_count: 1,
      memo: "MyText",
      fixed: false,
      important: false
    ))
  end

  it "renders the edit practice form" do
    render

    assert_select "form[action=?][method=?]", practice_path(@practice), "post" do

      assert_select "input[name=?]", "practice[shooting_count]"

      assert_select "textarea[name=?]", "practice[memo]"

      assert_select "input[name=?]", "practice[fixed]"

      assert_select "input[name=?]", "practice[important]"
    end
  end
end
