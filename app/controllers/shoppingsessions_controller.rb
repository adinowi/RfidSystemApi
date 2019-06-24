class ShoppingsessionsController < ApplicationController
    before_action :authenticate_user!
    before_action :active_session, only: [:get_list_of_products, :paid, :remove]
    before_action :sensor_exists, only: [:create]
    rescue_from ActionController::ParameterMissing, with: :missing_params
    
    def create
        @shoppingsession = Shoppingsession.create(shoppingsession_params)
        render json: {message: 'Session created' },  status: :ok
    end

    def get_list_of_products
        tag_ids = @shoppingsession.shoppinglists.where(removed: false).map(&:tag_id).flatten
        @tags = Tag.where(id: tag_ids)
        @products = []
        @tags.each do |tag|
            product = Product.where(id: tag.product_id).first
            product.id = tag.id
            @products << product
        end
        render :shoppinglists, status: :ok
    end

    def paid
        tag_ids = @shoppingsession.shoppinglists.map(&:tag_id).flatten
        tags = Tag.where(id: tag_ids)
        tags.each do |tag|
            tag.paid = true
            tag.save
        end
        @shoppingsession.active = false
        @shoppingsession.save
        render json: {message: 'Paid'}, status: :ok
    end

    def remove
        shoppinglists = Shoppinglist.where(tag_id: params[:tag_id], shoppingsession_id: @shoppingsession.id, removed: false)
        if shoppinglists.blank?()
             return render json: {message: 'Unauthorized'}, status: :unauthorized
        end
        shoppinglist = shoppinglists.first
        shoppinglist.removed = true
        shoppinglist.save
        render json: {message: 'Removed'}, status: :ok
    end
    
    
    private 

    def shoppingsession_params
        params.require(:sensor_id)
        params.permit(:sensor_id).merge(user_id: current_user.id, active: true)
    end

    def missing_params
        render json: {error: "Paramter is missing"}, status: :bad_request
    end

    def active_session
        @shoppingsessions = Shoppingsession.where(user_id: current_user.id, active: true)
        if @shoppingsessions.any?()
            @shoppingsession = @shoppingsessions.order(updated_at: :desc).first
        else 
            return render json: {error: "No active session"}, status: :bad_request
        end
    end

    def sensor_exists
        sensors = Sensor.where(id: params[:sensor_id], deleted: false)
        if sensors.blank?()
            return render json: {error: "Sensor dosent exist"}, status: :bad_request
        end
    end
end
