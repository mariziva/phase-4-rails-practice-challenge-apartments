class TenantsController < ApplicationController

    def index
        tenants = Tenant.all
        render json: tenants
    end

    def show
        tenant = Tenant.find(params[:id])
        if tenant.valid? render json: tenant, status: :ok
        else render json: {"error": "Tenant not found"}, status: :not_found
    end
end

    def create
        tenant = Tenant.create(tenant_params)
        if tenant.valid?
            render json: tenant, status: :created
        else
            render json: {"error": "Tenant not created"}, status: :unprocessable_entity
        end
    end

    def update
        tenant = Tenant.find(params[:id])
        tenant.update(tenant_params)
        if tenant.valid?  
        render json: tenant, status: :accepted
        else
            render json: {"error": "Tenant not updated"}, status: :unprocessable_entity
        end
    end


    def destroy
        tenant = Tenant.find(params[:id])
            if tenant
                tenant.destroy
                head :no_content, status: :no_content
            else
                render json: {"error": "Tenant not found"}, status: :not_found
            end
    end


    private

    def tenant_params
        params.permit(:name, :age)
    end

end
