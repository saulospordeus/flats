class PropertyTypesController < ApplicationController
    
    def new
        @property_type = PropertyType.new
    end

    def index
        @property_types = PropertyType.all
    end

    def create
        @property_type = PropertyType.new(property_type_params)
        if @property_type.save
            redirect_to property_types_path,  notice: "Tipo de Imóvel Cadastrado!"
        else
            render :new
        end
    end

    private

    def property_type_params
        params.require(:property_type).permit(:name)
    end
end