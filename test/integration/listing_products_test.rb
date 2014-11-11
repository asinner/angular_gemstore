require 'test_helper'

class CreateProductTest < ActionDispatch::IntegrationTest
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
    
    Product.create!(
      name: 'Scotia',
      description: 'A scottish gem',
      shine: 23,
      price: 2_344.00,
      rarity: 1100,
      color: '#EEE',
      faces:  7
    )
  end
  
  test "listing products" do
    get '/products'
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_equal Product.count, json(response.body)[:products].size
  end
  
  test "list rarest products" do
    get '/products?rarity=1000'
    
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_equal 1, json(response.body)[:products].size
  end
end
