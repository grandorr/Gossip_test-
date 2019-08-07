class GossipsController < ApplicationController
  def index
    @gossip = Gossip.all.sample
    @gossips = Gossip.all
  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
  end

  def new
        @gossip = Gossip.all.sample
    end

  def create
    @gossip = Gossip.new(title: params[:title],content: params[:gossip], user: User.all.sample)
  if @gossip.save
    redirect_to({:action=>'index'}, :alert =>"success")  #gossip_path(@gossip.id)
  else
    render new_gossip_path
  end
end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    @gossip = Gossip.find(params[:id])
  if @gossip.update(title: params[:title],content: params[:gossip])
    redirect_to @gossip
  else
    render :edit
  end
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
@gossip = Gossip.find(params[:id])
@gossip.destroy
redirect_to gossips_path
  end
end
