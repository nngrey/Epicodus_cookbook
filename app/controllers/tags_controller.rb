class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:notice] = "Your tag was added to the cookbook."
      redirect_to tags_path
    else
      @tags = Tag.all
      render('tags/new.html.erb')
    end
  end

   def show
    @tag = Tag.find(params[:id])
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])

    if @tag.update(params[:tag])
      redirect_to tag_path(@tag)
    else
      render('tags/edit.html.erb')
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to("/tags/")
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
