# frozen_string_literal: true

module Administration
  class UsersController < ApplicationController
    before_action :check_policy
    before_action :set_user, only: %i[show destroy]

    def index
      @users = User.all
    end

    def show; end

    def destroy
      @user.destroy
      redirect_to administration_users_url, notice: 'User was successfully destroyed.'
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def check_policy
      authorize :users, :admin?
    end
  end
end
