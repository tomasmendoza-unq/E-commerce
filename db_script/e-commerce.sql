-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-11-2022 a las 02:05:03
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
(1, 5, 3001, 'Efectivo', 'DHL', '2022-10-29 00:07:07', '2022-10-29 00:07:07');

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
(1, 1, 1, 'bandeja de dientes ', 3000, 2, '2022-10-29', '2022-10-29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `imagen` varchar(2500) NOT NULL,
  `precio` int(250) NOT NULL,
  `detalles` varchar(250) NOT NULL,
  `categoria` varchar(200) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `imagen`, `precio`, `detalles`, `categoria`, `createdAt`, `updatedAt`) VALUES
(1, 'bandeja de dientes ', 'img/productos/MÃ¡rcia-Moura-Kiwi-II.jpg', 3000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In a eros massa. In ultricies lacus ac justo fermentum, tempor volutpat purus blandit. Curabitur sed sem id nisi luctus elementum. Sed facilisis nulla quis interdum aliquam. Sed id turpis ac ri', 'Caramelos', '2022-10-28 20:52:41', '2022-10-28 20:52:41'),
(2, 'bandeja de dientes ', 'img/productos/deep-space-4k-wallpaper-preview.jpg', 1000, 'tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21', 'Caramelos', '2022-11-14 00:14:16', '2022-11-14 00:14:16');

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
(8, 'Tomas', 'mendoza', 'martinrafalperez@gmail.com', '1', '2022-10-23 23:06:57', '2022-10-23 23:06:57'),
(9, 'Tomas', 'Mendoza', 'mendoza.tomas@gmail.com', '1', '2022-11-05 01:44:27', '2022-11-05 01:44:27');

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
  MODIFY `id_orden` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ordenesitems`
--
ALTER TABLE `ordenesitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
