class ApartmentsController < ApplicationController

    def index
        apartments = Apartment.all
        render json: apartments
    end

    def show
        apartment = Apartment.find(params[:id])
        if apartment.valid? render json: apartment, status: :ok
        else render json: {"error": "Apartment not found"}, status: :not_found
    end
end

    def create
        apartment = Apartment.create(apartment_params)
        if apartment.valid?
            render json: apartment, status: :created
        else
            render json: {"error": "Apartment not created"}, status: :unprocessable_entity
        end
    end

    def update
        apartment = Apartment.find(params[:id])
        apartment.update(apartment_params)
        if apartment.valid?  
        render json: apartment, status: :accepted
        else
            render json: {"error": "Apartment not updated"}, status: :unprocessable_entity
        end
    end


    def destroy
        apartment = Apartment.find(params[:id])
            if apartment
                apartment.destroy
                head :no_content, status: :no_content
            else
                render json: {"error": "Apartment not found"}, status: :not_found
            end
    end


    private

    def apartment_params
        params.permit(:number)
    end
    
end
