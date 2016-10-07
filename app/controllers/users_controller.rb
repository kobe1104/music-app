class UsersController < ApplicationController
  def new
  end

  def create
    #create new user
    user = User.new(email: user_params[:email], password: user_params[:password])
    if user.save
      log_in(user)
      redirect_to user_url(user) # will render show!!!
    else
      flash.now[:errors] = user.errors.full_messages #an array
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
