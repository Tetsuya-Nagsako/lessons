require 'rails_helper'

RSpec.describe "lessons/index", type: :view do
  before(:each) do
    assign(:lessons, [
      Lesson.create!(
        user_id: 2,
        description: "Description",
        image: "Image"
      ),
      Lesson.create!(
        user_id: 2,
        description: "Description",
        image: "Image"
      )
    ])
  end

  it "renders a list of lessons" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: "Image".to_s, count: 2
  end
end
