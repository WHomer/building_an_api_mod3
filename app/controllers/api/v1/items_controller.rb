class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find_by(id: params[:id])
  end

  def create
    render json: Item.create(items_params)
  end

  def update
    render json: Item.update(params[:id], items_params)
  end

  def destroy
    render json: Item.delete(params[:id])
  end

  private
  def items_params
    params.require(:item).permit(:name, :description)
  end

end