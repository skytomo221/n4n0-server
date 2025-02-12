class WorldGuidesController < ApplicationController
  skip_before_action :authenticate_user, only: %i[index show sample]

  def index
    render json: WorldGuide.joins(:world).map(&:as_json_with_associations)
  end

  def show
    @world_guide = World.find_by(vrchat_id: params[:vrchat_id])&.world_guide
    if @world_guide
      render json: @world_guide.as_json_with_associations
    else
      render json: { error: "ワールドが見つかりませんでした。" }, status: :not_found
    end
  end

  def sample
    render json: WorldGuide.joins(:world).sample.as_json_with_associations
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
end
