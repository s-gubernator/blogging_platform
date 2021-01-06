# frozen_string_literal: true

class DashboardPolicy < ApplicationPolicy
  def admin?
    #binding.pry
    user.role_admin?
  end
end
