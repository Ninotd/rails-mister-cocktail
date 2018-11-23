class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def index
    if params[:cocktail].nil?
      @cocktails = Cocktail.all
    else
      @cocktails = Cocktail.where(name: params[:cocktail])
    end
    if params[:ingredient].nil?
      @cocktails = Cocktail.all
    else
      @cocktails_all = Cocktail.all
      @cocktails = []
      @cocktails_all.each do |cocktail|
        cocktail.ingredients.each do |ingredient|
          if ingredient[:name] == params[:ingredient]
          @cocktails << cocktail
          end
        end
      end
    end
    @cocktail = Cocktail.new
  end

  def show
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_param)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_param
    params.require(:cocktail).permit(:name, :photo, :description)
  end

end
