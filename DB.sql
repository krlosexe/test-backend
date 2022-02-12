-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 12-02-2022 a las 14:57:07
-- Versión del servidor: 5.7.32
-- Versión de PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hire_clients`
--

CREATE TABLE `hire_clients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nit` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `sector_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `hire_clients`
--

INSERT INTO `hire_clients` (`id`, `name`, `email`, `nit`, `address`, `city`, `sector_id`, `created_at`, `updated_at`, `id_created`) VALUES
(14, 'Javier Cardenas', 'javi@gmail.com', '11717056', 'Barinas', 'Medellin', 2, '2022-02-12 18:25:55', '2022-02-12 18:57:16', 1),
(18, 'Juan Cardenas', 'juan@gmail.com', '2214124', 'Barinas', 'Medellin', 2, '2022-02-12 19:40:32', '2022-02-12 19:40:32', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hire_clients_contacts`
--

CREATE TABLE `hire_clients_contacts` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `hire_clients_contacts`
--

INSERT INTO `hire_clients_contacts` (`id`, `client_id`, `name`, `email`) VALUES
(4, 14, 'Carlos Cardenas', '2222@gmail.com'),
(7, 18, 'Marie Quesada', 'marie.quesada.correa@gmail.com'),
(9, 18, 'Marie Quesada', 'marie.quesada.correa@gmail.com'),
(10, 18, 'Marie Quesada', 'marie.quesada.correa@gmail.com'),
(11, 14, 'Marie Quesada', 'marie.quesada.correa@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hire_sectors`
--

CREATE TABLE `hire_sectors` (
  `id` int(11) NOT NULL,
  `sector_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `hire_sectors`
--

INSERT INTO `hire_sectors` (`id`, `sector_name`) VALUES
(2, '222'),
(4, 'Car2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hire_user`
--

CREATE TABLE `hire_user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(2455) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `hire_user`
--

INSERT INTO `hire_user` (`id`, `name`, `last_name`, `email`, `password`, `last_login`) VALUES
(1, 'Carlos', 'Cardenas', 'cardenascarlos18@gmail.com', '$2y$10$h930Ix9Qw0oIKuk4rDPV6uCsHTt/cpE6juWBxCRMX2kQ6WNI3kXBy', '2022-02-12 03:41:37');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `hire_clients`
--
ALTER TABLE `hire_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hire_client_id_created` (`id_created`),
  ADD KEY `hire_client_id_sector` (`sector_id`);

--
-- Indices de la tabla `hire_clients_contacts`
--
ALTER TABLE `hire_clients_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hire_client_contact_id_client` (`client_id`);

--
-- Indices de la tabla `hire_sectors`
--
ALTER TABLE `hire_sectors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `hire_user`
--
ALTER TABLE `hire_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `hire_clients`
--
ALTER TABLE `hire_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `hire_clients_contacts`
--
ALTER TABLE `hire_clients_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `hire_sectors`
--
ALTER TABLE `hire_sectors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `hire_user`
--
ALTER TABLE `hire_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `hire_clients`
--
ALTER TABLE `hire_clients`
  ADD CONSTRAINT `hire_client_id_created` FOREIGN KEY (`id_created`) REFERENCES `hire_user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `hire_client_id_sector` FOREIGN KEY (`sector_id`) REFERENCES `hire_sectors` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `hire_clients_contacts`
--
ALTER TABLE `hire_clients_contacts`
  ADD CONSTRAINT `hire_client_contact_id_client` FOREIGN KEY (`client_id`) REFERENCES `hire_clients` (`id`) ON UPDATE CASCADE;
