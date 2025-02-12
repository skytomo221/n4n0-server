class PortraitsController < ApplicationController
  skip_before_action :authenticate_user, only: %i[index show show_photo sample]

  def index
    render json: Portrait.all.map(&:as_json_with_associations)
  end

  def show
    render json: Portrait.find(params[:id])&.as_json_with_associations
  end

  def show_photo
    photo = Portrait.find(params[:id])&.photo
    render_photo_url(photo)
  end

  def sample
    render json: Portrait.sample.as_json_with_associations
  end

  def new
  end

  def edit
  end

  def create
    pp params
    author = Author.find_or_create_by(author_params)
    world = World.create(world_params.merge(author_id: author.id))
    tags_params[:tags].each do |tag|
      tag = Tag.find_or_create_by(name: tag)
      WorldTag.create(world_id: world.id, tag_id: tag.id)
    end

    render json: world
  end

  def update
  end

  def destroy
  end

  def world_params
    params.require(:world).permit(:vrchat_id, :name, :author_id, :description, :released_at, :hidden)
  end

  def author_params
    params.require(:author).permit(:vrchat_id, :name)
  end

  def tags_params
    params.permit(tags: [])
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
end
