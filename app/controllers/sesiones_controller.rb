class SesionesController < ApplicationController
  def new
  end

  def create
    usuario = Usuario.find_by(email: params[:email])
    if usuario && usuario.authenticate(params[:password])
      session[:user_id] = usuario.id
      redirect_to perfil_usuario_path(usuario), notice: "Inicio de sesión exitoso."
    else
      flash.now[:error] = "Correo electrónico o contraseña incorrectos."
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Sesión cerrada exitosamente."
  end
end
