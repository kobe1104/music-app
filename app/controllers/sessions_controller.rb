class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(user_params[:email], user_params[:password])
    if user
      log_in(user)
      flash[:message] = "Welcom back"
      redirect_to user_url(user)
    else
      flash.now[:errors] = ["Invalid credentials"]
      render :new
    end
  end

  def destroy
    log_out
    flash.now[:message] = "Ciao!"
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :session_token)
  end
end
