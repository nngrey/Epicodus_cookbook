class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = "Your recipe was added to the cookbook."
      redirect_to '/'
    else
      flash[:error] = "Your recipe could not be saved."
      render :new
    end
  end

   def show
    @star = Star.new
    @recipe = Recipe.find(params[:id])
    @contributor = @recipe.contributor
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)#(name: params[:name], contents: params[:contents], contributor_id: params[:contributor_id])
      redirect_to recipes_path  #("/recipes/#{recipe.id}")
    else
      render('recipes/edit.html.erb')
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to("/recipes/")
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :contents, :contributor_id, :stars, tag_ids: [])
  end
end
