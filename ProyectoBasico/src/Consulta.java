import java.time.LocalDateTime;

public class Consulta {
    private static int idCounter = 1;
    private int idConsulta;
    private LocalDateTime fechaConsulta;
    private String descripcion;
    private String estado;

    public Consulta(String descripcion) {
        this.idConsulta = idCounter++;
        this.fechaConsulta = LocalDateTime.now();
        this.descripcion = descripcion;
        this.estado = "Pendiente";
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getEstado() {
        return estado;
    }

    public int getIdConsulta() {
        return idConsulta;
    }
}
