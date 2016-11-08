class BookmarkPolicy < ApplicationPolicy
  attr_reader :user, :bookmark

  def initialize(user, bookmark)
    @user = user
    @bookmark = bookmark
  end

  def index?
    true
  end

  def new?
    true
  end

  def create?
    @user.present?
  end

  def update?
    @user.present? && (@bookmark.user == @user)
  end

  def destroy?
    update?
  end
end
