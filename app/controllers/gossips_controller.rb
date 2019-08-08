class GossipsController < ApplicationController
   before_action :authenticate_user, only: [:show, :new]


  def index

    @gossip = Gossip.all.sample
    @gossips = Gossip.all
    @gossips = @gossips.sort_by{|gossip| gossip[:date]}
    @gossips = @gossips.reverse
  end

  def show

    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
  end

  def new
        @gossip = Gossip.all.sample
    end

  def create
    @gossip = Gossip.new(title: params[:title],content: params[:gossip], user: current_user)

  if @gossip.save
    redirect_to({:action=>'index'}, :alert =>"success")  #gossip_path(@gossip.id)
  else
    render new_gossip_path
  end
end

  def edit
    gossip = Gossip.find(params[:id])
    if current_user != gossip.user
      flash.now[:danger] = "Vous n'êtes pas l'autheur de ce Gossip, vous ne pouvez donc pas le modifié "
      render "show"
    end
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update

    @gossip = Gossip.find(params[:id])
  if @gossip.update(title: params[:title],content: params[:gossip])
    redirect_to @gossip, :alert =>"success"
  else
    render :edit
  end
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    gossip = Gossip.find(params[:id])
    if current_user != gossip.user
      flash.now[:danger] = "Vous n'êtes pas l'autheur de ce Gossip, vous ne pouvez donc pas le supprimer "
      render "show"
    else

@gossip = Gossip.find(params[:id])
@gossip.destroy
redirect_to root
    end
  end

private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
