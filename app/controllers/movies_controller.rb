# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
  @all_ratings = Movie.all_ratings

  # ler parâmetros/lembrar sessão
  @sort = params[:sort] || session[:sort]
  @checked_ratings = (params[:ratings]&.keys || session[:ratings] || @all_ratings)

  # manter URL canônica (para os testes): sort + ratings
  if params[:sort] != @sort || (params[:ratings]&.keys || session[:ratings]) != @checked_ratings
    flash.keep
    return redirect_to movies_path(sort: @sort, ratings: Hash[@checked_ratings.map { |r| [r, '1'] }])
  end

  # consulta: filtra e ordena
  @movies = Movie.where(rating: @checked_ratings)
  case @sort
  when 'title'
    @movies = @movies.order(:title)
    @title_hilite = 'hilite'
  when 'release_date'
    @movies = @movies.order(:release_date)
    @date_hilite = 'hilite'
  end

  # salvar preferências
  session[:sort]    = @sort
  session[:ratings] = @checked_ratings
  end

  def show
    id = params[:id]
    @movie = Movie.find(id)
  end

  def new
    @movie = Movie.new
  end

  def create
    #@movie = Movie.create!(params[:movie]) #did not work on rails 5.
    @movie = Movie.create(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created!"
    redirect_to movies_path
  end

  def movie_params
    params.require(:movie).permit(:title,:rating,:description,:release_date)
  end

  def edit
    id = params[:id]
    @movie = Movie.find(id)
    #@movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    #@movie.update_attributes!(params[:movie])#did not work on rails 5.
    @movie.update(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated!"
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find params[:id]
    @movie.destroy
    flash[:notice] = "#{@movie.title} was deleted!"
    redirect_to movies_path
  end
end