class Users::SessionsController < Devise::SessionsController
  respond_to :json
  private
  def respond_with(current_user, _opts = {})
    if current_user.confirm?
      @token = request.env["warden-jwt_auth.token"]
      headers["Authorization"] = @token
      render json: {
        status: { code: 200, message: "Signed up successfully." },
        token: @token,
        user: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
      }, status: :ok
    else
      render json: { error: "Email not confirmed." }, status: :unauthorized
    end
  end
  def respond_to_on_destroy
    if request.headers["Authorization"].present?
      jwt_payload = JWT.decode(request.headers["Authorization"].split(" ").last, Rails.application.credentials.devise_jwt_secret_key!).first
      current_user = User.find(jwt_payload["sub"])
    end

    if current_user
      render json: {
        status: 200,
        message: "Logged out successfully."
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end
