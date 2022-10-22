class BirdsController < ApplicationController
  wrap_parameters format: []

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  # POST /birds
  def create
    # NOTE: This is the previous code without using 'strong params':
    # bird = Bird.create(name: params[:name], species: params[:species])
    # render json: bird, status: :created
    # Using entire 'params' hash:
    # NOTE: This is the previous version that does NOT use the 'private' method of using 'strong params'
    # bird = Bird.create(params.permit(:name, :species))
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  private

  def bird_params
    params.permit(:name, :species)
  end

end