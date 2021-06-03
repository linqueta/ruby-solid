
class A
  def do
    puts 'DONE'
  end
end

class B < A; end

class C < B; end

# Atende o princípio de substituição de Liskov pois C implementa o método do definido na classe A, onde C herda de B
# e B herda de A.
# A -> B -> C == A -> C

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

class Painter < Cutter; end

Painter.new.cut
# I know how to cut better

