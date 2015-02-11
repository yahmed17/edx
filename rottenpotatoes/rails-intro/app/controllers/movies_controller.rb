class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end


  def index
    #check params
    boxes = params[:ratings]
    sort_by =params[:sort_by]
    if (!boxes || !sort_by) then
      boxes = session[:ratings] if  !boxes
      sort_by = session[:sort_by]  if  !sort_by
      flash.keep
      if (boxes && sort_by) then
        redirect_to(movies_path(sort_by: sort_by, ratings: boxes))
      end
    end

    @all_ratings = Movie.movie_ratings
    @selected_rating = Hash.new();

    if !boxes then
      # firs load - set all checkboxes to true
      @all_ratings.each  { |rating| @selected_rating[rating] =true }
    else
      #refresh being clicked
      boxes.each_key { |rating| @selected_rating[rating] =true }
    end

    @movies = Movie.where(rating: @selected_rating.keys)

    if sort_by then
      if sort_by == 'title'
            @class_title = 'hilite'
            @class_release_date=''
       elsif sort_by == 'release_date'
           @class_release_date='hilite'
           @class_title =''
       end
       @movies = @movies.order(sort_by)
    end
    session[:sort_by] =sort_by
    session[:ratings] =boxes
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
