class ApplicationController < ActionController::API
  before_action :authenticate_user

  class UserAuthenticationError < StandardError; end

  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
  rescue_from UserAuthenticationError, with: :unauthorized
  rescue_from JWT::VerificationError, with: :unauthorized

  def authenticate_user
    raise UserAuthenticationError unless aministrator?
  end

  def aministrator?
    decoded_token = jwt_decode_user(request.headers)
    decoded_token["username"] == ENV["BASIC_AUTH_USER"] && decoded_token["password"] == ENV["BASIC_AUTH_PASSWORD"]
  end

  private

  def unprocessable_entity(exception)
    render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

  def unauthorized
    render json: { error: "ログインしてください。" }, status: :unauthorized
  end

  def jwt_decode_user(headers)
    token = headers["Authorization"]&.split&.last
    return if token.blank?

    decoded_array = JWT.decode(token, Rails.application.credentials.secret_key_base, true, { algorithm: "HS256" })

    JSON.parse(decoded_array[0].gsub("=>", ":"))
  end
end
