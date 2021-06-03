class Freight
  def self.quote!(zipcode)
    data = ZipCode.find(zipcode)

    calculate_freight(data['address'])
  end
end

class ZipCode
  def self.find(number)
    ViaCep.find(number)
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

# Então, alteramos a camada anti corrupcão, ou ACL para não termos um side effect nos models que usam o ZipCode

class ZipCode
  def self.find(number)
    ViaCep.find(number).deep_stringify_keys
  end
end


# Dessa forma, garantimos que todos os modulos que chamam o ZipCode continuaram funcionando normalmente, sendo assim,
# atendemos os requisitos do princípio de inversão de dependencia.