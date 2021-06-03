class Freight
  def self.quote!(zipcode)
    data = ViaCep.find(zipcode)

    calculate_freight(data['address'])
  end
end

# Eis que o response do método ViaCep#find muda para um hash simbolizado:

class ViaCep
  # ...

  def self.find(zipcode)
    {
      address: {
        # ...
      }
    }
  end

  #...
end

# Ao chamar o Freight#quote vamos passar um endereço nulo, já que agora o Hash é simbolizado.
# Assim, ferimos o princípio de inversão de dependencia, onde detalhes da implementação de um módulo intefere no outro