class FlyController < ApplicationController
  def new
  	@airline = Airline.friendly.find(params[:airline_id])
  	@fly = @airline.flies.build
  end

  def create

    #categories = fly_params["requirements"]["category"]
    #values = fly_params["requirements"]["value"]

  	#requirements_hash = {}

  	#categories.each_with_index do |item, index|
    #  key = FLIGHT_HOUR_TYPES.key(item)
  	#	requirements_hash[key] = values[index]
  	#end

  	#fly_params["requirements"] = requirements_hash

  	@fly = Airline.friendly.find(params[:airline_id]).flies.new(fly_params)

  	if @fly.save
  		flash[:success] = "Added opportunity successfully!"
  		redirect_to airline_fly_path(@fly.airline, @fly)
  	else
  		render "new"
  	end
  end

  def show
  	@fly = Fly.friendly.find(params[:id])
  end

  def index
  	@flies = Fly.all
  end

  private

  	def fly_params
  		params.require(:fly).permit(:name, :position, :equipment, :base, :expiration, :website, :intro, :content, :airline_id, *User.permissible_params)
  	end
end
