# frozen_string_literal: true

# This is the class Rules
class Rules
  def initialize(array_score)
    @array_score = array_score
  end

  def semipleno?(bol1, bol2)
    bol1 + bol2 == 10
  end

  def strike?(bol1)
    bol1 == 10
  end

  def regular_game?(bol1, bol2) 
    bol1 + bol2 != 10
  end

  # Cuadro 1: [1, 4, 5] cont 1 + 4 = 5 -> jugada normal
  # Cuadro 2: [4, 5, 14] cont 5 + 4 + 5 = 14 -> jugada normal
  # Cuadro 3: [6, /, 29] cont 14 + 6 + 4 + 5 = 29 -> semipleno
  # Cuadro 4: [5, /, 49] cont 29 + 5 + 5 + 10 = 49 -> semipleno
  # Cuadro 5: [x, 0, 60] cont 49 + 10 + 0 + 1 = 60 -> strike
  # cuadro 6: [0, 1, 61] cont 60 + 0 + 1 = 61 -> jugada normal
  # cuadro 7: [7, /, 77] cont 61 + 7 + 3 + 6 = 77 -> semipleno
  # cuadro 8: [6 , /, 97] cont 77 + 6 + 4 + 0 = 97 -> semipleno
  # cuadro 9: [0 , x, 117] cont 97 + 0 + 10 + 2 = 117 -> semipleno

  # cuadro 10:[2 , /, 6, 133] cont 117 + 2 + 8 + (6) = 133 -> semipleno + (bonus)

  def calculate_score(array_score) # Caso 1 al 10
    print "Este es array score: #{array_score}" 
    puts
    final_score = 0
    index = 0
    array_score.each do |cuadro|
      index += 1
      elem1, elem2 = cuadro
      if(index == 10) # Ultima Jugada
        if(regular_game?(elem1, elem2))
          final_score += (elem1 + elem2)
        end
      elsif(regular_game?(elem1, elem2)) # Jugada normal
        final_score += (elem1 + elem2)
        # puts final_score
        # 0 2 = |2| -> enviar contador se necesita imprir en la tabla informativa
        # 0 4 = |6| -> enviar contador
        # 4 3 = |13| <-

      # elsif(semipleno?(elem1, elem2)) # jugada semipleno o strike
      #   final_score = ele1 + elem2 + elemfuturo(otrocuadro)

      end
    end
    puts final_score
      #print cuadro[1]

      # if(final_score == 10) # Ultima Jugada
      #   # bonus() #nice dick bro mhh :9
      
      # elsif(regular_game?(cuadro[0], cuadro[1])) # Jugada normal
      #   final_score += (cuadro[0] + cuadro[1])
      #   # puts final_score
      #   # 0 2 = |2| -> enviar contador se necesita imprir en la tabla informativa
      #   # 0 4 = |6| -> enviar contador
      #   # 4 3 = |13| <-

      # # elsif(semipleno?(cuadro[0], cuadro[1])) # jugada semipleno o strike
      # #   cont = cuadro[0] + cuadro[1] + cuadro[0]

      # # end

      # # elsif(strike?(cuadro[0], cuadro[1]))
      # #   cont = cuadro[0] + cuadro[1] + cuadro[0] + cuadro[1]

      # end
  end
end
  
  # def bonus(array_score,num1) # CASO PARA CASILLA 10 chales :,(
  #   case bonus
  #   if Rules.semipleno?(array_score[0], array_score[2])
      
  #   # if(posicionArray == 10)
  #   # when 1
  #   #   @score[num1 - 1] += bol1
  #   # when 2
  #   #   @score[num1 - 1] += bol1 + bol2
  #   # when 3
  #   #   @score[num1 - 1] += 
  #  end

