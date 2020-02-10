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
    
    def destroy
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