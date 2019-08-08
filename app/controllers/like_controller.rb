class LikeController < ApplicationController
  def new
      Like.create(user: current_user, gossip: Gossip.find(params[:id]))
  end

  def create
  Like.create(user: current_user, gossip: Gossip.find(params[:id]))
 redirect_back(fallback_location: gossips_path)
  end

  def destroy
  Like.destroy(params[:id])
 redirect_back(fallback_location: gossips_path)
  end
end
