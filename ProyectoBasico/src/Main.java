public class Main {
    public static void main(String[] args) {
        // Crear el sistema de la aplicación
        AplicacionCPA sistema = new AplicacionCPA();

        // Crear el secretario académico
        SecretarioAcademico secretario = new SecretarioAcademico("Ana López");

        // Crear estudiantes
        Estudiante estudiante1 = new Estudiante("Juan Pérez", "12345", "juan.perez@universidad.edu");
        Estudiante estudiante2 = new Estudiante("Maria Gómez", "67890", "maria.gomez@universidad.edu");

        // Estudiante1 hace una solicitud de inasistencia
        SolicitudInasistencia solicitud1 = estudiante1.crearSolicitudInasistencia("Enfermedad", true);
        sistema.registrarSolicitud(solicitud1);

        // El secretario revisa y aprueba/rechaza la solicitud
        secretario.evaluarSolicitud(solicitud1);
        System.out.println("Estado de la solicitud de inasistencia de Juan: " + solicitud1.getEstado());

        // Estudiante2 hace una consulta sobre su situación académica
        Consulta consulta1 = estudiante2.crearConsulta("Consulta sobre mi promedio y situación académica.");
        sistema.registrarConsulta(consulta1);
        System.out.println("Estado de la consulta de Maria: " + consulta1.getEstado());

        // Agregar un expediente para Estudiante1
        Expediente expediente1 = new Expediente(estudiante1.getNombre(), "Detalles del expediente académico y jurídico.");
        sistema.agregarExpediente(expediente1);

        // Consultar el expediente de Estudiante1
        expediente1.mostrarDetalles();
    }
}
