class LikesController < ApplicationController
  def index
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.build(bookmark: @bookmark)
    authorize @like

    if @like.save
      flash[:notice] = "Link liked."
    else
      flash[:alert] = "Liked failed."
    end

    redirect_to :back
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.find(params[:id])
    authorize @like

    if @like.destroy
      flash[:notice] = "Link unliked."
    else
      flash[:alert] = "Unliked failed."
    end

    redirect_to :back
  end
end
