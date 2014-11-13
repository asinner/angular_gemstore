require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest
  setup do
    @admin = Admin.create!(
      email: 'andrew@example.com',
      password: '12345678',
      password_confirmation: '12345678'
    )
  end

  test 'with valid credentials, admin should get token' do

    post '/sign-in', {
      email: 'andrew@example.com',
      password: '12345678'
    }.to_json, 'Accept' => 'application/json',
               'Content-Type' => 'application/json'

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type
    res = json(response.body)
    @admin = Admin.find(@admin)
    assert_equal @admin.token, res[:token]
  end

  test 'with invalid credentials, admin gets no token' do
    post '/sign-in', { admin: {
      email: 'WRONGEMAIL@example.com',
      password: '12345678'
    } }.to_json, 'Accept' => 'application/json',
                 'Content-Type' => 'application/json'

    assert_equal 401, response.status
    assert_equal Mime::JSON, response.content_type
  end
end
