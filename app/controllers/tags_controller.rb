class TagsController < ApplicationController
  skip_before_action :authenticate_user, only: :index

  def index
    render json: Tag.all
  end

  def show
    render json: Tag.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
