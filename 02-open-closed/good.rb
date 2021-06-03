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
  def paint
    puts 'I know how to paint better'
  end
end

# Como sabemos que todos os funcinários sabem cortar, esperamos que todas as gerações saibam cortar,
# porém, a classe Painter sabe pintar além de cortar. Dessa forma, contemplamos o princípio Open-Closed,
# onde extendemos os comportamentos da classe Worker sem modifica-la.
