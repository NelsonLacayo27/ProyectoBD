import java.time.LocalDateTime;

public class Expediente {
    private static int idCounter = 1;
    private int idExpediente;
    private String nombreEstudiante;
    private String detalle;
    private LocalDateTime fechaCreacion;

    public Expediente(String nombreEstudiante, String detalle) {
        this.idExpediente = idCounter++;
        this.nombreEstudiante = nombreEstudiante;
        this.detalle = detalle;
        this.fechaCreacion = LocalDateTime.now();
    }

    public int getIdExpediente() {
        return idExpediente;
    }

    public void mostrarDetalles() {
        System.out.println("Expediente ID: " + idExpediente);
        System.out.println("Estudiante: " + nombreEstudiante);
        System.out.println("Detalles: " + detalle);
    }
}
