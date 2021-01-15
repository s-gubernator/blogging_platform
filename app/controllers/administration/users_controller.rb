# frozen_string_literal: true

module Administration
  class UsersController < Administration::BaseController
    before_action :set_user, only: %i[destroy]

    def index
      authorize User
      @q = User.ransack(params[:q])
      @users = @q.result(distinct: true).page params[:page]
    end

    def destroy
      authorize @user
      @user.destroy
      redirect_to administration_users_url, notice: 'User was successfully destroyed.'
    end

    private

    def set_user
      @user = User.find(params[:id])
    end
  end
end
