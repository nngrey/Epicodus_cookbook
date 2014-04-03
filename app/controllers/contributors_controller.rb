class ContributorsController < ApplicationController
  def index
    @contributors = Contributor.all
    render('contributors/index.html.erb')
  end

  def create
    # @contributors = Contributor.all
    @contributor = Contributor.new(:name => params[:name])

    if @contributor.save
      # render('contributors/index.html.erb')
      redirect_to("/contributors/#{@contributor.id}")
    else
      @contributors = Contributor.all
      render('contributors/new.html.erb')
    end
   end

  def new
    render('contributors/new.html.erb')
  end

  def show
    @contributor = Contributor.find(params[:id])
    render('contributors/show.html.erb')
  end

  def edit
    @contributor = Contributor.find(params[:id])
    render('contributors/edit.html.erb')
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

end
