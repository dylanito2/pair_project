class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update]

  def index
    @songs = Song.all
  end

  def show

  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(name: song_params[:name])
    genres = song_params[:genre_ids]
    genres.delete('')
    @song.artist = @artist
    @song.genre_ids = genres
    unless genre_params[:name].blank?
      @song.genres << Genre.create(genre_params)
    end
    if artist_params[:name].blank?
      @song.artist = Artist.find(song_params[:artist_id])
    else
      @song.artist = Artist.find_or_create_by(artist_params)
    end
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def delete

  end


  private

  def set_song
    @song = Song.find_by(id: params[:id])
  end

  def song_params
    params.require(:song).permit(:name, :artist_id, genre_ids: [])
  end

  def artist_params
    params.require(:artist).permit(:name)
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
