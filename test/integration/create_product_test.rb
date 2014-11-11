require 'test_helper'

class CreateProductTest < ActionDispatch::IntegrationTest
  test 'creates new product with valid data' do
    post '/api/products', { product: {
      name: 'Something',
      description: 'A product!',
      shine: 100,
      price: 1234.23,
      rarity: 432,
      color: '#FFF',
      faces: 13,
      category_id: 1
    } }.to_json, 'Accept' => 'application/json',
                 'Content-Type' => 'application/json'

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type
    product = json(response.body)[:product]
    assert_equal api_product_url(product[:id]), response.location
    assert_equal 'Something', product[:name]
    assert_equal 'A product!', product[:description]
    assert_equal 100, product[:shine]
    assert_equal '1234.23', product[:price]
    assert_equal 1, product[:category_id]
  end

  test 'creates new product with invalid data' do
    post '/api/products', { product: {
      name: nil,
      description: 'A product!',
      shine: 100,
      price: 1234.23,
      rarity: 432,
      color: '#FFF',
      faces: 13,
      category_id: 1
    } }.to_json, 'Accept' => 'application/json',
                 'Content-Type' => 'application/json'

    assert_equal 422, response.status
    assert_equal Mime::JSON, response.content_type
  end
end
