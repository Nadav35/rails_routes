class ArtworksController < ApplicationController
  def index
    # render json: Artwork.all
    # debugger
    my_artwork = Artwork.where(artist_id: params[:user_id])
    viewed_art = Artwork.joins(:shared_viewers).where('artwork_shares.viewer_id = ?', params[:user_id])
    # viewed_art = Artwork.where(viewer_id: params[:user_id])
    
    render json: {viewed_art: viewed_art, my_artwork:my_artwork}
  end

  def show
    artwork = Artwork.find(params[:id])
    if artwork
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity 
    end
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity

    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    if artwork.destroy
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :artist_id, :image_url)
    
  end
end