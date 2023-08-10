-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-08-2023 a las 18:39:35
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rosarito`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarClienteProveedor` (IN `p_idClienteProveedor` INT, IN `p_nombre` VARCHAR(255), IN `p_apellido` VARCHAR(255), IN `p_cedula` VARCHAR(15), IN `p_email` VARCHAR(255), IN `p_telefono` VARCHAR(25))   BEGIN
    UPDATE clienteProveedor
    SET cliProNombre = p_nombre, cliProApellido = p_apellido, cliProCedula = p_cedula,
        cliProEmail = p_email, cliProTelefono = p_telefono
    WHERE idClienteProveedor = p_idClienteProveedor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDetalle` (IN `p_idDetalle` INT, IN `p_operacionID` INT, IN `p_productoID` INT, IN `p_descripcion` VARCHAR(45), IN `p_cantidad` INT, IN `p_total` DOUBLE, IN `p_jornada` VARCHAR(45))   BEGIN
    UPDATE detalle
    SET fkOperacionTipo = p_operacionID, fkProducto = p_productoID,
        detDescripcion = p_descripcion, detCantidad = p_cantidad,
        detTotal = p_total, detJornada = p_jornada
    WHERE iddetalle = p_idDetalle;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarOperacion` (IN `p_idOperacionTipo` INT, IN `p_clienteID` INT, IN `p_codigo` VARCHAR(25), IN `p_fecha` DATE, IN `p_total` DOUBLE, IN `p_tipo` VARCHAR(45))   BEGIN
    UPDATE operacionTipo
    SET fkCliente = p_clienteID, opeCodigo = p_codigo, opeFecha = p_fecha,
        opeTotal = p_total, opeTipo = p_tipo
    WHERE idOperacionTipo = p_idOperacionTipo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarProducto` (IN `p_idProducto` INT, IN `p_nombre` VARCHAR(255), IN `p_codigo` VARCHAR(25), IN `p_stock` INT, IN `p_precio` DOUBLE)   BEGIN
    UPDATE producto
    SET proNombre = p_nombre, proCodigo = p_codigo, proStock = p_stock, proPrecio = p_precio
    WHERE idProducto = p_idProducto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarClienteProveedorPorID` (IN `p_idClienteProveedor` INT)   BEGIN
    DELETE FROM clienteProveedor WHERE idClienteProveedor = p_idClienteProveedor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarDetallePorID` (IN `p_idDetalle` INT)   BEGIN
    DELETE FROM detalle WHERE iddetalle = p_idDetalle;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarOperacionPorID` (IN `p_idOperacionTipo` INT)   BEGIN
    DELETE FROM operacionTipo WHERE idOperacionTipo = p_idOperacionTipo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarProductoPorID` (IN `p_idProducto` INT)   BEGIN
    DELETE FROM producto WHERE idProducto = p_idProducto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarUsuarioPorID` (IN `p_idUsuario` INT)   BEGIN
    DELETE FROM usuario WHERE idUsuario = p_idUsuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarClienteProveedor` (IN `p_nombre` VARCHAR(255), IN `p_apellido` VARCHAR(255), IN `p_cedula` VARCHAR(15), IN `p_email` VARCHAR(255), IN `p_telefono` VARCHAR(25))   BEGIN
    INSERT INTO clienteProveedor (cliProNombre, cliProApellido, cliProCedula, cliProEmail, cliProTelefono)
    VALUES (p_nombre, p_apellido, p_cedula, p_email, p_telefono);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarDetalle` (IN `p_operacionID` INT, IN `p_productoID` INT, IN `p_descripcion` VARCHAR(45), IN `p_cantidad` INT, IN `p_total` DOUBLE, IN `p_jornada` VARCHAR(45))   BEGIN
    INSERT INTO detalle (fkOperacionTipo, fkProducto, detDescripcion, detCantidad, detTotal, detJornada)
    VALUES (p_operacionID, p_productoID, p_descripcion, p_cantidad, p_total, p_jornada);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarOperacion` (IN `p_clienteID` INT, IN `p_codigo` VARCHAR(25), IN `p_fecha` DATE, IN `p_total` DOUBLE, IN `p_tipo` VARCHAR(45))   BEGIN
    INSERT INTO operacionTipo (fkCliente, opeCodigo, opeFecha, opeTotal, opeTipo)
    VALUES (p_clienteID, p_codigo, p_fecha, p_total, p_tipo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarProducto` (IN `p_nombre` VARCHAR(255), IN `p_codigo` VARCHAR(25), IN `p_stock` INT, IN `p_precio` DOUBLE)   BEGIN
    INSERT INTO producto (proNombre, proCodigo, proStock, proPrecio)
    VALUES (p_nombre, p_codigo, p_stock, p_precio);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionarClienteProveedorPorID` (IN `p_clienteProveedorID` INT)   BEGIN
    SELECT * FROM clienteProveedor WHERE idClienteProveedor = p_clienteProveedorID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionarClientesProveedores` ()   BEGIN
    SELECT * FROM clienteProveedor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionarDetallePorID` (IN `p_detalleID` INT)   BEGIN
    SELECT * FROM detalle WHERE iddetalle = p_detalleID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionarDetalles` ()   BEGIN
    SELECT * FROM detalle;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionarOperaciones` ()   BEGIN
    SELECT * FROM operacionTipo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionarOperacionPorID` (IN `p_operacionID` INT)   BEGIN
    SELECT * FROM operacionTipo WHERE idOperacionTipo = p_operacionID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionarProductoPorID` (IN `p_productoID` INT)   BEGIN
    SELECT * FROM producto WHERE idProducto = p_productoID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionarProductos` ()   BEGIN
    SELECT * FROM producto;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionarUsuarioPorNombreUsuario` (IN `p_usuUsuario` VARCHAR(50))   BEGIN
    SELECT * FROM usuario WHERE usuUsuario = p_usuUsuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SeleccionarUsuarios` ()   BEGIN
    SELECT * FROM usuario;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarUsuario` (IN `p_idUsuario` INT, IN `p_usuUsuario` VARCHAR(50), IN `p_usuClave` VARCHAR(255), IN `p_usuIntento` INT)   BEGIN
    UPDATE usuario
    SET usuUsuario = p_usuUsuario,
        usuClave = p_usuClave,
        usuIntento = p_usuIntento
    WHERE idUsuario = p_idUsuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spCrearUsuario` (IN `p_usuUsuario` VARCHAR(50), IN `p_usuClave` VARCHAR(255), IN `p_usuIntento` INT)   BEGIN
    INSERT INTO usuario (usuUsuario, usuClave, usuIntento)
    VALUES (p_usuUsuario, p_usuClave, p_usuIntento);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spObtenerUsuarioPorID` (IN `p_idUsuario` INT)   BEGIN
    SELECT * FROM usuario WHERE idUsuario = p_idUsuario;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clienteproveedor`
--

CREATE TABLE `clienteproveedor` (
  `idClienteProveedor` int(11) NOT NULL,
  `cliProNombre` varchar(255) DEFAULT NULL,
  `cliProApellido` varchar(255) DEFAULT NULL,
  `cliProCedula` varchar(15) DEFAULT NULL,
  `cliProEmail` varchar(255) DEFAULT NULL,
  `cliProTelefono` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clienteproveedor`
--

INSERT INTO `clienteproveedor` (`idClienteProveedor`, `cliProNombre`, `cliProApellido`, `cliProCedula`, `cliProEmail`, `cliProTelefono`) VALUES
(0, 'Nombres 1', 'Apellidos 1', '123', 'nombres@gmail.com', '0987654321');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `iddetalle` int(11) NOT NULL,
  `fkOperacionTipo` int(11) NOT NULL,
  `fkProducto` int(11) NOT NULL,
  `detDescripcion` varchar(45) DEFAULT NULL,
  `detCantidad` int(11) DEFAULT NULL,
  `detTotal` double(10,2) DEFAULT NULL,
  `detJornada` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operaciontipo`
--

CREATE TABLE `operaciontipo` (
  `idOperacionTipo` int(11) NOT NULL,
  `fkCliente` int(11) NOT NULL,
  `opeCodigo` varchar(25) DEFAULT NULL,
  `opeFecha` date DEFAULT NULL,
  `opeTotal` double(10,2) DEFAULT NULL,
  `opeTipo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `proNombre` varchar(255) DEFAULT NULL,
  `proCodigo` varchar(25) DEFAULT NULL,
  `proStock` int(11) DEFAULT NULL,
  `proPrecio` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `proNombre`, `proCodigo`, `proStock`, `proPrecio`) VALUES
(1, 'producto NUEVO 1', 'plt1', 100, 1.00),
(2, 'producto NUEVO 1', 'la0a8ss7a', 1000, 2.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `usuUsuario` varchar(50) DEFAULT NULL,
  `usuClave` varchar(255) DEFAULT NULL,
  `usuIntento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `usuUsuario`, `usuClave`, `usuIntento`) VALUES
(7, 'admin', 'LFPfLv8ji08=', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clienteproveedor`
--
ALTER TABLE `clienteproveedor`
  ADD PRIMARY KEY (`idClienteProveedor`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`iddetalle`),
  ADD KEY `fk_detalle_venta1` (`fkOperacionTipo`),
  ADD KEY `fk_detalle_producto1` (`fkProducto`);

--
-- Indices de la tabla `operaciontipo`
--
ALTER TABLE `operaciontipo`
  ADD PRIMARY KEY (`idOperacionTipo`),
  ADD KEY `fk_venta_cliente` (`fkCliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle`
--
ALTER TABLE `detalle`
  MODIFY `iddetalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `operaciontipo`
--
ALTER TABLE `operaciontipo`
  MODIFY `idOperacionTipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `fk_detalle_producto1` FOREIGN KEY (`fkProducto`) REFERENCES `producto` (`idProducto`),
  ADD CONSTRAINT `fk_detalle_venta1` FOREIGN KEY (`fkOperacionTipo`) REFERENCES `operaciontipo` (`idOperacionTipo`);

--
-- Filtros para la tabla `operaciontipo`
--
ALTER TABLE `operaciontipo`
  ADD CONSTRAINT `fk_venta_cliente` FOREIGN KEY (`fkCliente`) REFERENCES `clienteproveedor` (`idClienteProveedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
