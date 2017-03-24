class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update]

  def index
    @artists = Artist.all
  end

  def show

  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to @artist
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

  def set_artist
    @artist = Artist.find_by(id: params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name)
  end
end
