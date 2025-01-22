class TagsController < ApplicationController
  skip_before_action :authenticate_user, only: :index

  def index
    render json: Tag.all
  end

  def show
    @tag = Tag.find_by(name: params[:name])
    if @tag
      render json: @tag
    else
      render json: { error: "タグが見つかりませんでした。" }, status: :not_found
    end
  end

  def new
  end

  def edit
  end

  def create
    render json: Tag.create(tag_params)
  end

  def update
  end

  def destroy
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
