class PropertiesController < ApplicationController

    def show
        id = params[:id]
        @property = Property.find(params[:id])
    end

    def new
        @property = Property.new
    end

    def create
        @property = Property.new(property_params)
        if @property.save
            redirect_to @property,  notice: "Imóvel Cadastrado!"
        else
            render :new
        end
    end
    
    private

    def property_params
      params.require(:property).permit(:title, :description, :rooms, :bathrooms,
                                       :pets, :parking_slot, :daily_rate)
    end

end