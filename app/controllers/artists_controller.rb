class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    if @artist.save
      redirect_to @artist
    else
      render :new
      flash[:notice] = "Artists name cannot be left blank"
    end
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to artists_path
    flash[:notice] = "Artist deleted"
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to artist_path
      flash[:notice] = "Artist Updated"
    else
      render :edit
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :image_path)
  end

end
