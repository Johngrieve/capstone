class UsersController < ApplicationController
  before_action :authenticate_user, :except => [:create]

  def create
    @user = User.new(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if @user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user == current_user
      @user = current_user
      @user.email = params[:email] || @user.email
      if params[:password]
        @user.password = params[:password]
        @user.password_confirmation = params[:password_confirmation]
      end
      if @user.save
        render :show
      else
        render json: { errors: @user.errors.full_messages }, status: :bad_request
      end
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    render json: { message: "User deleted successfully" }
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end
end
