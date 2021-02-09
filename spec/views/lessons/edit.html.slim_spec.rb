require 'rails_helper'

RSpec.describe "lessons/edit", type: :view do
  before(:each) do
    @lesson = assign(:lesson, Lesson.create!(
      user_id: 1,
      description: "MyString",
      image: "MyString"
    ))
  end

  it "renders the edit lesson form" do
    render

    assert_select "form[action=?][method=?]", lesson_path(@lesson), "post" do

      assert_select "input[name=?]", "lesson[user_id]"

      assert_select "input[name=?]", "lesson[description]"

      assert_select "input[name=?]", "lesson[image]"
    end
  end
end
