require 'test_helper'

class CreateReviewTest < ActionDispatch::IntegrationTest
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

  test 'create review with valid data' do
    post "/api/products/#{@product.id}/reviews", { review: {
      stars: 5,
      body: 'Lorem ipsum',
      author: 'andrew@example.com'
    } }.to_json, 'Accept' => 'application/json',
                 'Content-Type' => 'application/json'

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type
    review = json(response.body)[:review]
    assert_equal api_product_review_url(@product, review[:id]), response.location
    assert_equal 5, review[:stars]
    assert_equal 'Lorem ipsum', review[:body]
    assert_equal 'andrew@example.com', review[:author]
    assert @product.reviews.include?(Review.find(review[:id]))
  end

  test 'create review with invalid data' do
    post "/api/products/#{@product.id}/reviews", { review: {
      stars: 5,
      body: '',
      author: 'andrew@example.com'
    } }.to_json, 'Accept' => 'application/json',
                 'Content-Type' => 'application/json'

    assert_equal 422, response.status
    assert_equal Mime::JSON, response.content_type
  end
end
