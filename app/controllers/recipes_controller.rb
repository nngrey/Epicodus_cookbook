class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render('recipes/index.html.erb')
  end

  def new
    render('recipes/new.html.erb')
  end

  def create
    # @recipes = Recipe.all
    # Contributor.find_by(:name => params[:contributor_name])
    @recipe = Recipe.new(name: params[:name], contents: params[:contents], contributor_id: params[:contributor_id])

    if @recipe.save
      redirect_to("/recipes/#{@recipe.id}")
    else
      @recipes = Recipe.all
      render('recipes/new.html.erb')
    end
  end

   def show
    @recipe = Recipe.find(params[:id])
    render('recipes/show.html.erb')
  end

  def edit
    @recipe = Recipe.find(params[:id])
    render('recipes/edit.html.erb')
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(name: params[:name], contents: params[:contents], contributor_id: params[:contributor_id])
      redirect_to("/recipes/#{recipe.id}")
    else
      render('recipes/edit.html.erb')
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to("/recipes/")
  end
end
