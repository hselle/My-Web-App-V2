class GameController < ApplicationController

  def game_params
    params.require(:game).permit(:users, :songs, :winner, :loser, :genre, :start_time, :end_time)
  end

  def get_song
    require 'soundcloud'

    # create a client object with your app credentials
    client = Soundcloud.new(:client_id => 'YOUR_CLIENT_ID')

    # fetch track to stream
    track = client.get('/tracks/293')

    # get the tracks streaming URL
    stream_url = client.get(track.stream_url, :allow_redirects => true)

    # print the tracks stream URL
    puts stream_url.location  
  end
  

end