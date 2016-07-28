class WelcomesController < ApplicationController
  layout false, except: [:index]
  before_action :login_required, except: [:new, :create]
  def new
    build_sign_in
    redirect_to blood_glucoses_show_path if session[:user_id]
  end

  def create
    build_sign_in

    if @sign_in.save
      session[:user_id] = @sign_in.user.id
      redirect_to blood_glucoses_show_path
      flash[:success] = 'User was successfully signed in.'
    else
      flash[:danger] = 'Invalid credentials'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to action: 'new'
  end

  private

  def build_sign_in
    @sign_in = SignIn.new(sign_in_params)
  end

  def sign_in_params
    sign_in_params = params[:sign_in]
    sign_in_params.permit(:email, :password) if sign_in_params
  end
end
