class BookmarksController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)
    @bookmark.user = current_user
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark was saved successfully."
      redirect_to [@topic, @bookmark]
    else
      flash[:alert] = "There was an error saving the bookmark. Please try again."
      render :new
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.assign_attributes(bookmark_params)
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark was updated successfully."
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash[:alert] = "There was an error updating the bookmark. Please try again."
      render :edit
    end
  end

  def destroy
     @bookmark = Bookmark.find(params[:id])
     authorize @bookmark

     if @bookmark.destroy
       flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
       redirect_to @bookmark.topic
     else
       flash.now[:alert] = "There was an error deleting the bookmark."
       render :show
     end
   end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
