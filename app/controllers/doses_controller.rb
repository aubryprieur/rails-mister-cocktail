class DosesController < ApplicationController
  before_action :set_dose, only: [:new, :create, :destroy]
  def index
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose= Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
  end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def set_dose
    @dose = Dose.find(params[:cocktail_id])
  end

  def review_params
    params.require(:dose).permit(:description)
  end
end
