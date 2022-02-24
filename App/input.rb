# frozen_string_literal: true

# ( ͡° ͜ʖ ͡°)
$LOAD_PATH.unshift '.'
require 'game'

# Class Input
class Input
  def inputs
    cont = 0
    while cont < 10 && gets.chomp.empty?
      puts 'Press a key for throw: '
      bol1 = rand(0..10)
      bol2 = bol1 == 10 ? 0 : rand(0..(10 - bol1))
      datos = Game.new(bol1, bol2, cont)
      datos.info
      cont += 1
    end
  end
end

input = Input.new
input.inputs
