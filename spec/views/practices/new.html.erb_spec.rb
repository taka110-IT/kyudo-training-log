require 'rails_helper'

RSpec.describe "practices/new", type: :view do
  before(:each) do
    assign(:practice, Practice.new(
      shooting_count: 1,
      memo: "MyText",
      fixed: false,
      important: false
    ))
  end

  it "renders new practice form" do
    render

    assert_select "form[action=?][method=?]", practices_path, "post" do

      assert_select "input[name=?]", "practice[shooting_count]"

      assert_select "textarea[name=?]", "practice[memo]"

      assert_select "input[name=?]", "practice[fixed]"

      assert_select "input[name=?]", "practice[important]"
    end
  end
end
