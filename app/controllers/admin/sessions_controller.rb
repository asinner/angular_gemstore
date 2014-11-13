class Admin::SessionsController < ApplicationController
  def create
    admin = Admin.find_by(email: params[:email])
    if admin && admin.valid_password?(params[:password])
      admin.update(token: SecureRandom.uuid)
      render json: { token: admin.token, admin: admin }, status: 201
    else
      render json: { msg: 'Invalid email or password' }, status: 401
    end
  end
end
