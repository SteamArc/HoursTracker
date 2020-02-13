class SessionsController < ApplicationController
    
    def new
        @clients = Client.all
        @session = Session.new
    end
    
    def create
        @session = Session.create(session_params)
        @session.user_id = current_user.id
        if @session.save
            redirect_to @session
        else
            puts @session.errors
        end
    end
    
    def edit
        @session = Session.find(params[:id])
        @clients = Client.all
        
    end
    
    def results
        @sessions = Session.where(client_id: :client)
    end
    
    def search
    end
    
    def update
        @session = Session.find(params[:id])
        @session.update(session_params)
        if @session.save
            redirect_to @session 
        end
    end
    
    def destroy
        deleteme = Session.find(params[:id])
        deleteme.destroy
        redirect_to "/sessions"
    end
    
    def show
        @session = Session.find(params[:id])
    end
    
    def index
        @sessions = Session.all
        @clients = Client.all
    end
    
    private
    def session_params
        params.require(:session).permit(:date, :hours, :client_id, :description)
    end
end