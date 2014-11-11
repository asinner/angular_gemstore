require 'test_helper'

class ListingProductsTest < ActionDispatch::IntegrationTest
  setup do
    Product.create!(
      name: 'Halifax',
      description: 'A canadian gem',
      shine: 13,
      price: 1_344.00,
      rarity: 143,
      color: '#CCC',
      faces:  14
    )
  end
  
  test "listing products" do
    get '/products'
    
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_equal Product.count, JSON.parse(response.body).size
  end
end
