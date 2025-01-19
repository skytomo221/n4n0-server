class WorldsController < ApplicationController
  skip_before_action :authenticate_user, only: :index

  def index
    render json: World.all
  end

  def show
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
end
