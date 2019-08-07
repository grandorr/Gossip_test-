class CommentController < ApplicationController
def create
  puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
  puts params
  puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
  @comment = Comment.create(content: params[:commentaire], user: User.all.sample, gossip: Gossip.find(params[:id]))
  redirect_to gossip_path(@comment.gossip.id)
end
def edit
end
def update
  @comment = Comment.find(params[:id])
  if @comment.update(content: params[:content])
    redirect_to gossip_path(@comment.gossip.id)
  else
    render :edit
  end
end
def destroy
  @comment = Comment.find(params[:id])
@comment.destroy
redirect_to gossip_path(@comment.gossip.id)
end
end
