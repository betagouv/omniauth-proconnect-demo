class SessionsController < ApplicationController
  def new; end

  def create
    data = request.env["omniauth.hash"]

    @user = User.find_or_initialize_by(data.uid) do |user|
      user.email = data.info.email
    end

    if @user.save
      redirect_to root_path, notice: "Connexion réussie pour #{@user.email}"
    else
      redirect_to root_path, notice: "Erreur de connexion : #{data}"
    end
  end
end
