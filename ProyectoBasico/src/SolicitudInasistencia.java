import java.time.LocalDateTime;

public class SolicitudInasistencia {
    private static int idCounter = 1;
    private int idSolicitud;
    private LocalDateTime fechaSolicitud;
    private String motivo;
    private boolean evidenciaAdjunta;
    private String estado;

    public SolicitudInasistencia(String motivo, boolean evidenciaAdjunta) {
        this.idSolicitud = idCounter++;
        this.fechaSolicitud = LocalDateTime.now();
        this.motivo = motivo;
        this.evidenciaAdjunta = evidenciaAdjunta;
        this.estado = "Pendiente";
    }

    public boolean validarDocumentos() {
        return evidenciaAdjunta;
    }

    public boolean verificarTiempo() {
        LocalDateTime plazo = fechaSolicitud.plusHours(48);
        return LocalDateTime.now().isBefore(plazo) && LocalDateTime.now().isAfter(fechaSolicitud.plusHours(24));
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getEstado() {
        return estado;
    }

    public int getIdSolicitud() {
        return idSolicitud;
    }
}
