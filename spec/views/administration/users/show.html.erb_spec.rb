require 'rails_helper'

RSpec.describe "administration/users/show", type: :view do
  before(:each) do
    @administration_user = assign(:administration_user, Administration::User.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
