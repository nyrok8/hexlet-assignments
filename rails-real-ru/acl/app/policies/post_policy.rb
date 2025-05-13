# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  # BEGIN
  def index
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    user&.admin? || record.author_id == user&.id
  end

  def destroy?
    user&.admin?
  end
  # END
end
