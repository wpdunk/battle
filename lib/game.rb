class Game

  attr_reader :current_turn

  def initialize(p1, p2)
    @players = [p1, p2]
    @current_turn = p1
  end

  def p1
    @players.first
  end

  def p2
    @players.last
  end

  # def attack(player)
  #   player.receive_damage
  # end

  def switch_turns
    @current_turn = opponent_of(current_turn)
  end



  def opponent_of(the_player)
    @players.select { |player| player != the_player }.first
  end

  private

end
