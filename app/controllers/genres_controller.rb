class GenresController < ApplicationController

  def new
    @genre = Genre.new
  end

  def show
    @genre = get_genre
  end

  def update
    @genre = get_genre
    @genre.update(get_params)
    @genre.save
    redirect_to genre_path(@genre)
  end

  def create
    @genre = Genre.create(get_params)
    redirect_to genre_path(@genre)
  end

  def edit
    @genre = get_genre
  end

  private

  def get_genre
    Genre.find_by(id: params[:id])
  end

  def get_params
    params.require(:genre).permit(:name)
  end

end
