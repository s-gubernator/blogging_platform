class Administration::UsersController < ApplicationController
  def index
    @users = User.all
  end
end
