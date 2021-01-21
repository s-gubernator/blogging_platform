# frozen_string_literal: true

class ArticlePolicy < ApplicationPolicy
  def index?
    user&.role_admin?
  end

  def show?
    user&.role_admin?
  end
end
