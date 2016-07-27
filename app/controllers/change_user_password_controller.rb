class ChangeUserPasswordController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to blood_glucoses_show_path, notice: 'password successfully changed.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User::AsChangepassword.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.fetch(:user, {}).permit(:old_password, :password, :password_confirmation)
  end
end
