package interfaces;

import java.util.List;
import modelo.*;

public interface crudOperacionTipo {

    List getAll();

    OperacionTipo getById(Integer id);

    String generarVenta(OperacionTipo ope, Detalle det);

    String generarCompra(OperacionTipo ope, Detalle det);

    String updateById(OperacionTipo ope);

    String deleteById(Integer idDetalle);
}
