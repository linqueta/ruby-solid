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

# Outro exemplo

class Api::V1::AuthorizationHandler
  def authorize
    authorize! && make_session!
  end
end

class Api::V2::AuthorizationHandler < Api::V1::AuthorizationHandler
  def version?
    @version == 2
  end

  def authorize
    version? && authorize! && make_session!
  end
end

class Api::V3::AuthorizationHandler < Api::V2::AuthorizationHandler
  def version?
    @version == 3
  end
end


# Aqui nesse exemplo já é mais interessante que começamos com o a classe da V1 somente autorizando o usuário e criando a sessão.
# Já na V2, também fazemos um check na versão e alteramos o comportamento do authorize, mas de forma que ele continue funcionando da
# mesma maneira para quem o chama
# Finalizando, na V3, herdamos da V2 e passamos a validar se é a versão 3 no método version?, pois como o authroize já foi herdado da V2,
# já se existe o comportamento de checar a versão antes de autorizar e criar a sessão