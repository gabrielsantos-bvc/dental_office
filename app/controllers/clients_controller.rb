class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show update destroy ]

  # GET /clients
  def index
    @clients = Client.all

    render json: @clients
  end

  def login

  end

  # GET /clients/1
  def show
    render json: @client
  end

  def bookings
    @bookings = Booking.where(client_id: params[:id])
    render json: @bookings
  end

  # POST /clients
  def create
    @client = Client.new(name: params[:name], email: params[:email], password: params[:password])

    if @client.save
      render json: @client, status: :created, location: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  def login
    @client = Client.find_by(email: params[:email], password: params[:password])

    if @client
      return_hash = JSON.parse(@client.to_json)
      return_hash["exp"] = (DateTime.now + 1.hours).to_i
      render json: { token: JWT.encode(return_hash, "group1_bvc") }
    else
      render json: {message: "Invalid email or password"}, status: :unauthorized
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      render json: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    if @client.destroy!
      render json: { message: 'Client was successfully deleted.' }, status: :ok
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :address, :phone, :email, :password, :medical_history, :insurance_provider, :insurance_number, :dental_concerns)
    end
end
