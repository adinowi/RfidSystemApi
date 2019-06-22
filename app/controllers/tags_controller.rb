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
end
