class ShoppingsessionsController < ApplicationController
    before_action :authenticate_user!
    rescue_from ActionController::ParameterMissing, with: :missing_params
    
    def create
        @shoppingsession = Shoppingsession.create(shoppingsession_params)
        render json: {message: 'Session created' },  status: :ok
    end

    def get_list_of_products
        @shoppingsessions = Shoppingsession.where(user_id: current_user.id, active: true)
        if @shoppingsessions.any?()
            shoppingsession = @shoppingsessions.order(updated_at: :desc).first
            tag_ids = shoppingsession.shoppinglists.map(&:tag_id).flatten
            @products = []
            tag_ids.each do |tag_id|
                @products << Product.where(id: tag_id).first
            end
            render :shoppinglists, status: :ok
        end
    end
    
    private 

    def shoppingsession_params
        params.require(:sensor_id)
        params.permit(:sensor_id).merge(user_id: current_user.id, active: true)
    end

    def missing_params
        render json: {error: "Paramter is missing"}, status: :bad_request
    end
end
