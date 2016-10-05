class CatRentalRequestsController < ApplicationController
  def index
    render json: CatRentalRequest.all
  end

  def new
    render :new
  end

  def create
    CatRentalRequest.create(rental_request_param)
    redirect_to cat_rental_requests_url
  end

  private
  def rental_request_param
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end
end
