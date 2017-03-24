class GenresController < ApplicationController
    before_action :set_genre, only: [:show, :edit, :update]

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

  def edit

  end

  def update

  end

  def delete

  end

  private

  def set_genre
    @genre = Genre.find_by(id: params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end

end
