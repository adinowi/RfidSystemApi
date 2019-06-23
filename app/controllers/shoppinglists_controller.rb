class ShoppinglistsController < ApplicationController
    before_action :check_shoppinglist_params, :active_session, :tag_exists, :tag_added
    def create
        @shoppingsession.shoppinglists.create(tag_id: params[:tag_id], removed: false)
        render json: {message: 'Product added' },  status: :ok    
    end

    private 
    def check_shoppinglist_params
        if !params.has_key?(:sensor_id) || !params.has_key?(:tag_id)
            return render json: {error: "Paramter is missing"}, status: :bad_request
        end
        
    end

    def active_session
        shoppingsessions = Shoppingsession.where(sensor_id: params[:sensor_id], active: true)
        if shoppingsessions.any?()
            @shoppingsession = shoppingsessions.order(updated_at: :desc).first
        else
           return render json: {message: "No active session"}, status: :bad_request
        end
    end

    def tag_exists
        tags = Tag.where(id: params[:tag_id])
        if tags.blank?()
            return render json: {message: "Tag dosent exist"}, status: :bad_request
        end
    end

    def tag_added
        tags = @shoppingsession.shoppinglists.where(tag_id: params[:tag_id], removed: false) 
        if tags.any?()
            return render json: {message: "Tag is added"}, status: :bad_request
        end
    end
end
