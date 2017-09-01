class SheltersController < ApplicationController
  before_action :set_shelter, only: [:edit, :update, :destroy]

  def index
    @shelters = Shelter.all
  end

  def new
    @shelter = Shelter.new
  end

  def edit
  end

  def create
    @shelter = Shelter.new(shelter_params)
    if @shelter.save
      redirect_to shelters_path, notice: 'Shelter was successfully created.'
    else
      render :new
    end
  end

  def update
    if @shelter.update(shelter_params)
      redirect_to shelters_path, notice: 'Shelter was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @shelter.destroy
    redirect_to shelters_url, notice: 'Shelter was successfully destroyed.'
  end

  private
    def set_shelter
      @shelter = Shelter.find(params[:id])
    end

    def shelter_params
      params.require(:shelter).permit(:county, :shelter, :address, :city, :longitude, :latitude, :pets, :phone, :accepting, :last_updated, :updated_by, :notes, :volunteer_needs, :source, :supply_needs, :address_name)
    end
end
