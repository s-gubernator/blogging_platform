# frozen_string_literal: true

class DashboardPolicy < ApplicationPolicy
  def home?
    user.present? && user.role_admin?
  end
end
