class Api::V1::OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :update, :destroy]

  def index
    @organizations = Organization.all

    render json: @organizations
  end

  def show
    organization_json = OrganizationSerializer.new(@organization).serialized_json

    render json: organization_json
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      session[:organization_id] = @organization.id
      render json: OrganizationSerializer.new(@organization), status: :created
    else
      resp = {
        error: @organization.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  def update
    if @organization.update(organization_params)
      render json: @organization
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @organization.destroy
  end

  private

    def set_organization
      @organization = Organization.find(params[:id])
    end

    def organization_params
      params.require(:organization).permit(:name, :address, :suite, :city, :state, :zip, :phone, :mission, :website)
    end

end
