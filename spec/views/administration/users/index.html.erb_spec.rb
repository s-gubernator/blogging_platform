require 'rails_helper'

RSpec.describe "administration/users/index", type: :view do
  before(:each) do
    assign(:administration_users, [
      Administration::User.create!(),
      Administration::User.create!()
    ])
  end

  it "renders a list of administration/users" do
    render
  end
end
