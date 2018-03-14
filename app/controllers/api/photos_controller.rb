class Api::PhotosController < ApplicationController
  # GET /api/photos
  def index
    @photos = Photo.order(created_at: :desc).offset(params[:offset]).limit(20)
  end
end
