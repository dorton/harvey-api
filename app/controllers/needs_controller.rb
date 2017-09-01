class NeedsController < ApplicationController
  before_action :set_need, only: [:show, :edit, :update, :destroy]

  def index
    @needs = Need.all
  end

  def new
    @need = Need.new
  end

  def edit
  end

  def create
    @need = Need.new(need_params)

      if @need.save
        redirect_to needs_path, notice: 'Need was successfully created.'
      else
        render :new
      end
  end

  def update
      if @need.update(need_params)
        redirect_to needs_path, notice: 'Need was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @need.destroy
      redirect_to needs_url, notice: 'Need was successfully destroyed.'
  end

  private
    def set_need
      @need = Need.find(params[:id])
    end

    def need_params
      params.require(:need).permit(:updated_by, :timestamp, :location_name, :location_address, :longitude, :latitude, :contact_for_this_location_name, :contact_for_this_location_phone_number, :are_volunteers_needed, :tell_us_about_the_volunteer_needs, :are_supplies_needed, :tell_us_about_the_supply_needs, :anything_else_you_would_like_to_tell_us, :source)
    end
end
