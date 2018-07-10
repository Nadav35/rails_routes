class ArtworkSharesController < ApplicationController
  
  def create
    artwork = ArtworkShare.new(artwork_share_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def destroy
    artwork = ArtworkShare.find(params[:id])
    if artwork.destroy
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  private

  def artwork_share_params
    params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
    
  end
end