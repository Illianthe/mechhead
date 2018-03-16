class Api::PhotosController < ApplicationController
  # GET /api/photos
  def index
    if params[:randomize]
      @photos = Photo.order('RANDOM()').limit(20)
    else
      @photos = Photo.order(created_at: :desc).offset(params[:offset]).limit(20)
    end
  end
end
