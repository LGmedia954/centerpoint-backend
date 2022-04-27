class Api::V1::OrganizationsController < ApplicationController
  before_action :set_organization, only: [:mybiz, :show, :update, :destroy]

  def index
    @organizations = Organization.all

    render json: @organizations
  end

  def mybiz
    if logged_in?
      @organizations = current_user.organizations

      render json: OrganizationSerializer.new(@organizations)
    else
      render json: {
        error: "You must be logged in to access this"
      }
    end
  end

  def show
    render json: @organization
  end

  def create
    @organization = current_user.organizations.build(organization_params)

    if @organization.save
      render json: OrganizationSerializer.new(@organization), status: :created
    else
      error_resp = {
        error: @organization.errors.full_messages.to_sentence
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  def update
    if @organization.update(organization_params)
      render json: OrganizationSerializer.new(@organization), status: :ok
    else
      error_resp = {
        error: @organization.errors.full_messages.to_sentence
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  def destroy
    if @organization.destroy
      render json:  { data: "Organization Deleted" }, status: :ok
    else
      error_resp = {
        error: "Organization not found and not destroyed"
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  private

    def set_organization
      @organization = Organization.find(params[:id])
    end

    def organization_params
      params.require(:organization).permit(:name, :address, :suite, :city, :state, :zip, :phone, :mission, :website)
    end

end
