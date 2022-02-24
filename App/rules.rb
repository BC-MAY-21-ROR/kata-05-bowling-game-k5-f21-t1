# frozen_string_literal: true

# This is the class Rules
class Rules
  def initialize(array_score)
    @array_score = array_score
  end

  def semipleno?(bol1, bol2)
    bol1 + bol2 == 10
  end

  def strike?(bol1, _bol2)
    bol1 == 10
  end
end
