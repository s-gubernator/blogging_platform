# frozen_string_literal: true

class TopicPolicy < ApplicationPolicy
  def index?
    user&.role_admin?
  end

  def show?
    user&.role_admin?
  end

  def create?
    user&.role_admin?
  end

  def new?
    create?
  end

  def update?
    user&.role_admin?
  end

  def edit?
    update?
  end

  def destroy?
    user&.role_admin?
  end
end
