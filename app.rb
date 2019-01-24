require 'sinatra/base'
require 'player'

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
    # session[:player_1_name] = params[:player_1_name]
    $player_1 = Player.new(params[:player_1_name])
    # session[:player_2_name] = params[:player_2_name]
    $player_2 = Player.new(params[:player_2_name])
    session[:p2_hp] = 100
    redirect '/play'
  end

  get '/play' do
    # @player_1_name = session[:player_1_name]
    @player_1_name = $player_1.name
    # @player_2_name = session[:player_2_name]
    @player_2_name = $player_2.name
    @p2_hp = session[:p2_hp]
    erb :play
  end

  get '/attack' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    erb :attack
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
