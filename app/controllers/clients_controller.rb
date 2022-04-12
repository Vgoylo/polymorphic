class ClientsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
  end 

  def new
    @client = Client.new
  end

  def create 
    @client = Client.create(client_params)
      
    if @client.save
      flash[:success] = 'Success'
      redirect_to clients_path
    else
      flash[:error] = 'Error'
      render :new
    end
  end

  def update
    @client = Client.find(params[:id])

    if @client.update(client_params)
      flash[:success] = 'Success'
      redirect_to clients_path
    else
      flash[:error] = 'Error'
      render :edit
    end
  end

  def destroy
    @client = Client.find(params[:id])

    if @client.destroy
      flash[:success] = 'Success'
      redirect_to clients_path
    else
      flash[:error] = 'Error'
    end
  end

  private

  def client_params
    params.require(:client).permit(:first_name, :last_name, :email, :phone)
  end
end
