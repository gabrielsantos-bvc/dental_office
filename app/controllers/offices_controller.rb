class OfficesController < ApplicationController
  before_action :set_office, only: %i[ show update destroy bookeds ]

  # GET /offices
  def index
    @offices = Office.all

    render json: @offices
  end

  # GET /offices/1
  def show
    render json: @office
  end

  # POST /offices
  def create
    @office = Office.new(office_params)
    if @office.save
      render json: @office, status: :created, location: @office
    else
      render json: @office.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /offices/1
  def update
    if @office.update(office_params)
      render json: @office
    else
      render json: @office.errors, status: :unprocessable_entity
    end
  end

  # DELETE /offices/1
  def destroy
    if @office.destroy!
      render json: { message: 'Office was successfully deleted.' }, status: :ok
    else
      render json: @office.errors, status: :unprocessable_entity
    end
  end

  def booking
    @booking = Booking.new(office_id: params[:id],
                              client_id: params[:client_id],
                              booked_time: params[:booked_time],
                              status: params[:status])
    if @booking.save
      render json: @booking, status: :created
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  def bookings
    render json: @office.bookings
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office
      @office = Office.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def office_params
      params.require(:office).permit(:name, :description, :address)
    end
end
