class AccountsController < ApplicationController
  before_action :authenticate_user

  def create
    @account = Account.new(
      user_id: params[:user_id],
      name: params[:name],
      character: params[:character],
      role: params[:role],
      rank: params[:rank],
    )
    if @account.save
      render json: { message: "@account created successfully" }, status: :created
    else
      render json: { errors: @account.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @account = Account.find_by(id: params[:id])
    @account.name = params[:name] || @account.name
    @account.character = params[:character] || @account.character
    @account.role = params[:role] || @account.role
    @account.rank = params[:rank] || @account.rank
    if @account.save
      render :show
    else
      render json: { errors: @account.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    @account = Account.find_by(id: params[:id])
    @account.destroy
    render json: { message: "@account deleted successfully" }
  end

  def show
    @account = Account.find_by(id: params[:id])
    render :show
  end

  def index
    @accounts = Account.all
    render :index
  end
end
