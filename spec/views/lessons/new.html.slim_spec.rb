require 'rails_helper'

RSpec.describe "lessons/new", type: :view do
  before(:each) do
    assign(:lesson, Lesson.new(
      user_id: 1,
      description: "MyString",
      image: "MyString"
    ))
  end

  it "renders new lesson form" do
    render

    assert_select "form[action=?][method=?]", lessons_path, "post" do

      assert_select "input[name=?]", "lesson[user_id]"

      assert_select "input[name=?]", "lesson[description]"

      assert_select "input[name=?]", "lesson[image]"
    end
  end
end
