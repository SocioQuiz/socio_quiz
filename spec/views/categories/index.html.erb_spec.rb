require 'rails_helper'

RSpec.describe "categories/index", :type => :view do
  before(:each) do
    if user_signed_in?
    assign(:categories, [
      Category.create!(
        :name => "Name",
        :value => "Value",
        :description => "MyText"
      ),
      Category.create!(
        :name => "Name",
        :value => "Value",
        :description => "MyText"
      )
    ])
    end
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
