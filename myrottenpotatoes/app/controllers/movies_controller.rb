# This file is app/controllers/movies_controller.rb
 class MoviesController < ApplicationController
   def index
       @movies = Movie.all
   end
   def show
      id = params[:id]
      @movie = Movie.find(id)
    end
    def new
       # default render 'new' template
    end
    def create
      #debugger
      @movie = Movie.create!(params[:movie])
      flash[:notice]="#{@movie.title} was successfully created."
      redirect_to movies_path
    end
  end
