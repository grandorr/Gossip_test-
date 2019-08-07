class CommentController < ApplicationController
def create
  @comment = Comment.create(content: params[:commentaire], user: User.all.sample, gossip: Gossip.find(params[:id]))
  redirect_to gossips_path
end
def update
end

end
