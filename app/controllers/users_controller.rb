class UsersController < ApplicationController
    
    
    def user_params
        params.require(:user).permit(:username, :password, :wins, :losses)
    end

    def register
      
    end
    
    def show
        
    end
    
    def create
        newUser = User.create!(username: params[:username], password: params[:password])
        redirect_to "/users"
    end
    
    def index
        
    end
    
    def destroy
        
    end

end
