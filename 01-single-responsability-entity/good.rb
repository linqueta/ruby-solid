class ZipCode
  # ...

  def self.find!(number)
    ViaCep
      .find(number)
      .then { |data| new(data.slice(:street, :country, :zipcode, ...)) }
  end

  # ...
end

class Freight
  # ...

  def self.calculate(zipcode)
    Intelipost
      .calculate(zipcode.number, ...)
      .as_json(only: %i[value estatimate_days])
  end

  # ...
end

# Para buscar os dados de um CEP usamos:
ZipCode.find!("04571090")

# Para calcular um frete usamos:
Freight.calculate(ZipCode.new(number: "04571090"))

# É bom pois agora ZipCode só se compromente com os métodos e comportamentos referentes ao CEP, já a class Freight
# usa um zipcode para realizar a cotação através do método calculate
