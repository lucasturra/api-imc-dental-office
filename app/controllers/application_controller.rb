class ApplicationController < ActionController::API
  AUTH_TOKEN = "challengedentaloffice2023"
  before_action:authorize_token

  def authorize_token
    render json: {}, status: 401 if request.headers['Authorization'] != "Bearer #{AUTH_TOKEN}"
  end
end
