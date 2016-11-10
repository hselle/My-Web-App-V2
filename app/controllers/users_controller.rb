class UsersController < ApplicationController
    
    
    def user_params
        params.require(:user).permit(:username, :password, :wins, :losses)
    end

    
    def show
        
    end
    
    def create

    end
    
    def index
        
    end
    
    def destroy
        
    end

end
