# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show destroy]

  def show
    authorize @user
    @user = User.find(params[:id])
  end

  def destroy
    authorize @user
    @user.destroy
    redirect_to root_url, notice: 'Profile was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
