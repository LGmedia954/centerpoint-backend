class Api::V1::DirectoriesController < ApplicationController

  def index
    @directories = Directory.all

    render json: @directories
  end

  def show
    directory_json = DirectorySerializer.new(@directory).serialized_json

    render json: directory_json
  end

  # Business Directory is our default listing.
  # Additional directories can be created for committees, sponsors, participants, etc.

  def create
    @directory = Directory.new(directory_params)

    if @directory.save
      session[:directory_id] = @directory.id
      render json: DirectorySerializer.new(@directory), status: :created
    else
      resp = {
        error: @directory.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  def update
    if @directory.update(directory_params)
      render json: @directory
    else
      render json: @directory.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @directory.destroy
  end

  private

    def set_directory
      @directory = Directory.find(params[:id])
    end

    def directory_params
      params.require(:directory).permit(:name, :description)
    end


end
