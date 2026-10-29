class FichaDeCriatura {
  constructor(criatura, nivelDePerigo) {
    this.criatura = criatura;
    this.nivelDePerigo = nivelDePerigo;
  }

  descrever() {
    return `Criatura: ${this.criatura} | Nível de perigo: ${this.nivelDePerigo}`;
  }
}

class DiarioMisterioso {
  #fichas;

  constructor(numero) {
    this.numero = numero;
    this.#fichas = [];
  }

  anotar(criatura, nivelDePerigo) {
    const ficha = new FichaDeCriatura(criatura, nivelDePerigo);
    this.#fichas.push(ficha);
  }

  exibirFichas() {
    console.log(`Diário número ${this.numero}:`);

    this.#fichas.forEach(ficha => {
      console.log(ficha.descrever());
    });
  }
}

class Funcionario {
  constructor(nome, cargo) {
    this.nome = nome;
    this.cargo = cargo;
  }
}

class CabanaDoMisterio {
  #funcionarios;

  constructor(dono) {
    this.dono = dono;
    this.#funcionarios = [];
  }

  contratar(funcionario) {
    this.#funcionarios.push(funcionario);
  }

  abrirAsPortas() {
    console.log(`A Cabana do Mistério está aberta! Dono: ${this.dono}`);

    this.#funcionarios.forEach(funcionario => {
      console.log(`${funcionario.nome} - ${funcionario.cargo}`);
    });
  }
}

// Main
const diario = new DiarioMisterioso(3);

diario.anotar("Gnomos", 3);
diario.anotar("Bebê de Duas Cabeças", 5);
diario.anotar("Bill Cipher", 10);

diario.exibirFichas();

// Os funcionários existem antes da cabana.
const dipper = new Funcionario("Dipper Pines", "Pesquisador");
const mabel = new Funcionario("Mabel Pines", "Atendente");

const cabana = new CabanaDoMisterio("Stan Pines");

cabana.contratar(dipper);
cabana.contratar(mabel);

console.log();
cabana.abrirAsPortas();
