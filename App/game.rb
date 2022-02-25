# frozen_string_literal: true

# This is the class Game
class Game
  @@array_score = []
  @@scores = []
  @@total_score = 0

  
  def initialize(bol1, bol2, cont)
    @bol1 = bol1
    @bol2 = bol2
    @score = bol1 + bol2
    @cont = cont
  end

  def guardar_datos
    temp = @bol1, @bol2 
    @@array_score.push(temp)
    @@scores.push(@bol1 + @bol2)
  end
  # def info() #Este podria recorrer un array de arrays donde se obtengan los datos de la partida
  #   
  #   temp = @bol1, @bol2 
  #   @@array_score.push(temp)
  #   @@scores.push(@bol1 + @bol2)
  #   puts "Attemp #{@cont}"
  #   puts "TIRO 1: #{@bol1}"
  #   puts "TIRO 2: #{@bol2}"
  #   puts "Puntuacion: #{@bol1 + @bol2}" #obtener el final score
  #   print @@scores
  #   puts ''
  # end

  # def info_v2(array_score)

  #   array_score.each do |partida|
  #     print @@scores
  #     puts
  #     bol1, bol2 = partida
  #     if(@cont == 1)
  #       total = bol1 + bol2  
  #     else 
  #       total = (bol1 + bol2)
  #     end
  #     puts "Attemp #{@cont}"
  #     puts "TIRO 1: #{bol1}"
  #     puts "TIRO 2: #{bol2}"
  #     puts "Puntuacion: #{total}" #obtener el final score
  #   end
  # end

  # def info_v3()
  #   regla = Rules.new(@@total_score)
  #   if(@cont == 1)
  #     @@total_score = @bol1 + @bol2
  #   else
  #     @@total_score += @bol1 + @bol2
  #   end
  #   # if(regla.semipleno?(@bol1, @bol2))
  #   #   ##gurda cont,bol1, bol2 para no perder la pista
  #   #   puts "Attemp #{@cont}"
  #   #   puts "TIRO 1: #{@bol1}"
  #   #   puts "TIRO 2: #{@bol2}"
  #   #   @@total_score += @bol1 + @bol2
  #   #   puts "Puntuacion: / }" #obtener el final score

  #     ##Aqui es donde tiene que esperarse para sumar el tiro futuro
  #     ##si no es semipleno, continua? o es strike?

  #     puts "Attemp #{@cont}"
  #     puts "TIRO 1: #{@bol1}"
  #     puts "TIRO 2: #{@bol2}"
  #     puts "Puntuacion: #{@@total_score}" #obtener el final score
  #     print @@scores
  #     puts ''
  # end

  def info_v4(array_score)
    regla = Rules.new(array_score)
    @@total_score = 0
    @@num_partida = 1
    
    array_score.each do |partida|
      flag = false
      puts
      print "Scores: #{@@scores}"
      puts 
      print "Esta es la partida: #{partida}"
      puts
      bol1, bol2 = partida
      ant1, ant2 = array_score[@@num_partida-1]
      if(regla.semipleno?(ant1,ant2))
        flag = true
      if(@cont == 1)
        puts "PRIMERA PARTIDA"
        @@total_score = @@scores[@@num_partida-1]
      else 
        # @@total_score += @@scores[@@num_partida-1]
        if(regla.strike?(bol1))
          puts "STRIKEEEE!!!"
          @@total_score = @@total_score + (@@scores[@@num_partida-1] + 10)
          
        elsif(regla.semipleno?(bol1,bol2) 
          puts "SEMIPLENOOO!!!"
          @@total_score =  @@total_score + (@@scores[@@num_partida-1] + bol1)
          if (flag == true)
            @@total_score += bol1
        else
          puts "PARTIDA NORMAL!!!!"
          @@total_score += @@scores[@@num_partida-1]
        end
      end
      puts
      puts "Intento #{@@num_partida}"
      puts "TIRO 1: #{bol1}"
      puts "TIRO 2: #{bol2}"
      puts "Puntuacion: #{@@total_score}" #obtener el final score
      @@num_partida += 1
      @cont += 1
    end
  end

  def obtener()
    @@array_score
  end
  # def sumar(array_score)
  # 
  # end

  # rules = Rules.new(@@array_score)
end
