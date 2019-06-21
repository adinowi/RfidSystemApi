class ShoppingsessionsController < ApplicationController
    before_action :authenticate_user!
    rescue_from ActionController::ParameterMissing, with: :missing_params
    
    def create
        @shoppingsession = Shoppingsession.create(shoppingsession_params)
        logger.debug @shoppingsession
        render json: {message: 'Session created' },  status: :ok
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
