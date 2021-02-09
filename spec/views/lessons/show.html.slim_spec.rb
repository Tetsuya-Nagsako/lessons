require 'rails_helper'

RSpec.describe "lessons/show", type: :view do
  before(:each) do
    @lesson = assign(:lesson, Lesson.create!(
      user_id: 2,
      description: "Description",
      image: "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Image/)
  end
end
