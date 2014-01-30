class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    email = params[:user][:email]
    password = params[:user][:password]
    password_confrimation = params[:user][:password_confirmation]
    @user = User.new(:email => email)
    @user.password = password
    @user.password_confirmation = password_confrimation
    if @user.save
      redirect_to root_url, notice: "signed up!"
    else
      render "new"
    end
  end
end
