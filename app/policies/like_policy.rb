class LikePolicy < ApplicationPolicy
  attr_reader :user, :like

  def initialize(user, like)
    @user = user
    @like = like
  end

  def index?
    true
  end

  def create?
    user.present? 
  end

  def destroy?
    create?
  end
end
