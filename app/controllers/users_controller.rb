class UsersController < ApplicationController

  def new
   @user = User::Patient.new()
  end

  def create
    @user = User::Patient.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id]=@user.reload.id
        format.html { redirect_to blood_glucoses_show_path, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {}).permit(:full_name,:email,:username,:password,:password_confirmation)
    end
end
