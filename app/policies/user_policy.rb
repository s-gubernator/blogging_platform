# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    user&.role_admin?
  end

  def destroy?
    user&.role_admin?
  end
end
