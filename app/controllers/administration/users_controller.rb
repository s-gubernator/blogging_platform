# frozen_string_literal: true

module Administration
  class UsersController < ApplicationController
    def index
      @users = User.all
    end
  end
end
