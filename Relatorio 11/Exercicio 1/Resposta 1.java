abstract class Morador {
    private String _nome;

    public Morador(String nome) {
        this._nome = nome;
    }

    public String getNome() {
        return _nome;
    }

    public abstract void apresentar();
}

class Mago extends Morador {
    private String _feitico;

    public Mago(String nome, String feitico) {
        super(nome);
        this._feitico = feitico;
    }

    @Override
    public void apresentar() {
        System.out.println(getNome() + " é um mago e utiliza o feitiço: " + _feitico);
    }
}

class DemonioDoFogo extends Morador {
    public DemonioDoFogo(String nome) {
        super(nome);
    }

    @Override
    public void apresentar() {
        System.out.println(getNome() + " é um demônio do fogo e faz o castelo andar.");
    }
}

public class Main {
    public static void main(String[] args) {

        Morador mago = new Mago("Howl", "Magia de proteção");
        Morador demonio = new DemonioDoFogo("Calcifer");

        mago.apresentar();
        demonio.apresentar();

        // Morador morador = new Morador("Genérico");
    }
}
