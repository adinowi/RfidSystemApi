class TagsController < ApplicationController
    def check_paid
        tag_ids = params[:tag_ids]
        tags = Tag.where(id: tag_ids)
        tags.each do |tag|
            if !tag.paid
                return render json: {message: 'One of the product wasnt paid'}, status: :not_acceptable
            end
        end
        render json: {message: 'Everything is ok'}, status: :ok
    end

    def check_tag_paid
        tags = Tag.where(uuid: params[:tag_uuid])
        if tags.any?() && tags.first.paid
            render json: {message: 'Everything is ok'}, status: :ok
        else
            render json: {message: 'Tag is not paid'}, status: :not_acceptable
        end
    end
end
