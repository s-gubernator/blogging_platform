# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    user&.role_admin?
  end

  def show?
    user == record
  end

  def destroy?
    user == record
  end

  def admin_destroy?
    user&.role_admin?
  end
end
