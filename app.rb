require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

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
    # $player_1 = Player.new(params[:player_1_name])
    # session[:player_2_name] = params[:player_2_name]
    # $player_2 = Player.new(params[:player_2_name])
    $game = Game.new(Player.new(params[:player_1_name]), Player.new(params[:player_2_name]))
    # session[:p2_hp] = Player::DEFAULT_HIT_POINTS
    redirect '/play'
  end

  get '/play' do
    # @player_1_name = session[:player_1_name]
    @player_1_name = $game.p1.name
    # @player_2_name = session[:player_2_name]
    @player_2_name = $game.p2.name
    @p1_hp = $game.p1.hit_points
    @p2_hp = $game.p2.hit_points
    erb :play
  end

  get '/attack' do
    @player_1 = $game.p1
    @player_2 = $game.p2
    $game.attack(@player_2)
    erb :attack
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
