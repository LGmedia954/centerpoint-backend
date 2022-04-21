class Api::V1::CategoriesController < ApplicationController

  def index
    @categories = Category.all

    render json: @categories
  end

  def show
    category_json = CategorySerializer.new(@category).serialized_json

    render json: category_json
  end

  # Categories are pre-seeded for 20. I do not expect this to change.

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :directory_id)
    end

end
