class Api::V1::AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :update, :destroy]

  def index
    @announcements = Announcement.all

    render json: @announcements
  end

  def show
    render json: @announcement
  end

  def myAnnouncements
    if logged_in?
      # @announcements = current_user.announcements
      @announcements = current_user.announcements.find(announcement_params)

      render json: AnnouncementSerializer.new(@announcements)
    else
      render json: {
        error: "You must be logged in to access this."
      }
    end
  end

  def create
    @announcement = current_user.announcements.build(announcement_params)

    if @announcement.save
      render json: AnnouncementSerializer.new(@announcement), status: :created
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
      render json:  { data: "Announcement Deleted" }, status: :ok
    else
      error_resp = {
        error: "Announcement not found and not destroyed."
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  private

    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    def announcement_params
      params.require(:announcement).permit(:comment)
    end

end
