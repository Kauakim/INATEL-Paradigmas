# Módulo Depoente: Define o comportamento de quem pode depor.
module Depoente
  def depor
    raise NotImplementedError, "O método depor deve ser implementado"
  end
end

# Módulo Detivel: Fornece a implementação de quem pode ser detido.
module Detivel
  def ser_detido
    puts "#{nome} foi levado pela Scotland Yard."
  end
end

# Classe base para todos os envolvidos na investigação.
class Envolvido
  attr_reader :nome

  def initialize(nome)
    @nome = nome
  end
end

# Testemunha herda de Envolvido e inclui o módulo Depoente.
class TestemunhaOcular < Envolvido
  include Depoente

  def depor
    puts "#{nome}: Eu vi o suspeito saindo do local do crime."
  end
end

# Suspeito herda de Envolvido e inclui os dois módulos.
class SuspeitoDoCrime < Envolvido
  include Depoente
  include Detivel

  def initialize(nome, alibi)
    super(nome)
    @_alibi = alibi
  end

  def depor
    puts "#{nome}: Meu álibi é: #{@_alibi}."
  end
end

class Investigacao
  attr_reader :_caso, :_envolvidos

  def initialize(caso)
    @_caso = caso
    @_envolvidos = []
  end

  def registrar(envolvido)
    @_envolvidos << envolvido
  end

  def ouvir_todos
    puts "Caso: #{@_caso}"

    @_envolvidos.each do |envolvido|
      envolvido.depor
    end
  end

  def acionar_scotland_yard
    detidos = @_envolvidos.select do |envolvido|
      envolvido.respond_to?(:ser_detido)
    end

    detidos.each do |envolvido|
      envolvido.ser_detido
    end
  end
end

# Main
testemunha = TestemunhaOcular.new("John Watson")
suspeito1 = SuspeitoDoCrime.new("James Moriarty", "Estava em casa")
suspeito2 = SuspeitoDoCrime.new("Irene Adler", "Estava em um jantar")

investigacao = Investigacao.new("O roubo dos documentos")

investigacao.registrar(testemunha)
investigacao.registrar(suspeito1)
investigacao.registrar(suspeito2)

investigacao.ouvir_todos

puts "\nAcionando a Scotland Yard:"
investigacao.acionar_scotland_yard
