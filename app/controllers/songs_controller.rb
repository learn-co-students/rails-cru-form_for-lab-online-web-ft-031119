class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def show
    @song = get_song
  end

  def update
    @song = get_song
    @song.update(get_params)
    @song.save
    redirect_to song_path(@song)
  end

  def create
    @song = Song.create(get_params)
    redirect_to song_path(@song)
  end

  def edit
    @song = get_song
  end

  private

  def get_song
    Song.find_by(id: params[:id])
  end

  def get_params
    params.require(:song).permit(:name)
  end

end
