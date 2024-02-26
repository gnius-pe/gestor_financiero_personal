class UsuariosController < ApplicationController
  
  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      session[:user_id] = @usuario.id
      redirect_to root_path, notice: "¡Registro exitoso! Bienvenido a nuestra aplicación."
    else
      render :new
    end
  end
  def perfil
    @usuario = current_usuario
   
    # Lógica adicional para mostrar el perfil del usuario...
  end

  private

  def usuario_params
    params.require(:usuario).permit(:nombre, :email, :password, :password_confirmation)
  end
end
