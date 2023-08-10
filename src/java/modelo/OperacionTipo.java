package modelo;

public class OperacionTipo {

    private int idOperacionTipo;
    private int fkCliente;
    private String opeCodigo;
    private String opeFecha; // Representado como String
    private double opeTotal;
    private String opeTipo;

    // Constructor, getters y setters
    public OperacionTipo() {
    }

    public OperacionTipo(int idOperacionTipo, int fkCliente, String opeCodigo, String opeFecha, double opeTotal, String opeTipo) {
        this.idOperacionTipo = idOperacionTipo;
        this.fkCliente = fkCliente;
        this.opeCodigo = opeCodigo;
        this.opeFecha = opeFecha;
        this.opeTotal = opeTotal;
        this.opeTipo = opeTipo;
    }

    public OperacionTipo(int fkCliente, String opeCodigo, String opeFecha, double opeTotal, String opeTipo) {
        this.fkCliente = fkCliente;
        this.opeCodigo = opeCodigo;
        this.opeFecha = opeFecha;
        this.opeTotal = opeTotal;
        this.opeTipo = opeTipo;
    }

    public int getIdOperacionTipo() {
        return idOperacionTipo;
    }

    public void setIdOperacionTipo(int idOperacionTipo) {
        this.idOperacionTipo = idOperacionTipo;
    }

    public int getFkCliente() {
        return fkCliente;
    }

    public void setFkCliente(int fkCliente) {
        this.fkCliente = fkCliente;
    }

    public String getOpeCodigo() {
        return opeCodigo;
    }

    public void setOpeCodigo(String opeCodigo) {
        this.opeCodigo = opeCodigo;
    }

    public String getOpeFecha() {
        return opeFecha;
    }

    public void setOpeFecha(String opeFecha) {
        this.opeFecha = opeFecha;
    }

    public double getOpeTotal() {
        return opeTotal;
    }

    public void setOpeTotal(double opeTotal) {
        this.opeTotal = opeTotal;
    }

    public String getOpeTipo() {
        return opeTipo;
    }

    public void setOpeTipo(String opeTipo) {
        this.opeTipo = opeTipo;
    }

}
