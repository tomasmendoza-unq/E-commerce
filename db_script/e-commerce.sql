-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-10-2022 a las 22:34:36
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.0.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `e-commerce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `id_orden` int(100) NOT NULL,
  `id_usuario` int(240) NOT NULL,
  `total` int(250) NOT NULL,
  `metodoDePago` varchar(250) NOT NULL,
  `puntoDeEncuentro` varchar(250) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ordenes`
--

INSERT INTO `ordenes` (`id_orden`, `id_usuario`, `total`, `metodoDePago`, `puntoDeEncuentro`, `createdAt`, `updatedAt`) VALUES
(1, 3, 9001, 'Crédito', 'Andreani', '2022-10-27 00:12:50', '2022-10-27 00:12:50'),
(2, 3, 3000, 'Efectivo', 'Correo', '2022-10-27 00:13:58', '2022-10-27 00:13:58'),
(3, 3, 3000, 'Efectivo', 'Cadete', '2022-10-27 00:15:32', '2022-10-27 00:15:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenesitems`
--

CREATE TABLE `ordenesitems` (
  `id` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `id_productos` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `precio` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `createdAt` date NOT NULL,
  `updatedAt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ordenesitems`
--

INSERT INTO `ordenesitems` (`id`, `id_orden`, `id_productos`, `nombre`, `precio`, `cantidad`, `createdAt`, `updatedAt`) VALUES
(1, 0, 0, '0', 0, 0, '2022-10-26', '2022-10-26'),
(2, 0, 0, '', 0, 0, '2022-10-26', '2022-10-26'),
(3, 0, 0, '', 0, 0, '2022-10-26', '2022-10-26'),
(4, 0, 0, 'hola', 0, 0, '2022-10-26', '2022-10-26'),
(5, 0, 0, 'hola', 0, 0, '2022-10-26', '2022-10-26'),
(6, 0, 0, '', 0, 0, '2022-10-26', '2022-10-26'),
(7, 0, 0, '', 0, 0, '2022-10-26', '2022-10-26'),
(8, 0, 0, '', 0, 0, '2022-10-26', '2022-10-26'),
(9, 0, 0, '', 0, 0, '2022-10-26', '2022-10-26'),
(10, 0, 0, '', 0, 0, '2022-10-26', '2022-10-26'),
(11, 0, 0, 'bandeja de dientes ', 0, 0, '2022-10-26', '2022-10-26'),
(12, 0, 0, 'bandeja de dientes ', 2000, 0, '2022-10-26', '2022-10-26'),
(13, 0, 0, 'bandeja de dientes ', 2000, 1, '2022-10-26', '2022-10-26'),
(14, 0, 0, 'bandeja de dientes ', 2000, 1, '2022-10-26', '2022-10-26'),
(15, 0, 0, 'Gominolas', 3000, 1, '2022-10-27', '2022-10-27'),
(16, 0, 0, 'Gominolas', 3000, 1, '2022-10-27', '2022-10-27'),
(17, 0, 0, 'bandeja de dientes ', 2000, 1, '2022-10-27', '2022-10-27'),
(18, 0, 0, 'bandeja de dientes ', 2000, 1, '2022-10-27', '2022-10-27'),
(19, 0, 0, 'bandeja de dientes ', 2000, 1, '2022-10-27', '2022-10-27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `imagen` varchar(2500) NOT NULL,
  `precio` int(250) NOT NULL,
  `categoria` varchar(200) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `imagen`, `precio`, `categoria`, `createdAt`, `updatedAt`) VALUES
(1, 'bandeja de dientes ', 'img/productos/44.jpg', 2000, '0', '2022-10-17 21:35:55', '2022-10-17 21:06:50'),
(2, 'Dientes', 'img/productos/999.jpg', 1000, '0', '2022-10-17 21:30:07', '2022-10-17 21:07:31'),
(3, 'Gominolas', 'img/productos/17abf436-32b2-4ce8-9970-3cade98e06e9.jpg', 3000, '0', '2022-10-17 21:28:59', '2022-10-17 21:28:59'),
(4, 'bandeja de dientes ', 'img/productos/MÃ¡rcia-Moura-Tucano-I.jpg', 2000000000, '', '2022-10-20 21:31:30', '2022-10-20 21:31:30'),
(5, 'Dientes', 'img/productos/17abf436-32b2-4ce8-9970-3cade98e06e9.jpg', 2000, '', '2022-10-23 22:51:09', '2022-10-23 22:51:09'),
(6, 'bandeja de dientes ', 'img/productos/274282204_4814242625340480_127006461799274787_n.jpg', 3999, '', '2022-10-23 22:57:46', '2022-10-23 22:57:46'),
(7, 'Rana', 'img/productos/b1b09b711e4d44b558dc177e8951a010.gif', 3001, '', '2022-10-23 23:00:02', '2022-10-23 23:00:02'),
(8, 'Dientes', 'img/productos/999.jpg', 20, '', '2022-10-27 00:00:42', '2022-10-27 00:00:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(50) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `apellido` varchar(2500) NOT NULL,
  `email` varchar(250) NOT NULL,
  `contraseña` varchar(300) NOT NULL,
  `createdAT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `email`, `contraseña`, `createdAT`, `updatedAt`) VALUES
(1, 'Tomas', 'Mendoza', 'tm145637@gmail.com', '123', '2000-12-03 15:20:12', '2002-12-03 12:20:12'),
(2, '', '', '', '', '2022-09-29 15:12:54', '2022-09-29 15:12:54'),
(3, 'Nancy', 'Ayala', 'tm1453766@gmail.com', '111', '2022-09-29 15:43:40', '2022-09-29 15:43:40'),
(4, 'Markos', 'Díaz', 'test@mail.com', '11234', '2022-09-29 21:03:08', '2022-09-29 21:03:08'),
(5, 'Marcos Nahuel', 'Díaz', 'ma.nahuel.d@gmail.com', '1234', '2022-09-29 21:04:15', '2022-09-29 21:04:15'),
(6, 'Puto ', 'Reputo', 'ricardovaldivia2003@gmail.com', 'puto', '2022-09-30 21:33:34', '2022-09-30 21:33:34'),
(7, 'Nancy', 'Ayala', 'test@gmail.com', '123', '2022-10-17 16:25:59', '2022-10-17 16:25:59'),
(8, 'Tomas', 'mendoza', 'martinrafalperez@gmail.com', '1', '2022-10-23 23:06:57', '2022-10-23 23:06:57');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`id_orden`);

--
-- Indices de la tabla `ordenesitems`
--
ALTER TABLE `ordenesitems`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `id_orden` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ordenesitems`
--
ALTER TABLE `ordenesitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
