class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def index
    @categories = Category.all

    render json: @categories
  end

  def show
    render json: @category
  end

  # Categories are pre-seeded for 20. I do not expect this to change.

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :category_id)
    end

end
