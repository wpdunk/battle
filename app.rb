require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions

  # def initialize
  #   @hp = 100
  # end

  get '/' do
    'Testing infrastructure working!'
    erb :index
  end

  post '/names' do
    session[:player_1_name] = params[:player_1_name]
    session[:player_2_name] = params[:player_2_name]
    session[:p2_hp] = 100
    redirect '/play'
  end

  get '/play' do
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    @p2_hp = session[:p2_hp]
    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
