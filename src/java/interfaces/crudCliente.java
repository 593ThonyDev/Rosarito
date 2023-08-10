package interfaces;

import modelo.*;
import java.util.List;

public interface crudCliente {

    List getAll();

    ClienteProveedor getById(Integer id);

    String add(ClienteProveedor cli);

    String updateById(ClienteProveedor cli);

    String deleteById(Integer idCliente);

}
