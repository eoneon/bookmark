class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    likes = Like.where(user_id: @user.id)
    @user_liked_bookmarks = Bookmark.where(user_id: @user.id, id: likes.pluck(:bookmark_id))
  end
end
