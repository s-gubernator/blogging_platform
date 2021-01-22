# frozen_string_literal: true

class ArticlePolicy < ApplicationPolicy
  def index?
    user&.role_admin?
  end

  def show?
    user&.role_admin?
  end

  def user_articles?
    user.present?
  end

  def visitor_show?
    true
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    author?
  end

  def edit?
    update?
  end

  def destroy?
    author?
  end

  def author?
    record.author == user
  end
end
