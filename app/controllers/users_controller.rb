
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
        # artist = 'D.R.A.M.'
        # song = 'broccoli'
        # key = '159f7589d4e9ee7d513581b74a5e69b8'
        # uri = URI.parse("https://api.musixmatch.com/ws/1.1/track.search?format=json&q_artist=#{artist}&q_track=#{song}&quorum_factor=1&apikey=#{key}")
        # track_id_response = Net::HTTP.get_response(uri)
        # # print response.body
        # parsed_json = JSON.parse(track_id_response.body)
        # track_id = parsed_json['message']['body']['track_list'][0]['track']['track_id']
        # uri = URI.parse("https://api.musixmatch.com/ws/1.1/track.lyrics.get?format=json&apikey=#{key}&track_id=#{track_id}")
        # lyrics_response = Net::HTTP.get_response(uri)
        # parsed_json = JSON.parse(lyrics_response.body)
        # @lyrics = parsed_json['message']['body']['lyrics']['lyrics_body']
        
        # # print response

        #  #if session[:username].exists
        #  #id =params[:id]
        #  #@user = User.find(id)
        # voice = VoiceRSS.speech({
        #     'key' => 'a0ce51728bfb415f9423a6b9851ca4bc',
        #     'hl' => 'en-us',
        #     'src' => @lyrics,
        #     'r' => '0',
        #     'c' => 'mp3',
        #     'f' => '44khz_16bit_stereo',
        #     'ssml' => 'false',
        #     'b64' => 'true'
        # })
        # @sound_string = voice['response']
        
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
