class ApplicationController < ActionController::API
  before_action :authenticate_request

  private

  def authenticate_request
    token = request.headers["token"] == "f6a3af2a-f9a3-482c-b9ba-81bfc149b416"
    render json: { error: "Not Authorized" }, status: 401 unless token
  end
end
