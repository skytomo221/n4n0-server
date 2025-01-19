# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    if session_params[:username] == ENV["BASIC_AUTH_USER"] && session_params[:password] == ENV["BASIC_AUTH_PASSWORD"]
      token = jwt_encode(session_params)
      render json: { token: }, status: :ok
    else
      render json: { error: "ユーザー名またはパスワードが違います。" }, status: :unauthorized
    end
  end

  private

  def jwt_encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    puts payload
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
