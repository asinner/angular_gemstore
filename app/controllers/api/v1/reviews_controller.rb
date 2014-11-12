module Api::V1
  class ReviewsController < ApplicationController
    def create
      product = Product.find(params[:product_id])
      review = product.reviews.build(review_params)
      
      if review.save
        render json: review, status: 201, location: [:api, product, review]
      else
        render json: review.errors, status: 422
      end
    end
    
    private
    
    def review_params
      params.require(:review).permit(:stars, :body, :author)
    end
  end
end
