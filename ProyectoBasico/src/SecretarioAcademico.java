public class SecretarioAcademico {
    private String nombre;

    public SecretarioAcademico(String nombre) {
        this.nombre = nombre;
    }

    public void evaluarSolicitud(SolicitudInasistencia solicitud) {
        if (solicitud.validarDocumentos() && solicitud.verificarTiempo()) {
            solicitud.setEstado("Aprobada");
            System.out.println("Solicitud aprobada por el secretario.");
        } else {
            solicitud.setEstado("Rechazada");
            System.out.println("Solicitud rechazada por el secretario.");
        }
    }
}

