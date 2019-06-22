class ShoppinglistsController < ApplicationController
    before_action :check_shoppinglist_params, only: [:create]

    def create
        shoppingsessions = Shoppingsession.where(sensor_id: params[:sensor_id], active: true)
        if shoppingsessions.any?()
            shoppingsession = shoppingsessions.order(updated_at: :desc).first
            shoppingsession.shoppinglists.create(tag_id: params[:tag_id], removed: false)
            render json: {message: 'Product added' },  status: :ok
        end       
    end

    private 
    def check_shoppinglist_params
        if !params.has_key?(:sensor_id) || !params.has_key?(:tag_id)
            render json: {error: "Paramter is missing"}, status: :bad_request
        end
        
    end
end
