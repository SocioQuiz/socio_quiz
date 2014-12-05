require 'rails_helper'

RSpec.describe "categories/new", :type => :view do
  before(:each) do
    assign(:category, Category.new(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new category form" do
    render

    assert_select "form[action=?][method=?]", categories_path, "post" do

      assert_select "input#category_name[name=?]", "category[name]"
      assert_select "input#category_name[name=?]", "category[value]"
      assert_select "textarea#category_description[name=?]", "category[description]"
    end
  end
end
