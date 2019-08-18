class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [ :show ]
  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new

  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to new_cocktail_dose_path(@cocktail)
    else
      render "new"
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end


# GET index
#     assigns all cocktails as @cocktails (FAILED - 1)
#   GET show
#     assigns the requested cocktail as @cocktail (FAILED - 2)
#   GET new
#     assigns a new cocktail as @cocktail (FAILED - 3)
#   POST create
#     with valid params
#       creates a new Cocktail (FAILED - 4)
#       assigns a newly created cocktail as @cocktail (FAILED - 5)
#       redirects to the created cocktail (FAILED - 6)
#     with invalid params
#       assigns a newly created but unsaved cocktail as @cocktail (FAILED - 7)
#       re-renders the 'new' template (FAILED - 8)
