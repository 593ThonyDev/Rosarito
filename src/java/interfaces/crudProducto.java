package interfaces;

import java.util.List;
import modelo.*;

public interface crudProducto {

    List getAll();

    Producto getById(Integer id);

    String add(Producto pro);

    String updateById(Producto pro);

    String deleteById(Integer id);
}
