class PropertyLocationsController < ApplicationController
    
    #def show
    #    @property_location = PropertyLocation.find(params[:id])
    #end
    #
    #def index
    #    @property_locations = PropertyLocation.all
    #end

    def new
        @property_location = PropertyLocation.new
    end

    def create
        @property_location = PropertyLocation.new(property_location_params)
        if @property_location.save
            redirect_to root_path,  notice: "Região Cadastrada!"
        else
            render :new
        end
    end

    private

    def property_location_params
        params.require(:property_location).permit(:name)
    end
end