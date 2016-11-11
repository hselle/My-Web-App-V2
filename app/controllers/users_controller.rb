class UsersController < ApplicationController
    # include ESpeak

    
    def user_params
        params.require(:user).permit(:username, :password, :wins, :losses)
    end

    def register
      
    end
    
    def show
        
    end
    
    def create
        begin
            @user = User.create!(username: params[:username], pasword: params[:password])
            # speech = Speech.new("READY TO HEAR RAP OVERLY ARTICULATED?")
            # speech.speak
            redirect_to "/users/1"
            
        rescue ActiveRecord::RecordInvalid
            flash[:notice] = "Username already exists."
            render "index"
        end
    end
    
    def index
        
    end
    
    def destroy
        
    end

end
