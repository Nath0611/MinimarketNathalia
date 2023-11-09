-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-10-2023 a las 04:33:42
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
-- Base de datos: `minimarketactual`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nombre`, `descripcion`) VALUES
(1, 'lácteos', 'leche en caja'),
(2, 'carnes frias', 'carnes empaquetadas tipo embutidos'),
(3, 'limpieza', 'para el hogar'),
(4, 'aseo personal', ''),
(5, 'enlatados', ''),
(6, 'jjj', 'kkk');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `tipoDocumento` enum('CC','TI','PAS','PEP','PPT','CE','Otro') DEFAULT NULL,
  `identificacion` varchar(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `correoElectronico` varchar(50) NOT NULL,
  `celular` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `tipoDocumento`, `identificacion`, `nombres`, `apellidos`, `correoElectronico`, `celular`) VALUES
(1, '', '542124552', 'Carla', 'Mendez', 'mendez@gmail.com', '3114567856'),
(2, '', 'avc233532', 'Jose', 'Perez', 'joselito@gmail.com', '3045678898'),
(3, 'CE', '1256789', 'Maria', 'Velez', 'Mariavelezz@gmail.com', '3173339021'),
(4, 'PEP', '60000123654', 'Jinder', 'Aparicio', 'jinjin@hotmail.es', '3181235322'),
(5, '', '72836221', 'Jessica', 'Castro', 'jescast@gmail.com', '3206433313');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `identificacion` varchar(11) NOT NULL,
  `tipoDocumento` enum('CC','TI','PAS','PEP','PPT','CE','Otro') DEFAULT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `correoElectronico` varchar(50) NOT NULL,
  `clave` varchar(8) NOT NULL,
  `idMinimarket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `identificacion`, `tipoDocumento`, `nombres`, `apellidos`, `correoElectronico`, `clave`, `idMinimarket`) VALUES
(1, '1234567899', 'CC', 'Juan', 'Pérez', 'juan.prez@example.com', 'clave123', 1),
(2, '9876543210', 'Otro', 'María', 'Gómez', 'maria.gomez@example.com', 'password', 1),
(3, '4567890123', 'PAS', 'Carlos', 'Ramírez', 'carlos.ramirez@example.com', 'segura45', 1),
(4, '7890123456', 'PEP', 'Ana', 'Martínez', 'ana.martinez@example.com', 'contrase', 1),
(5, '2345678901', 'CE', 'Luis', 'López', 'luis.lopez@example.com', 'clave123', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `minimarket`
--

CREATE TABLE `minimarket` (
  `idMinimarket` int(11) NOT NULL,
  `nit` varchar(15) NOT NULL,
  `razonSocial` varchar(50) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `nomenclatura` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `departamento` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `sitioWeb` varchar(50) NOT NULL,
  `instagram` varchar(50) NOT NULL,
  `whatsApp` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `minimarket`
--

INSERT INTO `minimarket` (`idMinimarket`, `nit`, `razonSocial`, `telefono`, `nomenclatura`, `ciudad`, `departamento`, `correo`, `sitioWeb`, `instagram`, `whatsApp`) VALUES
(1, '123456789-0', 'nnn', '3112345678', 'Calle Principal 123', 'Bogotá', 'Cundinamarca', 'donjuan@example.com', 'www.minimarketdonjuan.com', 'facebook.com/minimarketdonjuan', '3119876543'),
(2, '890567234', 'Minimarket comercial', '314456700', '345655', 'Cali', 'Valle del Cauca', 'minicomercio@gmail.com', 'minicommerce.com', '@miniminicommerce', '314456700');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombreProducto` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `stock` int(11) DEFAULT 0,
  `pvp` int(11) NOT NULL DEFAULT 0,
  `descripcion` varchar(200) DEFAULT NULL,
  `unidadMedida` enum('Und','gr') DEFAULT NULL,
  `idCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombreProducto`, `marca`, `stock`, `pvp`, `descripcion`, `unidadMedida`, `idCategoria`) VALUES
(1, 'Leche', 'LecheCo', 50, 2000, 'Leche descremada en envase de 1 litro.', 'Und', 1),
(2, 'Pan Integral', 'Bakery', 30, 1500, 'Pan integral fresco en rebanadas.', 'Und', 2),
(3, 'Cerveza', 'CervezaCo', 100, 3500, 'Cerveza lager en lata de 355 ml.', 'Und', 3),
(4, 'Papel Higiénico', 'SoftCare', 40, 1200, 'Rollo de papel higiénico suave y absorbente.', 'Und', 4),
(5, 'Jabón de Lavandería', 'CleanSoap', 60, 800, 'Jabón en barra para lavandería.', 'Und', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL,
  `nit` varchar(15) NOT NULL,
  `razonSocial` varchar(50) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `nomenclatura` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `departamento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idProveedor`, `nit`, `razonSocial`, `telefono`, `correo`, `nomenclatura`, `ciudad`, `departamento`) VALUES
(1, '123456789-0', 'Distribuidora de Lácteos S.A.', '3112345678', 'info@lacteos.com', 'Calle 123', 'Bogotá', 'Cundinamarca'),
(2, '987654321-1', 'Carnes Frescas y Más Ltda.', '3209876543', 'contacto@carnesfrescas.com', 'Avenida Principal', 'Medellín', 'Antioquia'),
(3, '567890123-2', 'Productos de Limpieza Profesional S.A.', '3156789012', 'ventas@limpiezaprox.com', 'Calle Limpia 456', 'Cali', 'Valle del Cauca'),
(4, '234567890-3', 'Artículos de Aseo Personal Elegantes S.A.', '3002345678', 'info@elegantesaseo.com', 'Carrera Elegante 789', 'Barranquilla', 'Atlántico'),
(5, '789012345-4', 'Enlatados del Sur Ltda.', '3107890123', 'contacto@enlatados.com', 'Calle del Enlatado 10', 'Pasto', 'Nariño'),
(6, '23456', 'distribuidora carnes', '3124008998', 'distruindustri1_234@gmail.com', '#4-56', 'cali', 'valle del cauca'),
(8, '2233444', 'dcsdfs', 'dfdsfsd', 'fdhdh', 'dfhhd', 'fdhdfh', 'fdhhf');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`),
  ADD UNIQUE KEY `unico_nombre1` (`nombre`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `unico_identificacion` (`identificacion`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD UNIQUE KEY `unico_identificacion` (`identificacion`),
  ADD UNIQUE KEY `unico_correoElectronico` (`correoElectronico`),
  ADD KEY `fk_minimarket` (`idMinimarket`);

--
-- Indices de la tabla `minimarket`
--
ALTER TABLE `minimarket`
  ADD PRIMARY KEY (`idMinimarket`),
  ADD UNIQUE KEY `unico_nit` (`nit`),
  ADD UNIQUE KEY `unico_razonSocial` (`razonSocial`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD UNIQUE KEY `unico_nombreProducto` (`nombreProducto`),
  ADD KEY `fk_categoria` (`idCategoria`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedor`),
  ADD UNIQUE KEY `unico_nit1` (`nit`),
  ADD UNIQUE KEY `unico_razonSocial1` (`razonSocial`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `minimarket`
--
ALTER TABLE `minimarket`
  MODIFY `idMinimarket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_minimarket` FOREIGN KEY (`idMinimarket`) REFERENCES `minimarket` (`idMinimarket`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
