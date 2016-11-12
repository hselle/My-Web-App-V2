
# require_relative 'voicers_tts'
class UsersController < ApplicationController
    # include ESpeak
    # require 'rubygems'
    # require 'espeak-ruby'
    # include ESpeak
    require_relative 'voicerss_tts'
    
    
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
        # voice = VoiceRSS.speech({
        #     'key' => 'a0ce51728bfb415f9423a6b9851ca4bc',
        #     'hl' => 'en-us',
        #     'src' => "How could a bitch so bad pussy be so good? (So good)
        #                 How could a million dollar nigga be so hood? It\'s dolph
        #                 All that ass she got that\'s why she walk like that, yeah
        #                 All this cash I got that\'s why I talk like that!
        #                 Balmain and margielas what I\'m rocking",
        #     'r' => '0',
        #     'c' => 'mp3',
        #     'f' => '44khz_16bit_stereo',
        #     'ssml' => 'false',
        #     'b64' => 'true'
        # })
        # @response = voice['response']
        # puts @response
         #if session[:username].exists
         #id =params[:id]
         #@user = User.find(id)
         
         #else
         #redirect_to index
        
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
    
    def logout
        session.clear
        redirect_to "/users"
    end


end
