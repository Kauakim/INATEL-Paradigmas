class Pokemon {
  constructor(apelido, tipo, vidaInicial) {
    this.apelido = apelido;
    this.tipo = tipo;
    this.#vida = vidaInicial;
  }

  #vida;

  get vida() {
    return this.#vida;
  }

  sofrerDano(pontos) {
    this.#vida -= pontos;

    if (this.#vida < 0) {
      this.#vida = 0;
    }

    console.log(`${this.apelido} recebeu dano e ficou com ${this.#vida} de vida.`);
  }

  atacar(alvo) {
    console.log(`${this.apelido} usou um ataque genérico!`);
    alvo.sofrerDano(10);
  }
}

class Squirtle extends Pokemon {
  constructor(apelido, vidaInicial) {
    super(apelido, "Água", vidaInicial);
  }

  atacar(alvo) {
    console.log(`${this.apelido} usou Jato de Água!`);
    alvo.sofrerDano(20);
  }
}

class Bulbasaur extends Pokemon {
  constructor(apelido, vidaInicial) {
    super(apelido, "Planta", vidaInicial);
  }

  atacar(alvo) {
    console.log(`${this.apelido} usou Chicote de Vinha!`);
    alvo.sofrerDano(15);
  }
}

// Main
const squirtle = new Squirtle("Tortuguita", 100);
const bulbasaur = new Bulbasaur("Djamba", 30);

bulbasaur.atacar(squirtle);

squirtle.atacar(bulbasaur);
squirtle.atacar(bulbasaur);

console.log(`Vida do Squirtle: ${squirtle.vida}`);
console.log(`Vida do Bulbasaur: ${bulbasaur.vida}`);

// Acesso direto gera erro de sintaxe.
// console.log(squirtle.#vida);
