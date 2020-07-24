class ArtistsController < ApplicationController

  #before_action :get_artist, only: [:show, :edit, :update, :destroy]

  def new
    @artist = Artist.new
  end

  def show
    @artist = get_artist
  end

  def update
    @artist = get_artist
    @artist.update(get_params)
    @artist.save
    redirect_to artist_path(@artist)
  end

  def create
    @artist = Artist.create(get_params)
    redirect_to artist_path(@artist)
  end

  def edit
    @artist = get_artist
  end

  private

  def get_artist
    Artist.find_by(id: params[:id])
  end

  def get_params
    params.require(:artist).permit(:name, :bio)
  end

end
