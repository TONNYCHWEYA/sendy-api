class ParcelsController < ApplicationController
  # authorize_resource class: false
  before_action :set_parcel, only: %i[show update destroy]

  # GET /parcels
  def index
    @parcels = Parcel.all

    render json: @parcels
  end

  # GET /parcels/1
  def show
    @parcel = Parcel.find(params[:id])
    render json: @parcel
  end

  # POST /parcels
  def create
    @parcel = Parcel.create(para)
    render json: @parcel, status: :created
  end

  def update
    if @parcel.update(parcel_params)
      render json: @parcel
    else
      render json: @parcel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /parcels/1
  def destroy
    @parcel.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_parcel
    @parcel = Parcel.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def parcel_params
    params.require(:parcel).permit(:recipient_name, :recipient_address, :recipient_contact, :weight, :from,
                                   :destination, :total_cost, :order_status)
  end

  def authorize
    return render json: { error: 'Not authorized' }, status: :unauthorized unless session.include? :user_id
  end
end
