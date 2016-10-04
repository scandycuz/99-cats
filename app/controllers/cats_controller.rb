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

    render :show
  end

  def new
    render :new
  end

  def create
    redirect_to cats_url
  end
end
