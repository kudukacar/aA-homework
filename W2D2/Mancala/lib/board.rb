require_relative 'player'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @mancala = Mancala.new(name1, name2)
    @mancala.play
    @cups = Array.new(13) {Array.new(4, :stone)}
  end

  def place_stones
    (0..5).each do |i|
      self.cups[i] = 4
    end
    (7..12).each do |j|
      self.cups[j] = 4
    end 
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 13
    raise 'Starting cup is empty' if self.cups[start_pos].empty?
    !self.cups[start_pos].empty? || start_pos < 14 
  end

  def make_move(start_pos, current_player_name)
    until self.cups[start_pos].empty?
      ((start_pos + 1) % 13..(start_pos + 13) % 13).each do |i|
        if current_player_name.side == 1
          self.cups[i] << self.cups[start_pos].shift unless i == 13
        else
          self.cups[i] << self.cups[start_pos].shift unless i == 6
        end
      end
    end 
    self.render
    next_turn(i)

  end

  def next_turn(ending_cup_idx)
    if (current_player_name.side == 1 && ending_cup_idx == 6) || (current_player_name.side == 2 && ending_cup_idx == 13)
      :prompt
    elsif self.cups[ending_cup_idx.empty?]
      :switch
    else
      ending_cup_idx
    end
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?

    (0..5).each do |i|
      return false if !self.cups[i].empty?
    end
    (7..12).each do |j|
      return false if !self.cups[j].empty?
    end

    true
  end

  def winner
    if one_side_empty? && self.cups[6] == self.cups[13] 
        return :draw
    elsif one_side_empty? && self.cups[6] > self.cups[13]
        return current_player_name.side == 1
  end
end
