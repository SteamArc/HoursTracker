class UsersController < ApplicationController
    
    def new
        
    end
    
    def show
        @user = User.find(params[:id])
        @sessions = Session.where(user_id: params[:id])
    end
    
    def create
    end
    
    def destroy
    end
    
    def index
        @users = User.all
    end
    
end