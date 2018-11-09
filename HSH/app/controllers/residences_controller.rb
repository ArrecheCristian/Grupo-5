class ResidencesController < ApplicationController
  def index
    @residence = Residence.all
  end

  def show
  end

  def new
    @residence = Residence.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def create

    @residence = Residence.new(residence_params)
    if @residence.save
        redirect_to @residence
      else
        render :new
      end

  end
  def residence_params
    params.require(:residence).permit(:title,:description,:address,:precio,:person)
  end

end
