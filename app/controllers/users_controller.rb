# frozen_string_literal: true

class UsersController < ApplicationController
  skip_after_action :verify_authorized
  before_action :set_user, only: %i[show destroy]

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user.destroy
    redirect_to root_url, notice: 'Profile was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
