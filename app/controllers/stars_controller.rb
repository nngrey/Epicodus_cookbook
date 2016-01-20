class StarsController < ApplicationController
  before_filter :set_recipe

  def create
    @star = @recipe.stars.new(star_params)
    if @star.save
      redirect_to recipes_path, :notice => "Rating successful."
    else
      redirect_to recipe_path(@recipe), :notice => "Something went wrong."
    end
  end

  def update
    @star = Rating.find(params[:id])
    @star.update_attribute :value, params[:value]
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    def star_params
      params.require(:star).permit(:rating)
    end
end
