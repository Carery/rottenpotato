class MoviesController < ApplicationController
  def index
    @movies = Movie.order(:title)
  end
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.html.haml by default
  end
  def new
  # default: render 'new' template
  end
  
  def create
    @movie = Movie.create!(params.require(:movie).permit(:title, :rating, :release_date))
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movie_path(@movie)
  end
  
  def edit
    @movie = Movie.find params[:id]
  end
 
  def update
    @movie = Movie.find(params[:id])
    @movie.update_attributes!(params[:movie].permit(:title, :rating, :release_date))
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
