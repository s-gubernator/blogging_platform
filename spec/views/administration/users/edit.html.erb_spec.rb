require 'rails_helper'

RSpec.describe "administration/users/edit", type: :view do
  before(:each) do
    @administration_user = assign(:administration_user, Administration::User.create!())
  end

  it "renders the edit administration_user form" do
    render

    assert_select "form[action=?][method=?]", administration_user_path(@administration_user), "post" do
    end
  end
end
