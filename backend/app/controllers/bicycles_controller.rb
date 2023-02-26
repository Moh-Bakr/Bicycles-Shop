class BicyclesController < ApplicationController
  before_action :set_bicycle, only: %i[ show update destroy ]
  skip_before_action :authenticate_request, only: %i[ index show search]

  def index
    @bicycles = Bicycle.all

    render json: @bicycles
  end

  def show
    render json: @bicycle
  end

  def search
    params[:search] = params[:search].gsub(/[^0-9A-Za-z]/, '')
    @bicycles = Bicycle.where("name LIKE ? or style LIKE ? or price >= ?",
                              "%#{params[:search]}%", "%#{params[:search]}%", params[:search]
    )
    if @bicycles
      render json: @bicycles
    else
      response = { message: 'cannot find bicycle' }
      render json: response, status: :bad_request
    end
  end

  def create
    @bicycle = Bicycle.new(bicycle_params)

    if @bicycle.save
      render json: @bicycle, status: :created, location: @bicycle
    else
      render json: @bicycle.errors, status: :unprocessable_entity
    end
  end

  def update
    if @bicycle.update(bicycle_params)
      render json: @bicycle
    else
      render json: @bicycle.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @bicycle.destroy
  end

  private

  def set_bicycle
    @bicycle = Bicycle.find(params[:id])
  end

  def bicycle_params
    params.require(:bicycle).permit(:name, :style, :price, :description, :image)
  end
end
