class Worker
  attr_accessor :name
end

module PaintSkills
  def paint
    raise NotImplementedError
  end
end

module CutSkills
  def cut
    raise NotImplementedError
  end
end

class Painter < Worker
  include PaintSkills

  def paint
    puts 'I know how to paint better'
  end
end

# Agora, simulando uma interface ou algo do tipo em Ruby, temos que o pintor é um trabalhador e implementa o método paint
# através do module PaintSkills que foi incluído via mixin, assim, respeitamos que um cliente externo não é obrigado a
# implementar todos os comportamentos (métodos), e sim somente os que fazem sentido apra ele.