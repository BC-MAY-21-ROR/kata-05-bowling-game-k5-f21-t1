# frozen_string_literal: true

# ( ͡° ͜ʖ ͡°)
$LOAD_PATH.unshift '.'
require 'game'
require 'rules'

# Class Input
class Input

  def start
    cont = 0
    temp = []
    while cont < 10 && gets.chomp.empty?
      cont += 1
      puts 'Press a key for throw: '
      bol1 = rand(0..10)
      bol2 = bol1 == 10 ? 0 : rand(0..(10 - bol1))
      datos = Game.new(bol1, bol2, cont)
      datos.guardar_datos
      temp = datos.obtener #Array_score
      puts "\e[H\e[2J" ##ELIMINA TODO LOS DATOS DE LA CONSOLA
      datos.info_v4(temp)

    end
    
    rule = Rules.new(temp)
    rule.calculate_score(temp)
  end
end

input = Input.new
input.start
