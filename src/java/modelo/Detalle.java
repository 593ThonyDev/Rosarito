package modelo;

public class Detalle {

    private int iddetalle;
    private int fkOperacionTipo;
    private int fkProducto;
    private String detDescripcion;
    private int detCantidad;
    private double detTotal;
    private String detJornada;

    // Constructor, getters y setters
    public Detalle() {
    }

    public Detalle(int iddetalle, int fkOperacionTipo, int fkProducto, String detDescripcion, int detCantidad, double detTotal, String detJornada) {
        this.iddetalle = iddetalle;
        this.fkOperacionTipo = fkOperacionTipo;
        this.fkProducto = fkProducto;
        this.detDescripcion = detDescripcion;
        this.detCantidad = detCantidad;
        this.detTotal = detTotal;
        this.detJornada = detJornada;
    }

    public Detalle(int fkOperacionTipo, int fkProducto, String detDescripcion, int detCantidad, double detTotal, String detJornada) {
        this.fkOperacionTipo = fkOperacionTipo;
        this.fkProducto = fkProducto;
        this.detDescripcion = detDescripcion;
        this.detCantidad = detCantidad;
        this.detTotal = detTotal;
        this.detJornada = detJornada;
    }

    public int getIddetalle() {
        return iddetalle;
    }

    public void setIddetalle(int iddetalle) {
        this.iddetalle = iddetalle;
    }

    public int getFkOperacionTipo() {
        return fkOperacionTipo;
    }

    public void setFkOperacionTipo(int fkOperacionTipo) {
        this.fkOperacionTipo = fkOperacionTipo;
    }

    public int getFkProducto() {
        return fkProducto;
    }

    public void setFkProducto(int fkProducto) {
        this.fkProducto = fkProducto;
    }

    public String getDetDescripcion() {
        return detDescripcion;
    }

    public void setDetDescripcion(String detDescripcion) {
        this.detDescripcion = detDescripcion;
    }

    public int getDetCantidad() {
        return detCantidad;
    }

    public void setDetCantidad(int detCantidad) {
        this.detCantidad = detCantidad;
    }

    public double getDetTotal() {
        return detTotal;
    }

    public void setDetTotal(double detTotal) {
        this.detTotal = detTotal;
    }

    public String getDetJornada() {
        return detJornada;
    }

    public void setDetJornada(String detJornada) {
        this.detJornada = detJornada;
    }

}
