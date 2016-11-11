class IncomingController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_before_action :verify_authenticity_token
  
  def incoming
    email = params[:from]
    user = User.find_by(email: email)
    url = params['stripped-text']
    # topic = Topic.find_by(title: topic)
    topic = Topic.create(title: params[:subject])
    bookmark = Bookmark.create(user: user, url: url, topic: topic)
    head 200
  end
end
