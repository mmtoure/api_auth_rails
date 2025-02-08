class Users::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: {
      status: { code: 200, message: "Retreive user successfully." },
      user: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
    }, status: :ok
  end
end
