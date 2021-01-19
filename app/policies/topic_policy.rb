# frozen_string_literal: true

class TopicPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
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
