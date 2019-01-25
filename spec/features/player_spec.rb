require 'player'

describe Player do

  subject(:will) { Player.new('Will') }
  subject(:mittens) { Player.new('Mittens') }

  describe '#name' do
    it 'returns the name' do
      expect(will.name).to eq 'Will'
    end
  end

  describe '#hit_points' do
    it 'returns the hit points' do
      expect(will.hit_points).to eq described_class::DEFAULT_HIT_POINTS
    end
  end

  describe '#attack' do
    it 'damages the player' do
      expect(mittens).to receive(:receive_damage)
      will.attack(mittens)
    end
  end

  describe '#receive_damage' do
    it 'reduces the player hit points' do
      expect { will.receive_damage }.to change { will.hit_points }.by(-10)
    end
  end

end
