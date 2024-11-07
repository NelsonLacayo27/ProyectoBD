public class Estudiante {
    private String nombre;
    private String carnet;
    private String correo;

    public Estudiante(String nombre, String carnet, String correo) {
        this.nombre = nombre;
        this.carnet = carnet;
        this.correo = correo;
    }

    public SolicitudInasistencia crearSolicitudInasistencia(String motivo, boolean evidenciaAdjunta) {
        return new SolicitudInasistencia(motivo, evidenciaAdjunta);
    }

    public Consulta crearConsulta(String descripcion) {
        return new Consulta(descripcion);
    }

    public String getNombre() {
        return nombre;
    }

    public String getCarnet() {
        return carnet;
    }
}
