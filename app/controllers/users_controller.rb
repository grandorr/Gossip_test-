class UsersController < ApplicationController
  def index  # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  end

  def show
    if current_user == nil
      redirect_to new_session_path
    end
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
  end

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    if City.find_by(name: params[:city_name]) == nil
      c = City.create(name: params[:city_name])
    else
      c = City.find_by(name: params[:city_name])
    end
    @user = User.new(username: params[:username],password: params[:password],password_confirmation: params[:password_confirmation],first_name: params[:first_name],last_name: params[:last_name], city: c,email: params[:email],age: params[:age])
    if @user.save
      log_in(@user)
    redirect_to gossips_path
  else
    flash.now[:danger] = 'Le mot de passe et la confirmation ne correspond pas...'
    render new_user_path
  end
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end
end
