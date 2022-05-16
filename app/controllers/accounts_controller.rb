class AccountsController < ApplicationController
  before_action :authenticate_user

  def create
    @account = Account.new(
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
    if @account == current_account
      @account = current_account
      @account.name = params[:name] || @account.name
      @account.character = params[:character] || @account.character
      @account.role = params[:role] || @account.role
      @account.rank = params[:rank] || @account.rank
      if @account.save
        render "show.json.jb"
      else
        render json: { errors: @account.errors.full_messages }, status: :bad_request
      end
    end
  end

  def destroy
    @account = Account.find_by(id: params[:id])
    @account.destroy
    render json: { message: "@account deleted successfully" }
  end

  def show
    @account = Account.find_by(id: params[:id])
    render "show.json.jb"
  end

  def index
    @accounts = current_user.accounts
    render "index.json.jb"
  end
end
