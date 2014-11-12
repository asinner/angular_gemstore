require 'test_helper'

class UpdateProductTest < ActionDispatch::IntegrationTest
  setup do
    @product = Product.create!(
      name: 'Scotia',
      description: 'A scottish gem',
      shine: 23,
      price: 2_344.00,
      rarity: 1100,
      color: '#EEE',
      faces:  7
    )
  end
  
  test 'updates product with valid data' do
    patch "/api/products/#{@product.id}", { product: { 
      name: 'Andrew' 
    } }.to_json, { 
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }
    
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    product = json(response.body)[:product]
    assert_equal 'Andrew', product[:name]
    assert_equal 'A scottish gem', product[:description]
  end
  
  test 'does not update product with invalid data' do
    patch "/api/products/#{@product.id}", { product: { 
      name: '' 
    } }.to_json, { 
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }
    
    assert_equal 422, response.status
    assert_equal Mime::JSON, response.content_type
  end
end
