class PhotosController < ApplicationController
  def show
    world = World.find_by(vrchat_id: params[:vrchat_id])
    photo = world.photos.find_by(display_order: params[:display_order])
    if photo
      redirect_to rails_blob_url(photo.image)
    else
      head :not_found
    end
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

  def photo_params
    params.require(:photo).permit(:image, :display_order, :description)
  end

  def world_params
    params.require(:world).permit(:vrchat_id)
  end
end
