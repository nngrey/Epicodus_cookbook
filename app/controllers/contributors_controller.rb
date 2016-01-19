class ContributorsController < ApplicationController
  def index
    @contributor = Contributor.new(:name => params[:name])
    @contributors = Contributor.all
    # render('contributors/index.html.erb')
  end

  def create
    @contributor = Contributor.new(contributor_params)

    if @contributor.save
      flash[:notice] = "Your cook was added to the cookbook."
      redirect_to contributors_path
    else
      render contributors_path
    end
   end

  def new
    # render('contributors/new.html.erb')
  end

  def show
    @contributor = Contributor.find(params[:id])
    # render('contributors/show.html.erb')
  end

  def edit
    @contributor = Contributor.find(params[:id])
    # render('contributors/edit.html.erb')
  end

  def update
    @contributor = Contributor.find(params[:id])

    if @contributor.update(:name => params[:name])
      redirect_to("/contributors/#{@contributor.id}")
    else
      render('contributors/edit.html.erb')
    end
  end

  def destroy
    @contributor = Contributor.find(params[:id])
    @contributor.destroy
    redirect_to("/contributors/")
  end

  private

  def contributor_params
    params.require(:contributor).permit(:name)
  end

end
