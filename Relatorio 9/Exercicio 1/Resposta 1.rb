class CoquetelAfterlife
  attr_reader :nome

  def initialize(nome, preco)
    @nome = nome
    self.preco = preco
  end

  def preco
    @preco
  end

  def preco=(valor)
    if valor >= 5 && valor <= 200
      @preco = valor
    else
      puts "Preço inválido!"
    end
  end

  def ficha
    "Drink: #{@nome} | Preço: R$ #{@preco}"
  end
end

class DrinkDeLenda < CoquetelAfterlife
  attr_reader :lenda

  def initialize(nome, preco, lenda)
    super(nome, preco)
    @lenda = lenda
  end

  def ficha
    "#{super} | Homenagem a: #{@lenda}"
  end
end

drinks = [
  CoquetelAfterlife.new("Night City", 35),
  DrinkDeLenda.new("Johnny Silverhand", 80, "Johnny Silverhand"),
  DrinkDeLenda.new("Jackie Welles", 65, "Jackie Welles")
]

drinks.each do |drink|
  puts drink.ficha
end

puts "\nTentando alterar os preços:"

# 500 é inválido. O preço anterior é mantido.
drinks[1].preco = 500
puts drinks[1].ficha

# 80 é válido. Atualiza o preço.
drinks[1].preco = 80
puts drinks[1].ficha

# Esta linha gera erro porque nome não possui setter.
# drinks[0].nome = "Novo nome"
