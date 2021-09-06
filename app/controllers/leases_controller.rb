class LeasesController < ApplicationController
    def create
        lease = Lease.create(lease_params)
        if lease.valid?
            render json: lease, status: :created
        else
            render json: {"error": "Lease not created"}, status: :unprocessable_entity
        end
    end

    def destroy
        lease = Lease.find(params[:id])
            if lease
                lease.destroy
                head :no_content, status: :no_content
            else
                render json: {"error": "Lease not found"}, status: :not_found
            end
    end

    private

    def lease_params
        params.permit(:tenant_id, :apartment_id, :rent)
    end

end
