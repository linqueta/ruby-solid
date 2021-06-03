
class A
  def do
    puts 'DONE'
  end
end

class B < A; end

class C < B
  def do
    raise NoMethodError
  end
end

# Isso fere o principio de substituição de Liskov pois, por transitividade, se B herda de A e C herda de B, logo C deveria
# ter todos os métodos de A  # A -> B -> C == A -> C

# ------------------------------------ #

class Worker
  def cut
    puts 'I know how to cut things'
  end
end

class Cutter < Worker
  def cut
    puts 'I know how to cut better'
  end
end

class Painter < Cutter
  def cut
    raise NoMethodError
  end

  def paint
    puts 'I know how to paint better'
  end
end

Painter.new.cut
# => NoMethodError

