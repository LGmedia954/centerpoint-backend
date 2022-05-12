class Api::V1::DirectoriesController < ApplicationController
  before_action :set_directory, only: [:show, :update, :destroy]

  def index
    @directories = Directory.all

    render json: @directories
  end

  def show
    render json: @directory
  end

  # Business Directory is our default listing.
  # Additional directories for committees, sponsors, participants...

  def create
    if logged_in?
      @directory = Directory.new(directory_params)

      if @directory.save
        render json: DirectorySerializer.new(@directory), status: :created
      else
        resp = {
          error: @directory.errors.full_messages.to_sentence
        }
        render json: resp, status: :unprocessable_entity
      end
    end
  end

  def update
    if @directory.update(directory_params)
      render json: DirectorySerializer.new(@directory), status: :ok
    else
      error_resp = {
        error: @directory.errors.full_messages.to_sentence
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  def destroy
    if @directory.destroy
      render json:  { data: "Directory deleted." }, status: :ok
    else
      error_resp = {
        error: "Directory not found and not destroyed."
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  private

    def set_directory
      # @directory = Directory.find(params[:id])
      @directory = Directory.find_or_create_by(id: params[:id])
    end

    def directory_params
      params.require(:directory).permit(:name, :description)
    end

end
