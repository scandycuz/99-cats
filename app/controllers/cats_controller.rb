class CatsController < ApplicationController
  def index
    @cats = Cat.all

    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    if @cat.nil?
      flash[:errors] << "Couldn't find cat!"
      redirect_to cats_url
      return
    end
    requests = CatRentalRequest.where("cat_id = #{@cat.id}").order("start_date")
    render :show, locals: {requests: requests}
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    Cat.create(cat_params)
    redirect_to cats_url
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update(cat_params)

    redirect_to cats_url
  end


  private
  def cat_params
    params.require(:cat).permit(:name, :sex, :color, :birth_date, :description)
  end
end
