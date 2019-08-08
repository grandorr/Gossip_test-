class CommentController < ApplicationController
def create
  puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
  puts params
  puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
  @comment = Comment.create(content: params[:commentaire], user: current_user, gossip: Gossip.find(params[:id]))
  redirect_to gossip_path(@comment.gossip.id)
end
def edit
  @comment = Comment.find(params[:id])
  if current_user != @comment.user
    flash.now[:danger] = "Vous n'êtes pas l'autheur de ce commentaire, vous ne pouvez donc pas le modifié "
      redirect_to gossip_path(@comment.gossip.id)
  end
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
  if current_user != @comment.user
    flash.now[:danger] = "Vous n'êtes pas l'autheur de ce commentaire, vous ne pouvez donc pas le modifié "
      redirect_to gossip_path(@comment.gossip.id)
  else
@comment.destroy
redirect_to gossip_path(@comment.gossip.id)
  end
end
end
