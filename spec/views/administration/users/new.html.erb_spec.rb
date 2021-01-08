require 'rails_helper'

RSpec.describe "administration/users/new", type: :view do
  before(:each) do
    assign(:administration_user, Administration::User.new())
  end

  it "renders new administration_user form" do
    render

    assert_select "form[action=?][method=?]", administration_users_path, "post" do
    end
  end
end
