class ProductsController < ApplicationController
  def index
    products = Product.all
    
    if rarity = params[:rarity]
      products = products.where('rarity >= ?', rarity)
    end
    
    render json: products, status: 200
  end
end