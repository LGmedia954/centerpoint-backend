class Api::V1::AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :update, :destroy]

  def index
    @announcements = Announcement.all

    render json: @announcements
  end

  def myAnnouncements
    if logged_in?
      @announcements = current_user.announcements

      render json: AnnouncementSerializer.new(@announcements)
    else
      render json: {
        error: "You must be logged in to view announcements."
      }
    end
  end

  def show
    render json: @announcement
  end

  def create
    #byebug
    @announcement = current_user.announcements.build(announcement_params)

    if @announcement.save
      render json:  AnnouncementSerializer.new(@announcement), status: :created
    else
      error_resp = {
        error: @announcement.errors.full_messages.to_sentence
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  def update
    if @announcement.update(announcement_params)
      render json: AnnouncementSerializer.new(@announcement), status: :ok
    else
      error_resp = {
        error: @announcement.errors.full_messages.to_sentence
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  def destroy
    if @announcement.destroy
      render json:  { data: "Announcement deleted." }, status: :ok
    else
      error_resp = {
        error: "Not found."
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  private

    def set_announcement
      # @announcement = Announcement.find(params[:id])
      @organization = Announcement.find_or_create_by(id: params[:id])
    end

    def announcement_params
      params.require(:announcement).permit(:comment)
    end

end
