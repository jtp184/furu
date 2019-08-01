class SignInController < ApplicationController
  skip_before_action :require_login
  skip_before_action :set_model_scope

  def sign_in
    redirect_to recipes_path if logged_in?
  end

  def log_in
    @user = login(form_params[:username], form_params[:password])

    if @user
      redirect_to recipes_path
    else
      if User.find_by(username: form_params[:username])
        redirect_to sign_in_path
      else
        u = User.new(username: form_params[:username], password: form_params[:password])
        u.save!
        auto_login(u)
        redirect_to recipes_path
      end
    end
  end

  def log_out
    logout
    redirect_to sign_in_path
  end

  private

  def form_params
    params.permit(:username, :password)
  end
end
