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

# Como sabemos que todos os funcinários sabem cortar, esperamos que todas as gerações saibam cortar, assim em outras palavras,
# fere o princípio de Open-Closed pois foi modificado o comportamento cut da classe Worker na classe Painter, fazendo que ela não
# saiba mais cortar
