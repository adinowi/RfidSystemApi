class ShoppinglistsController < ApplicationController
    before_action :check_shoppinglist_params,:sensor_exists , :active_session, :tag_exists, :tag_added
    def create
        @shoppingsession.shoppinglists.create(tag_id: @tag.id, removed: false)
        render json: {message: 'Product added' },  status: :ok    
    end

    private 
    def check_shoppinglist_params
        if !params.has_key?(:sensor_id) || !params.has_key?(:tag_uuid)
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
        tags = Tag.where(uuid: params[:tag_uuid])
        if tags.blank?()
            return render json: {message: "Tag dosent exist"}, status: :bad_request
        else
            @tag = tags.first
        end
    end

    def tag_added
        shoppinglists = @shoppingsession.shoppinglists.where(tag_id: @tag.id, removed: false) 
        if shoppinglists.any?()
            return render json: {message: "Tag is added"}, status: :bad_request
        end
    end

    def sensor_exists
        sensors = Sensor.where(id: params[:sensor_id], deleted: false)
        if sensors.blank?()
            return render json: {error: "Sensor dosent exist"}, status: :bad_request
        end
    end
end
