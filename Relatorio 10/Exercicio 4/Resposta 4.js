class UsuarioDeNen {
  constructor(nome) {
    this.nome = nome;
  }

  atacar(alvo) {
    console.log(
      `${this.nome} ataca ${alvo.nome} com uma aura de Nen genérica!`
    );
  }
}

class Intensificador extends UsuarioDeNen {
  atacar(alvo) {
    console.log(
      `${this.nome} ataca ${alvo.nome} com um golpe de força intensificada!`
    );
  }
}

class Transmutador extends UsuarioDeNen {
  atacar(alvo) {
    console.log(
      `${this.nome} transforma sua aura para atacar ${alvo.nome}!`
    );
  }
}

class Materializador extends UsuarioDeNen {
  atacar(alvo) {
    console.log(
      `${this.nome} materializa uma arma para atacar ${alvo.nome}!`
    );
  }
}

class Aranha {
  constructor(nome, numero) {
    this.nome = nome;
    this.numero = numero;
  }
}

class TrupeFantasma {
  #aranhas;

  constructor(cidade, aranhas = []) {
    this.cidade = cidade;
    this.#aranhas = aranhas;
  }

  revelarAranhas() {
    console.log(`Aranhas avistadas em ${this.cidade}:`);

    this.#aranhas.forEach(aranha => {
      console.log(`Número ${aranha.numero}: ${aranha.nome}`);
    });
  }

  buscarAranha(numero) {
    return this.#aranhas.find(aranha => aranha.numero === numero);
  }
}

// Main
// As Aranhas são criadas antes da Trupe.
const aranha1 = new Aranha("Chrollo", 1);
const aranha2 = new Aranha("Feitan", 2);

const trupe = new TrupeFantasma("Yorknew", [
  aranha1,
  aranha2
]);

trupe.revelarAranhas();

const alvo = trupe.buscarAranha(2);

console.log("\nAranha encontrada:");
if (alvo) {
  console.log(`${alvo.nome}, número ${alvo.numero}`);
}

const usuarios = [
  new Intensificador("Gon"),
  new Transmutador("Killua"),
  new Materializador("Kurapika")
];

console.log("\nCombate:");
if (alvo) {
  usuarios.forEach(usuario => {
    usuario.atacar(alvo);
  });
}
