-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql:3306
-- Tiempo de generación: 12-10-2020 a las 00:04:42
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `test`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cats`
--

CREATE TABLE `cats` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cats`
--

INSERT INTO `cats` (`id`, `name`) VALUES
(1, 'Lola'),
(2, 'Kitty');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dogs`
--

CREATE TABLE `dogs` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `dogs`
--

INSERT INTO `dogs` (`id`, `name`) VALUES
(1, 'Lola'),
(2, 'Bella');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `managerId` int(11) DEFAULT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `employees`
--

INSERT INTO `employees` (`id`, `managerId`, `name`) VALUES
(1, NULL, 'John'),
(2, 1, 'Mike');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees_9`
--

CREATE TABLE `employees_9` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `stateId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `employees_9`
--

INSERT INTO `employees_9` (`id`, `name`, `stateId`) VALUES
(1, 'Jaden', 1),
(2, 'Abby', 1),
(3, 'Amaya', 2),
(4, 'Robert', 3),
(5, 'Tom', 4),
(6, 'William', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enrollments`
--

CREATE TABLE `enrollments` (
  `id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `student` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `enrollments`
--

INSERT INTO `enrollments` (`id`, `year`, `student`) VALUES
(1, 20, 1),
(2, 55, 2),
(3, 100, 3),
(4, 250, 4),
(5, 500, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `sellerId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `items`
--

INSERT INTO `items` (`id`, `name`, `sellerId`) VALUES
(1, 'Notebook', 2),
(2, 'Stapler', 1),
(3, 'Pencil', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regions`
--

CREATE TABLE `regions` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `regions`
--

INSERT INTO `regions` (`id`, `name`) VALUES
(1, 'North'),
(2, 'South'),
(3, 'East'),
(4, 'West'),
(5, 'Midwest');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'Project Manager'),
(2, 'Solution Architect');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `employeeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`id`, `amount`, `employeeId`) VALUES
(1, 2000, 1),
(2, 3000, 2),
(3, 4000, 3),
(4, 1200, 4),
(5, 2400, 5);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `SalesAvg`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `SalesAvg` (
`region` varchar(50)
,`average` decimal(36,4)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sellers`
--

CREATE TABLE `sellers` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sellers`
--

INSERT INTO `sellers` (`id`, `name`, `rating`) VALUES
(1, 'Roger', 3),
(2, 'Penny', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `duration` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `duration`) VALUES
(1, 1, '10'),
(2, 2, '18'),
(3, 1, '14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `regionId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `states`
--

INSERT INTO `states` (`id`, `name`, `regionId`) VALUES
(1, 'Minnesota', 1),
(2, 'Texas', 2),
(3, 'California', 3),
(4, 'Columbia', 4),
(5, 'Indiana', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `students`
--

INSERT INTO `students` (`id`, `firstName`, `lastName`) VALUES
(1, 'Juan', 'Perez'),
(2, 'John', 'Conor'),
(3, 'john', 'Max'),
(4, 'JOHN', 'R'),
(5, 'Maria', 'Perez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `userName`) VALUES
(1, 'Steven Smith'),
(2, 'Brian Burns');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_roles`
--

CREATE TABLE `users_roles` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users_roles`
--

INSERT INTO `users_roles` (`userId`, `roleId`) VALUES
(1, 1),
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estructura para la vista `SalesAvg`
--
DROP TABLE IF EXISTS `SalesAvg`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `SalesAvg`  AS  (select `R`.`name` AS `region`,(case when (sum(ifnull(`SL`.`amount`,0)) = 0) then 0 else (sum(ifnull(`SL`.`amount`,0)) / count(distinct `E`.`id`)) end) AS `average` from (((`regions` `R` left join `states` `S` on((`R`.`id` = `S`.`regionId`))) left join `employees_9` `E` on((`S`.`id` = `E`.`stateId`))) left join `sales` `SL` on((`E`.`id` = `SL`.`employeeId`))) group by `R`.`id`,`R`.`name`) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cats`
--
ALTER TABLE `cats`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dogs`
--
ALTER TABLE `dogs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `employees_9`
--
ALTER TABLE `employees_9`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`userId`,`roleId`),
  ADD KEY `roleId` (`roleId`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `users_roles`
--
ALTER TABLE `users_roles`
  ADD CONSTRAINT `users_roles_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_roles_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
