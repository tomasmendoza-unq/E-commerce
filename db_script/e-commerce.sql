-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2022 a las 23:34:42
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
  `estado` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'Chocolate de prueba', 'img/productos/44.jpg', 1000, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It h', 'Chocolate', 1, '2022-11-25 22:02:18', '2022-11-25 22:02:18'),
(2, 'Gominolas', 'img/productos/999.jpg', 1000, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It h', 'Gomitas', 1, '2022-11-25 22:02:57', '2022-11-25 22:02:57'),
(3, 'Bombones test', 'img/productos/20171027_182505.jpg', 2000, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It h', 'Bombones', 1, '2022-11-25 22:03:34', '2022-11-25 22:03:34'),
(4, 'Caramelos', 'img/productos/274282204_4814242625340480_127006461799274787_n.jpg', 3000, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It h', 'Caramelos', 1, '2022-11-25 22:04:04', '2022-11-25 22:04:04'),
(5, 'Pastillas test', 'img/productos/17abf436-32b2-4ce8-9970-3cade98e06e9.jpg', 2000, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It h', 'Pastillitas', 1, '2022-11-25 22:04:38', '2022-11-25 22:04:38'),
(6, 'Malvadiscos', 'img/productos/b68e77d8-5d3b-4197-a8a1-5d66407b86f0.jpg', 3000, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It h', 'Malvadiscos', 1, '2022-11-25 22:05:23', '2022-11-25 22:05:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(50) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `apellido` varchar(2500) NOT NULL,
  `email` varchar(250) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `contraseña` varchar(300) NOT NULL,
  `createdAT` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `email`, `telefono`, `contraseña`, `createdAT`, `updatedAt`) VALUES
(1, 'test', 'test', 'admin@gmail.com', '+541162707458', '123', '2022-11-25 22:12:30', '2022-11-25 22:12:30'),
(2, 'test2', 'test2', 'usuario@gmail.com', '+541162707458', '1', '2022-11-25 22:12:52', '2022-11-25 22:12:52');

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
  MODIFY `id_orden` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ordenesitems`
--
ALTER TABLE `ordenesitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
