class Pistola {
  constructor(modelo) {
    this.modelo = modelo;
  }
}

class AgenteProtocolo {
  #pistola;

  constructor(codinome, modeloDaPistola) {
    this.codinome = codinome;
    this.#pistola = new Pistola(modeloDaPistola);
  }

  usarHabilidade() {
    throw new Error("O agente deve implementar sua habilidade.");
  }

  entrarEmCombate() {
    console.log(`Agente: ${this.codinome}`);
    console.log(`Pistola: ${this.#pistola.modelo}`);
    console.log(`Habilidade: ${this.usarHabilidade()}`);
  }
}

class Controlador extends AgenteProtocolo {
  usarHabilidade() {
    return "Bloqueia a visão dos inimigos com fumaças.";
  }
}

class Iniciador extends AgenteProtocolo {
  usarHabilidade() {
    return "Revela a posição dos inimigos.";
  }
}

class Duelista extends AgenteProtocolo {
  usarHabilidade() {
    return "Avança para eliminar os adversários.";
  }
}

class Esquadrao {
  #agentes;

  constructor(nome, agentes) {
    this.nome = nome;
    this.#agentes = agentes;
  }

  iniciarPartida() {
    console.log(`Esquadrão ${this.nome} iniciando a partida:\n`);
    this.#agentes.forEach(agente => {
      agente.entrarEmCombate();
      console.log("--------------------");
    });
  }

  listarControladores() {
    return this.#agentes.filter(
      agente => agente instanceof Controlador
    );
  }
}

// Main
const controlador1 = new Controlador("Omen", "Ghost");
const controlador2 = new Controlador("Brimstone", "Sheriff");
const iniciador = new Iniciador("Sova", "Classic");
const duelista = new Duelista("Jett", "Frenzy");

const esquadrao = new Esquadrao("Alpha", [
  controlador1,
  controlador2,
  iniciador,
  duelista
]);

esquadrao.iniciarPartida();

console.log("\nControladores do esquadrão:");
esquadrao.listarControladores().forEach(agente => {
  console.log(agente.codinome);
});

// A chamada gera erro porque o método base lança uma exceção.
// const agente = new AgenteProtocolo("Agente", "Classic");
// agente.entrarEmCombate();
