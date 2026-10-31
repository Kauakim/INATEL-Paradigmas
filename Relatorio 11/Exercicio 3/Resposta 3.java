import java.util.HashMap;

interface Sobrenatural {
    void manifestar();
}

class Alienigena implements Sobrenatural {
    private String _nome;

    public Alienigena(String nome) {
        this._nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(_nome + " aparece com uma tecnologia alienígena avançada!");
    }
}

class EspiritoYoukai implements Sobrenatural {
    private String _nome;

    public EspiritoYoukai(String nome) {
        this._nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(_nome + " manifesta sua presença espiritual!");
    }
}

class MapaDeAvistamentos {
    private HashMap<String, Sobrenatural> _avistamentos;

    public MapaDeAvistamentos() {
        this._avistamentos = new HashMap<>();
    }

    public void registrar(String local, Sobrenatural ser) {
        _avistamentos.put(local, ser);
    }

    public void investigar(String local) {
        Sobrenatural ser = _avistamentos.get(local);

        if (ser == null) {
            System.out.println("O local " + local + " está tranquilo.");
        } else {
            System.out.println("Algo sobrenatural foi encontrado em " + local + "!");
            ser.manifestar();
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Alienigena alienigena = new Alienigena("Serpo");
        EspiritoYoukai youkai = new EspiritoYoukai("Turbo Vovó");

        MapaDeAvistamentos mapa = new MapaDeAvistamentos();

        mapa.registrar("Escola", alienigena);
        mapa.registrar("Túnel", youkai);

        mapa.investigar("Escola");
        mapa.investigar("Túnel");
        mapa.investigar("Hospital");
    }
}
