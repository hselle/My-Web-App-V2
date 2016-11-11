
# require_relative 'voicers_tts'
class UsersController < ApplicationController
    # include ESpeak
    # require 'rubygems'
    # require 'espeak-ruby'
    # include ESpeak
        
    def user_params
        params.require(:user).permit(:username, :password, :wins, :losses)
    end

    def login
      #puts params[:login_username]
      #puts params[:login_password]
      @user = User.find_by_username(params[:login_username])
      if @user == nil 
          flash[:notice] = "Invalid username or password"
          flash.keep(:notice)
          redirect_to users_path
      else
          if params[:login_password] == @user.pasword
            session[:username] = @user.username
             #puts @user
              redirect_to user_path(@user)
          else
              flash[:notice] = "Invalid username or password"
              flash.keep(:notice)
              redirect_to users_path
          end
      end
    end
    
    def show
        id = params[:id]
         @user = User.find(id)
        
    end
    
    def create
        begin
            user = User.create!(username: params[:username], pasword: params[:password])
            # speech = Speech.new("READY TO HEAR RAP OVERLY ARTICULATED?")
            # speech.speak
            @user = User.find_by_username(params[:username])
            redirect_to user_path(@user)
            
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
