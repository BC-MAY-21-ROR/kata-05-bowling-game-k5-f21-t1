# frozen_string_literal: true

# This is the class Game
class Game
  @@array_score = []

  def initialize(bol1, bol2, cont)
    @bol1 = bol1
    @bol2 = bol2
    @score = bol1 + bol2
    @cont = cont
  end

  def info
    @cont += 1
    puts "Attemp #{@cont}"
    puts "TIRO 1: #{@bol1}"
    puts "TIRO 2: #{@bol2}"
    puts "PUNTOS: #{@score}"
    temp = @bol1, @bol2, @score
    @@array_score.push(temp)
    print @@array_score
    puts ''
  end

  # rules = Rules.new(@@array_score)
end
