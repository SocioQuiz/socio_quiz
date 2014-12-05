require 'rails_helper'

RSpec.describe "categories/edit", :type => :view do
  before(:each) do
    if user_signed_in?
    @category = assign(:category, Category.create!(
      :name => "MyString",
      :value => "Value",
      :description => "MyText"
    ))
    end
  end

  it "renders the edit category form" do
    render

    assert_select "form[action=?][method=?]", category_path(@category), "post" do

      assert_select "input#category_name[name=?]", "category[name]"
      assert_select "textarea#category_value[name=?]", "category[value]"
      assert_select "textarea#category_description[name=?]", "category[description]"
    end
  end
end
