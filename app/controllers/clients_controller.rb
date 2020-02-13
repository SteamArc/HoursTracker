class ClientsController < ApplicationController
    
    def new
        @client = Client.new
    end
    
    def create
        @client = Client.create(client_params)
        if @client.save
            redirect_to @client
        end
    end
    
    def show 
        @client = Client.find(params[:id])
        @sessions = Session.where(client_id: params[:id])
    end
    
    def destroy
        client = Client.find(params[:id])
        client.destroy
        redirect_to "/clients"
    end
    
    def edit
        @client = Client.find(params[:id])
    end
    
    def update
        @client = Client.find(params[:id])
        @client.update(client_params)
        if @client.save
            redirect_to "/clients" 
        end
    end
    
    def index
        @clients = Client.all
    end
    
    private
    
    def client_params
          params.require(:client).permit(:name, :description)
        
        
    end
    
end