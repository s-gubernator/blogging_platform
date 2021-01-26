# frozen_string_literal: true

class ArticlePolicy < ApplicationPolicy
  def index?
    user&.role_admin?
  end

  def show?
    user&.role_admin?
  end

  def approve_multiple?
    user&.role_admin?
  end

  def approve?
    user&.role_admin?
  end

  def disapprove?
    user&.role_admin?
  end
end
