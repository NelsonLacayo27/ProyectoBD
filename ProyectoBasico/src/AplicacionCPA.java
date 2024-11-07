import java.util.ArrayList;
import java.util.List;

public class AplicacionCPA {
    private List<SolicitudInasistencia> listaSolicitudes = new ArrayList<>();
    private List<Consulta> listaConsultas = new ArrayList<>();
    private List<Expediente> listaExpedientes = new ArrayList<>();

    public void registrarSolicitud(SolicitudInasistencia solicitud) {
        listaSolicitudes.add(solicitud);
        System.out.println("Solicitud de inasistencia registrada con ID: " + solicitud.getIdSolicitud());
    }

    public void registrarConsulta(Consulta consulta) {
        listaConsultas.add(consulta);
        System.out.println("Consulta registrada con ID: " + consulta.getIdConsulta());
    }

    public void agregarExpediente(Expediente expediente) {
        listaExpedientes.add(expediente);
        System.out.println("Expediente agregado con ID: " + expediente.getIdExpediente());
    }

    public List<SolicitudInasistencia> getListaSolicitudes() {
        return listaSolicitudes;
    }

    public List<Consulta> getListaConsultas() {
        return listaConsultas;
    }
}
