class GenresController < ApplicationController
    before_action :set_genre, only: [:show, :destroy]

  def index
    @genres = Genre.all
  end

  def show

  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to @genre
    else
      render :new
    end
  end

  def destroy
    @genre.song_genres.each do |song_genre|
      song_genre.destroy
    end
    @genre.destroy
    redirect_to genres_path
  end

  private

  def set_genre
    @genre = Genre.find_by(id: params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end

end
