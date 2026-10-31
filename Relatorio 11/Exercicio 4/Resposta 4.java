import java.util.ArrayList;

abstract class Monstro {
    private String _nome;

    public Monstro(String nome) {
        this._nome = nome;
    }

    public String getNome() {
        return _nome;
    }

    public abstract String receita();
}

class Slime extends Monstro {
    public Slime(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Fritar até ficar crocante";
    }
}

class Mandragora extends Monstro {
    public Mandragora(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Cozinhar com ervas e temperos";
    }
}

class Panela {
    private String _material;

    public Panela(String material) {
        this._material = material;
    }

    public String getMaterial() {
        return _material;
    }
}

class Cozinheiro {
    private String _nome;
    private Panela _panela;
    private ArrayList<Monstro> _ingredientes;

    // Composição: Panela é criada dentro do construtor de Cozinheiro, portanto pertence ao ciclo de vida do cozinheiro.
    public Cozinheiro(String nome, String materialDaPanela) {
        this._nome = nome;
        this._panela = new Panela(materialDaPanela);
        this._ingredientes = new ArrayList<>();
    }
  	
    // Agregação: Os monstros são criados fora de Cozinheiro e depois adicionados à sua lista, podendo existir independentemente dele.
    public void adicionarIngrediente(Monstro monstro) {
        _ingredientes.add(monstro);
    }

    public void servirBanquete() {
        System.out.println("Cozinheiro: " + _nome);
        System.out.println("Material da panela: " + _panela.getMaterial());

        for (Monstro monstro : _ingredientes) {
            System.out.println(
                monstro.getNome() + " - " + monstro.receita()
            );
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Slime slime = new Slime("Slime Azul");
        Mandragora mandragora = new Mandragora("Mandragora Gigante");

        Cozinheiro cozinheiro = new Cozinheiro("Senshi", "Ferro");

        cozinheiro.adicionarIngrediente(slime);
        cozinheiro.adicionarIngrediente(mandragora);

        cozinheiro.servirBanquete();
    }
}
