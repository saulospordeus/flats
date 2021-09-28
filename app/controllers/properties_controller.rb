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

    def edit
        @property = Property.find(params[:id])
    end

    def update
        @property = Property.find(params[:id])
        if @property.update(property_params)
            redirect_to @property, notice: "Imóvel Editado!"
        else
            flash.now[:notice] = "Não foi possível editar."
            render :edit 
        end
    end
        #TODO testar manualmente esse render
    private

    def property_params
      params.require(:property).permit(:title, :description, :rooms, :bathrooms,
                                       :pets, :parking_slot, :daily_rate, :property_type_id, :property_location_id)
    end

end