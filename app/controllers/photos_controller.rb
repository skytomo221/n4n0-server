class PhotosController < ApplicationController
  skip_before_action :authenticate_user, only: %i[show show_latest]

  def show
    photo = World.find_by(vrchat_id: params[:vrchat_id])
                 &.world_guide
                 &.world_guide_photos
                 &.find_by(display_order: params[:display_order])
                 &.photo
    render_photo_url(photo)
  end

  # def show_latest
  #   photo = WorldGuide.order(created_at: :desc).first.photos.first
  #   render_photo_url(photo)
  # end
  def show_latest
    # randomで返す
    photo = WorldGuide.order(created_at: :desc).sample.photos.sample
    render_photo_url(photo)
  end

  def create
    world = World.find_by(vrchat_id: world_params[:vrchat_id])
    photo = Photo.new(photo_params.merge(world_id: world.id))
    if photo.save
      render json: photo
    else
      render json: { error: "写真の保存に失敗しました。" }, status: :internal_server_error
    end
  end

  private

  def render_photo_url(photo)
    head :not_found unless photo

    case params[:size]
    when "original"
      redirect_to rails_blob_url(photo.image)
    else
      redirect_to rails_blob_url(photo.image.variant(:thumb))
    end
  end

  def photo_params
    params.require(:photo).permit(:image, :display_order, :description)
  end

  def world_params
    params.require(:world).permit(:vrchat_id)
  end
end
