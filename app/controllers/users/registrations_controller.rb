class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  private

  def respond_with(current_user, _opts = {})
    if resource.persisted?
      @token = request.env["warden-jwt_auth.token"]
      headers["Authorization"] = @token
      render json: {
        status: { code: 200, message: "Signed up successfully." },
        token: @token,
        user: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
      }, status: :ok
    else
      render json: {
        status: { message: "User couldn't be created successfully. #{current_user.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end
end
