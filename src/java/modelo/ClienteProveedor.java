package modelo;

public class ClienteProveedor {

    private int idClienteProveedor;
    private String cliProNombre;
    private String cliProApellido;
    private String cliProCedula;
    private String cliProEmail;
    private String cliProTelefono;

    // Constructor, getters y setters
    public ClienteProveedor() {
    }

    public ClienteProveedor(int idClienteProveedor, String cliProNombre, String cliProApellido, String cliProCedula, String cliProEmail, String cliProTelefono) {
        this.idClienteProveedor = idClienteProveedor;
        this.cliProNombre = cliProNombre;
        this.cliProApellido = cliProApellido;
        this.cliProCedula = cliProCedula;
        this.cliProEmail = cliProEmail;
        this.cliProTelefono = cliProTelefono;
    }

    public ClienteProveedor(String cliProNombre, String cliProApellido, String cliProCedula, String cliProEmail, String cliProTelefono) {
        this.cliProNombre = cliProNombre;
        this.cliProApellido = cliProApellido;
        this.cliProCedula = cliProCedula;
        this.cliProEmail = cliProEmail;
        this.cliProTelefono = cliProTelefono;
    }

    public int getIdClienteProveedor() {
        return idClienteProveedor;
    }

    public void setIdClienteProveedor(int idClienteProveedor) {
        this.idClienteProveedor = idClienteProveedor;
    }

    public String getCliProNombre() {
        return cliProNombre;
    }

    public void setCliProNombre(String cliProNombre) {
        this.cliProNombre = cliProNombre;
    }

    public String getCliProApellido() {
        return cliProApellido;
    }

    public void setCliProApellido(String cliProApellido) {
        this.cliProApellido = cliProApellido;
    }

    public String getCliProCedula() {
        return cliProCedula;
    }

    public void setCliProCedula(String cliProCedula) {
        this.cliProCedula = cliProCedula;
    }

    public String getCliProEmail() {
        return cliProEmail;
    }

    public void setCliProEmail(String cliProEmail) {
        this.cliProEmail = cliProEmail;
    }

    public String getCliProTelefono() {
        return cliProTelefono;
    }

    public void setCliProTelefono(String cliProTelefono) {
        this.cliProTelefono = cliProTelefono;
    }

}
