# frozen_string_literal: true

class DashboardPolicy < ApplicationPolicy
  def admin?
    user.present? && user.role_admin?
  end
end
