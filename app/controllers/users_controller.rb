class UsersController < ApplicationController
    
    
    def user_params
        params.require(:user).permit(:username, :password, :wins, :losses)
    end

    def register
      
    end
    
    def show
        
    end
    
    def create
        flash[:notice] = "Username already taken."
        begin
            @user = User.create!(username: params[:username], pasword: params[:password])
            redirect_to "/users"
        rescue ActiveRecord::RecordInvalid
            flash[:notice] = "Username already taken."
            redirect_to "/register"
        end
        
    end
    
    def index

    end
    
    def destroy
        
    end

end
