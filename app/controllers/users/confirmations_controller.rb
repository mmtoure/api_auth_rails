class Users::ConfirmationsController < Devise::ConfirmationsController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      unless @user.confirmed?
        @user.resend_confirmation_instructions
        render json: {
          message: "We have sent you an email with the confirmation link"
        },
        status: :ok
      else
        render json: {
          message: "Email was already confirmed."
        }
      end
    else
      render json: {
        error: "We have sent you an email with the confirmation link"
      }
    end
  end

  def show
    @user = resource_class.confirm_by_token(params[:confirmation_token])

    if @user.errors.empty?
      render json: {
        message: "Your account has been confirmed. You can now login"
      }, status: :ok
    else
      render json: {
        errors: @user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end
end
