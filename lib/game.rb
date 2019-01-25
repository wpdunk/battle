class Game

  def initialize(p1, p2)
    @players = [p1, p2]
  end

  def p1
    @players.first
  end

  def p2
    @players.last
  end

  def attack(player)
    player.receive_damage
  end
end
