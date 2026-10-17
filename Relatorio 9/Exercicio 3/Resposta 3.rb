class PhoneWave
  def enviar_dmail(mensagem)
    puts "Mensagem enviada para o passado: #{mensagem}"
  end
end

class MembroDoLab
  attr_reader :numero, :nome

  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end

class LaboratorioDeGadgets
  def initialize
    # Composição: PhoneWave é criado dentro do laboratório e armazenado como parte dele.
    @_phonewave = PhoneWave.new

    # Agregação: Laboratório mantém referências a membros que já existiam antes de serem adicionados.
    @_membros = []
  end

  def admitir(membro)
    @_membros << membro
    puts "Membro #{membro.numero}: #{membro.nome} admitido."
  end

  def experimento(mensagem)
    puts "Iniciando experimento..."

    @_membros.each do |membro|
      puts "Presente: #{membro.numero} - #{membro.nome}"
    end

    @_phonewave.enviar_dmail(mensagem)
  end
end

okabe = MembroDoLab.new(1, "Okabe Rintaro")
kurisu = MembroDoLab.new(2, "Makise Kurisu")

laboratorio = LaboratorioDeGadgets.new

laboratorio.admitir(okabe)
laboratorio.admitir(kurisu)

laboratorio.experimento("O experimento foi um sucesso!")
