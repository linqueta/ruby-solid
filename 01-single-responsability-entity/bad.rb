class ZipCode
  # ...

  def self.find!(number)
    ViaCep
      .find(number)
      .then { |data| new(data.slice(:street, :country, :zipcode, ...)) }
  end

  def self.calculate_freight(number)
    Intelipost
      .calculate(number, ...)
      .as_json(only: %i[value estatimate_days])
  end

  # ...
end

# Para buscar os dados de um CEP usamos:
ZipCode.find!("04571090")

# Para calcular um frete usamos:
ZipCode.calculate_freight("04571090")

# É ruim pois a classe zipcode não tem a responsabilidade de cotar o frete, e sim de somente representar a entidade
# de frete e como buscar os dados do mesmo.
