-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-11-2022 a las 17:33:53
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
(1, 5, 3001, 'Efectivo', 'DHL', '2022-10-29 00:07:07', '2022-10-29 00:07:07'),
(2, 9, 3001, 'Efectivo', 'Cadete', '2022-11-16 15:12:08', '2022-11-16 15:12:08'),
(3, 1, 748738, 'Débito', 'Cadete', '2022-11-19 15:23:12', '2022-11-19 15:23:12'),
(4, 1, 16232, 'Efectivo', 'Cadete', '2022-11-19 15:54:12', '2022-11-19 15:54:12'),
(5, 1, 131160, 'Débito', 'Correo', '2022-11-19 16:32:02', '2022-11-19 16:32:02');

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
(1, 1, 1, 'bandeja de dientes ', 3000, 2, '2022-10-29', '2022-10-29'),
(2, 2, 1, 'bandeja de dientes ', 3000, 2, '2022-11-16', '2022-11-16'),
(3, 3, 1, 'bandeja de dientes ', 3000, 2, '2022-11-19', '2022-11-19'),
(4, 3, 7, 'prueba', 1000, 1, '2022-11-19', '2022-11-19'),
(5, 3, 2, 'bandeja de dientes ', 1000, 3, '2022-11-19', '2022-11-19'),
(6, 3, 27, '23123', 123123, 6, '2022-11-19', '2022-11-19'),
(7, 4, 5, 'prueba', 1000, 8, '2022-11-19', '2022-11-19'),
(8, 4, 31, 'fwef', 232, 1, '2022-11-19', '2022-11-19'),
(9, 4, 1, 'bandeja de dientes ', 3000, 2, '2022-11-19', '2022-11-19'),
(10, 4, 28, 'w', 2000, 1, '2022-11-19', '2022-11-19'),
(11, 5, 9, 'prueba', 1000, 28, '2022-11-19', '2022-11-19'),
(12, 5, 5, 'prueba', 1000, 15, '2022-11-19', '2022-11-19'),
(13, 5, 1, 'bandeja de dientes ', 3000, 19, '2022-11-19', '2022-11-19'),
(14, 5, 2, 'bandeja de dientes ', 1000, 28, '2022-11-19', '2022-11-19'),
(15, 5, 6, 'prueba', 1000, 2, '2022-11-19', '2022-11-19'),
(16, 5, 31, 'fwef', 232, 5, '2022-11-19', '2022-11-19');

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
  `destacado` tinyint(1) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `imagen`, `precio`, `detalles`, `categoria`, `destacado`, `createdAt`, `updatedAt`) VALUES
(1, 'bandeja de dientes ', 'img/productos/MÃ¡rcia-Moura-Kiwi-II.jpg', 3000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In a eros massa. In ultricies lacus ac justo fermentum, tempor volutpat purus blandit. Curabitur sed sem id nisi luctus elementum. Sed facilisis nulla quis interdum aliquam. Sed id turpis ac ri', 'Chocolate', 1, '2022-11-19 14:36:13', '2022-10-28 20:52:41'),
(2, 'bandeja de dientes ', 'img/productos/deep-space-4k-wallpaper-preview.jpg', 1000, 'tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21tomas21', 'Caramelos', 0, '2022-11-14 00:14:16', '2022-11-14 00:14:16'),
(3, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 0, '2022-11-19 00:49:03', '0000-00-00 00:00:00'),
(4, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 1, '2022-11-19 14:36:06', '0000-00-00 00:00:00'),
(5, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 0, '2022-11-19 00:49:25', '0000-00-00 00:00:00'),
(6, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 0, '2022-11-19 00:49:32', '0000-00-00 00:00:00'),
(7, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 0, '2022-11-19 00:49:39', '0000-00-00 00:00:00'),
(8, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 0, '2022-11-19 00:49:46', '0000-00-00 00:00:00'),
(9, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 0, '2022-11-19 00:49:54', '0000-00-00 00:00:00'),
(10, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 0, '2022-11-19 00:50:00', '0000-00-00 00:00:00'),
(11, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 0, '2022-11-19 00:50:07', '0000-00-00 00:00:00'),
(12, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 0, '2022-11-19 00:50:21', '0000-00-00 00:00:00'),
(13, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 0, '2022-11-19 00:50:22', '0000-00-00 00:00:00'),
(14, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 0, '2022-11-19 00:50:22', '0000-00-00 00:00:00'),
(15, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 0, '2022-11-19 00:50:23', '0000-00-00 00:00:00'),
(16, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 0, '2022-11-19 00:50:23', '0000-00-00 00:00:00'),
(17, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 0, '2022-11-19 00:50:23', '0000-00-00 00:00:00'),
(18, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 0, '2022-11-19 00:50:23', '0000-00-00 00:00:00'),
(19, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 0, '2022-11-19 00:50:23', '0000-00-00 00:00:00'),
(20, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 0, '2022-11-19 00:50:23', '0000-00-00 00:00:00'),
(21, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 0, '2022-11-19 00:50:29', '0000-00-00 00:00:00'),
(22, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 0, '2022-11-19 00:50:29', '0000-00-00 00:00:00'),
(23, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 0, '2022-11-19 00:50:29', '0000-00-00 00:00:00'),
(24, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 0, '2022-11-19 00:50:29', '0000-00-00 00:00:00'),
(25, 'prueba', 'img/productos/44.jpg', 1000, 'lorem', 'gomita', 0, '2022-11-19 00:50:29', '0000-00-00 00:00:00'),
(26, 'bondiola', 'img/productos/Captura de pantalla (2893).png', 2000, '2021203k12oem2kmofm 32kg fk3 gmfk gk 4kg', 'Bombones', 0, '2022-11-19 02:26:16', '2022-11-19 02:26:16'),
(27, '23123', 'img/productos/Captura de pantalla (2892).png', 123123, 'tmaolfrmaemfeomflemfomwflmwoefmewomfwef', 'Gomitas', 1, '2022-11-19 02:47:25', '2022-11-19 02:47:25'),
(28, 'w', 'img/productos/Captura de pantalla (2893).png', 2000, 'tinyint(1)tinyint(1)tinyint(1)tinyint(1)tinyint(1)tinyint(1)tinyint(1)tinyint(1)', 'Chocolate', 1, '2022-11-19 03:01:54', '2022-11-19 03:01:54'),
(29, 'lasm', 'img/productos/Captura de pantalla (2883).png', 123, '123123123123123132123123123123123', 'Pastillas', 0, '2022-11-19 03:03:25', '2022-11-19 03:03:25'),
(30, 'okoe', 'img/productos/Captura de pantalla (2892).png', 2000, '21                <select class=\"form-select d-block w-100\" name=\"categoria\"\r\n                    required=\"\">\r\n                    <option value=\"\">Elegir...</option>\r\n                    <option value=\"Chocolate\">Chocolate</option>\r\n               ', 'Pastillas', 1, '2022-11-19 03:07:29', '2022-11-19 03:07:29'),
(31, 'fwef', 'img/productos/Captura de pantalla (2888).png', 232, '21321213                <select class=\"form-select d-block w-100\" name=\"categoria\"\r\n                    required=\"\">\r\n                    <option value=\"\">Elegir...</option>\r\n                    <option value=\"Chocolate\">Chocolate</option>\r\n         ', 'Caramelos', 1, '2022-11-19 03:09:11', '2022-11-19 03:09:11');

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
(1, 'tomas', 'mendoza', 'mendoza.tomas@gmail.com', '1', '2022-11-19 02:18:09', '2022-11-19 02:18:09'),
(2, 'Toma', '123', 'tm1453766@gmail.com', '123', '2022-11-19 02:29:14', '2022-11-19 02:29:14');

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
  MODIFY `id_orden` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ordenesitems`
--
ALTER TABLE `ordenesitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
