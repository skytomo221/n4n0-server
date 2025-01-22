class AuthorsController < ApplicationController
  skip_before_action :authenticate_user, only: :index

  def index
    render json: Author.all
  end

  def show
    @author = Author.find_by(vrchat_id: params[:vrchat_id])
    if author
      render json: author
    else
      render json: { error: "作者が見つかりませんでした。" }, status: :not_found
    end
  end

  def new
  end

  def edit
  end

  def create
    render json: Author.create(author_params)
  end

  def update
  end

  def destroy
  end

  def author_params
    params.require(:author).permit(:vrchat_id, :name)
  end
end
