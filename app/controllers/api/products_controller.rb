module Api
  class ProductsController < ApplicationController
    def index
      products = Product.all
      if rarity = params[:rarity]
        products = products.where('rarity >= ?', rarity)
      end
      render json: products, status: 200
    end
  
    def create    
      product = Product.new(product_params)
    
      if product.save
        render json: product, status: 201, location: [:api, product]
      else
        render json: product.errors, status: 422
      end
    end
  
    def destroy
      product = Product.find(params[:id])
      product.destroy!
      render nothing: true, status: 204
    end
  
    private
  
    def product_params
      params.require(:product).permit(:name, :description, :shine, :price, :rarity, :color, :faces, :category_id)
    end
  end
end