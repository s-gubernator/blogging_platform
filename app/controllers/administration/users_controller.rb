# frozen_string_literal: true

module Administration
  class UsersController < ApplicationController
    before_action :set_user, only: %i[destroy]

    def index
      authorize :users
      @users = User.all
    end

    def destroy
      authorize :users
      @user.destroy
      redirect_to administration_users_url, notice: 'User was successfully destroyed.'
    end

    private

    def set_user
      @user = User.find(params[:id])
    end
  end
end
