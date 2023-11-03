class DentistsController < ApplicationController
  before_action :set_dentist, only: %i[ show update destroy ]

  # GET /dentists
  def index
    @dentists = Dentist.all

    render json: @dentists
  end

  # GET /dentists/1
  def show
    render json: @dentist
  end

  # POST /dentists
  def create
    @dentist = Dentist.new(dentist_params)

    if @dentist.save
      render json: @dentist, status: :created, location: @dentist
    else
      render json: @dentist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dentists/1
  def update
    if @dentist.update(dentist_params)
      render json: @dentist
    else
      render json: @dentist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dentists/1
  def destroy
    @dentist.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dentist
      @dentist = Dentist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dentist_params
      params.require(:dentist).permit(:name, :expertise)
    end
end
