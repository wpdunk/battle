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
    session[:p2_hp] = Player::DEFAULT_HIT_POINTS
    redirect '/play'
  end

  get '/play' do
    # @player_1_name = session[:player_1_name]
    @player_1_name = $player_1.name
    # @player_2_name = session[:player_2_name]
    @player_2_name = $player_2.name
    @p1_hp = $player_1.hit_points
    @p2_hp = $player_2.hit_points
    erb :play
  end

  get '/attack' do
    @player_1 = $player_1
    @player_2 = $player_2
    Game.new.attack(@player_2)
    erb :attack
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
