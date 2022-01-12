module V1
  class EnterprisesController < ApplicationController
    respond_to :json
  
    # GET /v1/enterprise
    def index
      @enterprises = Enterprise.last(5).reverse
      render json: @enterprises
    end

    # POST /v1/enterprise
    def create
      @enterprise = Enterprise.new(resource_params)
      if @enterprise.save
        render json: @enterprise, status: :created, location: @enterprise
      else
        render json: @enterprise.errors, status: :unprocessable_entity
      end
    end



    private
      def resource_params
        params.require(:enterprise).permit(:name, :rooms_number, :opening_time, :ending_time)
      end
  end
end