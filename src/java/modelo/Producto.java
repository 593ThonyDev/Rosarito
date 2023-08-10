package modelo;

public class Producto {

    private int idProducto;
    private String proNombre;
    private String proCodigo;
    private int proStock;
    private double proPrecio;

    // Constructor, getters y setters
    public Producto() {
    }

    public Producto(int idProducto, String proNombre, String proCodigo, int proStock, double proPrecio) {
        this.idProducto = idProducto;
        this.proNombre = proNombre;
        this.proCodigo = proCodigo;
        this.proStock = proStock;
        this.proPrecio = proPrecio;
    }

    public Producto(String proNombre, String proCodigo, int proStock, double proPrecio) {
        this.proNombre = proNombre;
        this.proCodigo = proCodigo;
        this.proStock = proStock;
        this.proPrecio = proPrecio;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getProNombre() {
        return proNombre;
    }

    public void setProNombre(String proNombre) {
        this.proNombre = proNombre;
    }

    public String getProCodigo() {
        return proCodigo;
    }

    public void setProCodigo(String proCodigo) {
        this.proCodigo = proCodigo;
    }

    public int getProStock() {
        return proStock;
    }

    public void setProStock(int proStock) {
        this.proStock = proStock;
    }

    public double getProPrecio() {
        return proPrecio;
    }

    public void setProPrecio(double proPrecio) {
        this.proPrecio = proPrecio;
    }

}
