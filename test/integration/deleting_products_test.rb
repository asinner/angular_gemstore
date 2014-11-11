require 'test_helper'

class DeletingProductsTest < ActionDispatch::IntegrationTest
  setup do
    @product = Product.create!(
      name: 'Halifax',
      description: 'A canadian gem',
      shine: 13,
      price: 1_344.00,
      rarity: 143,
      color: '#CCC',
      faces:  14
    )
  end
  
  test 'delete products' do
    delete "/api/products/#{@product.id}"
    
    assert_equal 204, response.status
  end
end
