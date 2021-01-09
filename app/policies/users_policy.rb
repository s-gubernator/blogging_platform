# frozen_string_literal: true

class UsersPolicy < ApplicationPolicy
  def admin?
    user&.role_admin?
  end
end
