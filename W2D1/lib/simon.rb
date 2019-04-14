class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    game_over = false
    seq = []
  end

  def play
    self.take_turn until game_over == true
    self.game_over_message
    self.reset_game
  end

  def take_turn
    if game_over == false
      self.show_sequence
      self.require_sequence
      self.round_success_message
      1sequence_length += 1
    end

  end

  def show_sequence
    self.add_random_color
  end

  def require_sequence
    puts "Repeat color sequence one color at a time"
  end

  def add_random_color
    seq << COLORS.sample

  end

  def round_success_message
    puts "Success!"
  end

  def game_over_message
    puts "Game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
