class Worker
  attr_accessor :name

  def cut
    raise NotImplementedError
  end

  def paint
    raise NotImplementedError
  end
end

class Painter < Worker
  def paint
    puts 'I know how to paint better'
  end
end

# Ruby não tem interfaces, mas simulando isso de alguma maneira, temos que é um pintor (Painter) "obrigado" a saber cortar
# somente por ser um trabalhador (Worker), assim ferindo o princípio Interface Segregation