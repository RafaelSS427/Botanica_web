-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-02-2020 a las 01:38:29
-- Versión del servidor: 10.1.39-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `plantas_caribe`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarProducto` (IN `nombre` VARCHAR(50))  BEGIN
    SET @name = nombre; 
	SELECT * FROM producto WHERE nombre_producto LIKE '%@name%';
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `id_admin` int(11) NOT NULL,
  `username_admin` varchar(30) NOT NULL,
  `pass_admin` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`id_admin`, `username_admin`, `pass_admin`) VALUES
(14, 'admin', '$2a$10$.szVwNpQ9LoYK6vHSoYnDe3/30Ucjfb3FKu1UlrFVvnk4Jl9oNMQS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

CREATE TABLE `categoria_producto` (
  `id_cp` int(11) NOT NULL,
  `nombre_cp` varchar(50) DEFAULT NULL,
  `desc_cp` varchar(255) DEFAULT NULL,
  `foto_cp` varchar(155) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`id_cp`, `nombre_cp`, `desc_cp`, `foto_cp`) VALUES
(1, 'Macetas', 'Macetas de todos los tipos, perfectas para el interior de su casa y jardin', 'macetasCat.jpg'),
(2, 'Plantas', 'Increible catalogo de plantas para su hogar', 'plantaCat.jpg'),
(3, 'Tierra', 'Utilice la mejor tierra para sus plantas', 'tierraCat.jpg'),
(4, 'Semillas', 'Obtenga las mejores semillas en este apartado para su hogar', 'semillasCat.jpg'),
(5, 'Fertilizantes', 'Fertilizantes para el cuidado de sus plantas, aproveche', '1581031113686fertilizantesCat.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cl` int(11) NOT NULL,
  `tarjeta_cl` varchar(25) DEFAULT NULL,
  `dir_cl` varchar(30) DEFAULT NULL,
  `tlf_cl` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cl`, `tarjeta_cl`, `dir_cl`, `tlf_cl`) VALUES
(1, '7519 5506 6686 5586 ', 'Puntarenas', '59207544'),
(2, '5114 5023 5152 8474 ', 'Cartago', '55025826'),
(3, '7438 9971 9552 5104 ', 'Alajuela', '69458392'),
(4, '7062 6314 5076 5933 ', 'Limón', '55256531'),
(5, '9656 5738 9485 6436 ', 'Limón', '78339574'),
(6, '6361 9716 7422 9310 ', 'Puntarenas', '88172306'),
(7, '8369 5826 6163 7736 ', 'Guanacaste', '79995207'),
(8, '9447 6633 8865 8979 ', 'Cartago', '68265052'),
(9, '6775 7161 7230 5929 ', 'Heredia', '55704660'),
(10, '7648 7174 8688 5641 ', 'Alajuela', '58019672'),
(11, '7221 9065 7299 7929 ', 'Heredia', '66280924'),
(12, '9263 5527 8384 5452 ', 'Limón', '65148893'),
(13, '9544 9748 8553 5917 ', 'Limón', '65995943'),
(14, '7097 8689 7006 6555 ', 'Heredia', '57646656'),
(15, '5725 9586 9770 6753 ', 'Puntarenas', '89089231'),
(16, '9019 9378 6597 7055 ', 'Heredia', '66994038'),
(17, '8392 9927 7329 7657 ', 'Alajuela', '69798370'),
(18, '5442 9472 6969 5885 ', 'Puntarenas', '86255735'),
(19, '7499 6655 8827 8574 ', 'Puntarenas', '75719418'),
(20, '9605 5341 9217 7772 ', 'Guanacaste', '67288585'),
(21, '7953 7832 7610 6791 ', 'Cartago', '89647145'),
(22, '7700 7096 5354 7444 ', 'Cartago', '77839665'),
(23, '7787 8893 8771 8717 ', 'Limón', '79422867'),
(24, '7816 7297 9237 9608 ', 'Puntarenas', '58636372'),
(25, '7316 8854 8215 8241 ', 'Guanacaste', '87623014'),
(26, '5567 6027 9455 7269 ', 'Cartago', '58314068'),
(27, '5250 6449 6563 5741 ', 'San José', '69624278'),
(28, '6862 7147 7635 8957 ', 'Alajuela', '69040867'),
(29, '5028 5355 7139 7606 ', 'Alajuela', '79978946'),
(30, '8452 8808 8706 8835 ', 'Heredia', '56289572'),
(31, '8150 7670 8805 5877 ', 'Alajuela', '88502970'),
(32, '6475 5071 5337 8772 ', 'Puntarenas', '76382517'),
(33, '9658 6366 6966 7325 ', 'Puntarenas', '85723402'),
(34, '8831 7510 5180 8189 ', 'Heredia', '56157968'),
(35, '7398 5797 7918 6480 ', 'San José', '76633396'),
(36, '5811 7401 6631 5881 ', 'Limón', '59541850'),
(37, '6322 8903 8710 9009 ', 'San José', '85172311'),
(38, '9194 7318 9943 9525 ', 'Heredia', '69574085'),
(39, '9188 5925 6512 8528 ', 'Guanacaste', '57674019'),
(40, '5246 8465 8150 7124 ', 'Cartago', '65856003'),
(41, '6743 9307 7800 7824 ', 'Alajuela', '86225026'),
(42, '8413 7473 5040 8048 ', 'San José', '57728549'),
(43, '5337 8526 9751 5290 ', 'San José', '69540019'),
(44, '7585 8070 5449 7444 ', 'Cartago', '67237905'),
(45, '5330 6674 7491 5775 ', 'Cartago', '85518967'),
(46, '9791 8368 5083 5863 ', 'Guanacaste', '67026326'),
(47, '5043 8322 8960 5295 ', 'Guanacaste', '87097825'),
(48, '9917 9287 5974 7713 ', 'San José', '56335240'),
(49, '6242 7981 6617 8028 ', 'Heredia', '68673288'),
(50, '6386 7257 8040 8240 ', 'Alajuela', '69911932'),
(51, '7501 6201 5855 7632 ', 'Guanacaste', '59178245'),
(52, '9545 6867 7901 9865 ', 'Cartago', '89560389'),
(53, '6625 6020 5426 5167 ', 'Alajuela', '88543861'),
(54, '6477 8917 6840 6827 ', 'Limón', '75614399'),
(55, '5682 7138 5554 6436 ', 'San José', '85620027'),
(56, '6016 9914 8924 6841 ', 'Heredia', '55682911'),
(57, '9007 6582 5219 9423 ', 'Guanacaste', '87780004'),
(58, '8171 6577 6796 8311 ', 'Alajuela', '67523586'),
(59, '7633 8808 7938 9117 ', 'Alajuela', '68126955'),
(60, '6224 8380 7586 9968 ', 'Heredia', '76942719');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_registrado`
--

CREATE TABLE `cliente_registrado` (
  `nom_clr` varchar(15) DEFAULT NULL,
  `ced_clr` varchar(12) DEFAULT NULL,
  `totalComp_clr` int(11) DEFAULT NULL,
  `puntos_clr` int(11) DEFAULT NULL,
  `apell1_clr` varchar(15) DEFAULT NULL,
  `apell2_clr` varchar(15) DEFAULT NULL,
  `id_cl2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras_estaticasdos`
--

CREATE TABLE `compras_estaticasdos` (
  `id_compra` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `username_user` varchar(30) DEFAULT NULL,
  `targeta_user` varchar(30) DEFAULT NULL,
  `cedula_user` varchar(30) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `nombre_producto` varchar(30) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `nombre_cp` varchar(30) DEFAULT NULL,
  `fecha_compra` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_cp2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compras_estaticasdos`
--

INSERT INTO `compras_estaticasdos` (`id_compra`, `id_user`, `username_user`, `targeta_user`, `cedula_user`, `id_producto`, `nombre_producto`, `precio`, `nombre_cp`, `fecha_compra`, `id_cp2`) VALUES
(1, 3, 'MariaP', '123456785', '702700601', 7, 'Maceta Ivory', 20100, 'Macetas', '2020-02-11 00:32:49', 1),
(2, 3, 'MariaP', '123456785', '702700601', 3, 'Fertilizante granulado', 8000, 'Fertilizantes', '2020-02-11 00:32:59', 5),
(3, 3, 'MariaP', '123456785', '702700601', 4, 'Semillas de Papaya', 3500, 'Semillas', '2020-02-11 00:33:05', 4),
(4, 3, 'MariaP', '123456785', '702700601', 1, 'Diente de Leon', 4250, 'Plantas', '2020-02-11 00:33:14', 2),
(5, 4, 'Mario2k', '000000002', '702900602', 7, 'Maceta Ivory', 20100, 'Macetas', '2020-02-11 00:33:47', 1),
(6, 4, 'Mario2k', '000000002', '702900602', 7, 'Maceta Ivory', 20100, 'Macetas', '2020-02-11 00:33:49', 1),
(7, 4, 'Mario2k', '000000002', '702900602', 5, 'Tierra para Macetas', 5000, 'Tierra', '2020-02-11 00:33:54', 3),
(8, 4, 'Mario2k', '000000002', '702900602', 4, 'Semillas de Papaya', 3500, 'Semillas', '2020-02-11 00:33:58', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras_producto`
--

CREATE TABLE `compras_producto` (
  `id_compra` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `fecha_compra` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compras_producto`
--

INSERT INTO `compras_producto` (`id_compra`, `id_user`, `id_producto`, `fecha_compra`) VALUES
(1, 3, 7, '2020-02-11 00:32:49'),
(2, 3, 3, '2020-02-11 00:32:59'),
(3, 3, 4, '2020-02-11 00:33:05'),
(4, 3, 1, '2020-02-11 00:33:14'),
(5, 4, 7, '2020-02-11 00:33:47'),
(6, 4, 7, '2020-02-11 00:33:49'),
(7, 4, 5, '2020-02-11 00:33:54'),
(8, 4, 4, '2020-02-11 00:33:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_fact`
--

CREATE TABLE `detalle_fact` (
  `id_df` int(11) NOT NULL,
  `cant_df` int(11) DEFAULT NULL,
  `precio_df` int(11) DEFAULT NULL,
  `id_p2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrega`
--

CREATE TABLE `entrega` (
  `id_f2` int(11) DEFAULT NULL,
  `id_transportista2` int(11) DEFAULT NULL,
  `estado_ent` int(11) DEFAULT NULL,
  `fecha_ent` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL,
  `id_cl3` int(11) DEFAULT NULL,
  `id_transportista2` int(11) DEFAULT NULL,
  `monto_factura` int(11) DEFAULT NULL,
  `fecha_fact` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `id_cl3`, `id_transportista2`, `monto_factura`, `fecha_fact`) VALUES
(1, 1, 1, 2500, '2018-01-24'),
(2, 2, 2, 7000, '2018-06-01'),
(3, 3, 3, 5000, '2019-00-11'),
(4, 4, 4, 2000, '2018-10-28'),
(5, 5, 5, 2000, '2020-00-04'),
(6, 6, 6, 13450, '2017-04-24'),
(7, 7, 7, 4350, '2020-07-04'),
(8, 8, 8, 5005, '2020-11-02'),
(9, 9, 9, 3000, '2018-00-09'),
(10, 10, 10, 9555, '2019-06-19'),
(11, 11, 11, 5860, '2019-10-25'),
(12, 12, 12, 11500, '2017-05-18'),
(13, 13, 13, 9780, '2018-01-01'),
(14, 14, 14, 7580, '2020-07-30'),
(15, 15, 15, 10500, '2017-06-02'),
(16, 16, 16, 5500, '2017-02-27'),
(17, 17, 17, 13450, '2017-11-08'),
(18, 18, 18, 20000, '2019-02-08'),
(19, 19, 19, 2500, '2020-11-17'),
(20, 20, 20, 5750, '2019-07-23'),
(21, 21, 21, 12000, '2017-03-03'),
(22, 22, 22, 12000, '2020-11-30'),
(23, 23, 23, 20000, '2020-09-23'),
(24, 24, 24, 5000, '2019-09-11'),
(25, 25, 25, 4590, '2019-00-28'),
(26, 26, 26, 6100, '2017-09-18'),
(27, 27, 27, 5750, '2019-09-28'),
(28, 28, 28, 13500, '2019-05-05'),
(29, 29, 29, 2500, '2017-01-10'),
(30, 30, 30, 6500, '2017-06-17'),
(31, 31, 31, 5005, '2018-02-12'),
(32, 32, 32, 7000, '2017-09-02'),
(33, 33, 33, 10500, '2020-02-01'),
(34, 34, 34, 4000, '2018-09-07'),
(35, 35, 35, 5860, '2018-09-30'),
(36, 36, 36, 3650, '2018-08-09'),
(37, 37, 37, 12000, '2019-04-28'),
(38, 38, 38, 10500, '2018-01-05'),
(39, 39, 39, 2500, '2017-01-19'),
(40, 40, 40, 6500, '2019-07-05');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `getclientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `getclientes` (
`id_cl` int(11)
,`tarjeta_cl` varchar(25)
,`dir_cl` varchar(30)
,`tlf_cl` varchar(8)
,`nom_clr` varchar(15)
,`ced_clr` varchar(12)
,`totalComp_clr` int(11)
,`puntos_clr` int(11)
,`apell1_clr` varchar(15)
,`apell2_clr` varchar(15)
,`id_cl2` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `get_compra_productos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `get_compra_productos` (
`id_compra` int(11)
,`id_user` int(11)
,`username_user` varchar(60)
,`targeta_user` varchar(16)
,`cedula_user` varchar(25)
,`id_producto` int(11)
,`nombre_producto` varchar(50)
,`precio` int(11)
,`nombre_cp` varchar(50)
,`fecha_compra` timestamp
,`id_cp2` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `get_producto`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `get_producto` (
`id_producto` int(11)
,`nombre_producto` varchar(50)
,`caracteristica_producto` varchar(100)
,`precio` int(11)
,`imagen_producto` varchar(255)
,`id_cp` int(11)
,`nombre_cp` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(50) DEFAULT NULL,
  `caracteristica_producto` varchar(100) DEFAULT NULL,
  `precio` int(11) NOT NULL,
  `imagen_producto` varchar(255) DEFAULT NULL,
  `id_cp2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre_producto`, `caracteristica_producto`, `precio`, `imagen_producto`, `id_cp2`) VALUES
(1, 'Diente de Leon', 'Sus hojas se consumen en ensalada', 4250, '1581015207971dienteLeonPro.jpg', 2),
(2, 'Maceta', 'Maceta con un tamano de 25 cm', 15100, 'macetaPro.jpg', 1),
(3, 'Fertilizante granulado', 'Fertilizante granulado para plantas con un tamano de 50kg', 8000, 'fertilizantePro.png', 5),
(4, 'Semillas de Papaya', 'Semillas de papaya, paquete blanco, precio comodo', 3500, 'papayaPro.jpg', 4),
(5, 'Tierra para Macetas', 'Sustrato de tierra para macetas', 5000, 'tierraMacetaPrp.jpg', 3),
(6, 'Plato Maceta', 'Plato para maceta, con longitud de 22 cm', 5100, 'platoMacetaPro.jpg', 1),
(7, 'Maceta Ivory', 'Maceta de 55 cm', 20100, '1580914351477maceta2k.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nombre_proveedor` varchar(30) DEFAULT NULL,
  `cedula_proveedor` bigint(20) DEFAULT NULL,
  `telefono_proveedor` int(11) DEFAULT NULL,
  `direccion_proveedor` varchar(50) DEFAULT NULL,
  `cuenta_proveedor` varchar(45) DEFAULT NULL,
  `correo_proveedor` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nombre_proveedor`, `cedula_proveedor`, `telefono_proveedor`, `direccion_proveedor`, `cuenta_proveedor`, `correo_proveedor`) VALUES
(110000, 'Indianapolis', 775555244, 21256839, ' SanJose,Costa Rica', 'CR67014900030050598977', 'Indianapolis@Ventas.com'),
(110810, 'ARSA', 3101232452, 27342215, 'Guadalupe, San Jose Costa Rica', 'CR61015100010010509557', 'ventas@disarsa.com'),
(110811, 'Dos Pinos', 3004045002, 25082500, 'Alajuela, Costa Rica', 'CR47013100010010590857', ' centrodecontactos@dospinos.co'),
(110812, 'Pozuelo', 3404045202, 22082500, 'Zona Industrial SanJose, Costa Rica', 'CR67013100010010598557', ' zonaIndustrial@pozuelo.com'),
(110813, 'Europartes Vega S.A.', 3404045202, 22237733, 'Barrio Lujan. 100 E del costado norte de las Ofici', 'CR77013800010010598557', ' Europartes@empresarial.com'),
(110814, 'Alpine Properties S.A', 3404045212, 22237839, '300m oeste y 10 sur de Pizza Hut, Tibas, San Jose,', 'CR77013800010010598567', ' Alpine@Industrial.com'),
(110815, 'Mayorista de Llantas S.A', 3415045216, 28237839, 'San Jose, Costa Rica', 'CR77013800010010598997', 'MayoristaLlanta@sociedadMayori'),
(110817, 'AgroCooperativa Azucar Regiona', 3455045217, 26237839, 'Guanacaste, Costa Rica', 'CR67013900030010598997', 'AgroCOazucar@sociedadMayorista'),
(110818, 'YAMAHA', 775545255, 21257839, ' SanJose,Costa Rica', 'CR67014900030050598997', 'Yamaha@contactos.com'),
(110819, 'Kraft-Foods', 665555244, 23256839, ' SanJose parque Empresarial,Costa Rica', 'CR67014900031050598977', 'KraftFoods@ServicioAlCliente.c'),
(110821, 'CEMACO', 665544244, 22256669, ' SanJose ,Costa Rica', 'CR67014900031050598977', 'CEMACO@Contactos.com'),
(110822, 'Mayorista Salsas', 3101232452, 27342215, 'Guadalupe, San Jose Costa Rica', 'CR61015100010010599557', 'ventas@dMayoristaSalsas.com'),
(110823, 'Mayorista Frutas y Verduras Zo', 3004045002, 25082500, 'Alajuela, Costa Rica', 'CR47013100010010598557', ' centrodecontactos@MayoristaFr'),
(110824, 'Mayorista Frutas y Verduras Zo', 3404045202, 22082500, 'Zona Industrial SanJose, Costa Rica', 'CR67013400010010598557', ' zonaIndustrial@pozuelo.com'),
(110825, 'Grupo ABC', 3404045202, 26237735, 'Heredia, Costa Rica', 'CR77013800010010598557', ' GrupoABCs@empresarial.com'),
(110826, 'Yamuni', 3404045212, 22237839, '300m oeste y 10 sur de Pizza Hut, Tibas, San Jose,', 'CR77013800010210598567', ' Yamuni@Industrial.com'),
(110827, 'PANASONIC', 3415045216, 28237839, 'San Jose, Costa Rica', 'CR77013810010780598997', 'PANASONIC@sociedadMayoristaSA.'),
(110828, 'PALTRON', 3455045217, 26237839, 'Guanacaste, Costa Rica', 'CR67013900030040598997', 'PALTRONC@sociedadMayoristaSA.c'),
(110829, 'ELECTRONICOS', 775544455, 22257839, ' SanJose,Costa Rica', 'CR67014900030050598997', 'ELECTRONICOS@contactos.com'),
(110831, 'CICADEX', 775555244, 21256839, ' SanJose,Costa Rica', 'CR67014900030050598977', 'Cicadex@Ventas.com'),
(110832, 'Tiendas-Siman', 661553244, 23256811, ' SanJose parque Empresarial,Costa Rica', 'CR67014922031051598977', 'SIMAN@ServicioAlCliente.com'),
(110833, 'CompraMas', 3004045002, 25082500, 'Alajuela, Costa Rica', 'CR47013100010010598557', ' centrodecontactos@CompraMas.c'),
(110834, 'Textiles.S.A', 3404045202, 22082500, 'Zona Industrial SanJose, Costa Rica', 'CR13013102010010518557', ' zonaIndustrial@TextilesSA.com'),
(110835, 'Autopartes S.A', 1414045202, 22131713, 'Cartago,Costa Rica', 'CR17013101019010598557', ' AutOpartes@empresarial.com'),
(110836, 'CaribeDrinksS.A', 3404042222, 21137839, 'Limon, Costa Rica', 'CR37313830017010598567', ' CaribeDrinks@Industrial.com'),
(110837, 'ExpoCeramicas', 3411015216, 28237839, 'San Jose, Costa Rica', 'CR12013860010010598997', 'MayoristaCeramica@sociedadMayo'),
(110838, 'ASECO', 3455041217, 21237839, 'Guanacaste, Costa Rica', 'CR67013903030010598997', 'ASECO@sociedadMayoristaSA.com'),
(110839, 'DENCO', 7855452553, 21857839, ' SanJose,Costa Rica', 'CR11014400030150598994', 'DENCO@contactos.com'),
(112854, 'LittleWorld', 661523244, 23226811, ' SanJose parque Empresarial,Costa Rica', 'CR67013922031050598977', 'LittleWorld@ServicioAlCliente.'),
(213223, 'Walmart', 775555224, 21252839, ' SanJose,Costa Rica', 'CR67014900020050598977', 'LimpiaMasConMenos@Ventas.com'),
(222852, 'LimpiaMasConMenos', 775542455, 22227239, ' SanJose,Costa Rica', 'CR67011700030050598997', 'ELECTRONICOS@contactos.com'),
(311851, 'PartesYCambiosMayoreo', 3455045217, 26231831, 'Guanacaste, Costa Rica', 'CR51013200030010598997', 'PartesYCambios@sociedadMayoris'),
(331845, 'Agrupacion Carnica', 3004045002, 25082502, 'Alajuela, Costa Rica', 'CR47013100010010598557', ' centrodecontactos@MayoristaFr'),
(343846, 'Grupo Toledo S.A', 3404045202, 22082505, 'Zona Industrial SanJose, Costa Rica', 'CR67013150010010598557', ' carnicos@contactosConsumidor.'),
(763948, 'Almacenes del Grupo JOM', 3404045217, 22237839, '300m oeste y 10 sur de Pizza Hut, Tibas, San Jose,', 'CR17013800010010598567', ' JOM@MayoristaJOM.com'),
(2318456, 'Cooperativa de Carniceros', 3101232453, 27342215, 'Guadalupe, San Jose Costa Rica', 'CR61015103010010599557', 'ventas@CoopeCarnicos.com'),
(7538947, 'Almacenes de Mayoreo darpa', 3404045206, 26237735, 'Heredia, Costa Rica', 'CR77113800010010598557', ' darpas@empresarial.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('2UKVRXctrCqNJrn78LTDe2TsHrj1JEos', 1581317285, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"admin\":true,\"passport\":{\"user\":14}}'),
('7hnyzopvxu90I1Xa06ilp5u71HgijTv2', 1581467845, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('BADtSH5LhE0Ti9rexYVHeFBB8dtsrWSV', 1581309958, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('oAaWqy6v2Jc1Z1TYuZg-t900l5zJnJpU', 1581302143, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('q4ouRSU7ZNc0GfRctcrTuU67Zg4Rg1W5', 1581302132, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"admin\":true,\"passport\":{\"user\":14}}'),
('uI2RY2wnc--y3rajpcbzoGgtgFoFLekD', 1581348304, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transportista`
--

CREATE TABLE `transportista` (
  `id_transportista` int(11) NOT NULL,
  `nombre_transportista` varchar(15) DEFAULT NULL,
  `apellido_transportista` varchar(15) DEFAULT NULL,
  `telefono_transportista` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `transportista`
--

INSERT INTO `transportista` (`id_transportista`, `nombre_transportista`, `apellido_transportista`, `telefono_transportista`) VALUES
(1, 'Álvaro', 'Picado', '86369011'),
(2, 'Marcos', 'Pérez', '86432011'),
(3, 'Armando', 'Martínez', '86360023'),
(4, 'Manuel', 'Rodríguez', '88430011'),
(5, 'Ariel', 'Solís', '68652023'),
(6, 'Magdiel', 'Meléndez', '77094211'),
(7, 'Juan', 'Ruiz', '63603098'),
(8, 'Pedro', 'Quesada', '85872340'),
(9, 'Carlos', 'Franceschi', '60078993'),
(10, 'Sebastián', 'Mora', '61988734'),
(11, 'Julio', 'Mora', '86009871'),
(12, 'Melissa', 'Serrano', '88923457'),
(13, 'Pablo', 'Cabrera', '86370901'),
(14, 'Jeremy', 'Toruño', '86866868'),
(15, 'José', 'Zúñiga', '70823413'),
(16, 'Alejandro', 'Morales', '86441045'),
(17, 'Juan', 'Córdoba', '88238923'),
(18, 'Iván', 'Campbell', '60112311'),
(19, 'Jeffry', 'Zapata', '88890452'),
(20, 'Josué', 'Solano', '66839011'),
(21, 'Luis', 'Soto', '83378053'),
(22, 'Pablo', 'Arias', '77540123'),
(23, 'Rafael', 'Hernández', '88463956'),
(24, 'José', 'Cordero', '87542341'),
(25, 'Dennis', 'Jackson', '86345953'),
(26, 'Ligia', 'Bastos', '56432551'),
(27, 'Alex', 'Luna', '63287498'),
(28, 'María', 'Cedeño', '72908711'),
(29, 'José', 'Wilson', '86301236'),
(30, 'Erick', 'Pérez', '86432011'),
(31, 'Kendy', 'Torres', '78394624'),
(32, 'Martha', 'Uva', '88885709'),
(33, 'Alexis', 'Watson', '63623095'),
(34, 'Kenny', 'Ramírez', '56432151'),
(35, 'Miguel', 'Rojas', '73548375'),
(36, 'Verónica', 'Johnson', '71934839'),
(37, 'Felipe', 'Rodríguez', '60606055'),
(38, 'Ezequiel', 'Cruz', '60432006'),
(39, 'Randy', 'Gómez', '81823649'),
(40, 'Andrey', 'Arroyo', '60069837');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username_user` varchar(60) NOT NULL,
  `pass_user` varchar(60) NOT NULL,
  `nombre_user` varchar(30) NOT NULL,
  `apellido_user` varchar(20) NOT NULL,
  `targeta_user` varchar(16) NOT NULL,
  `dir_user` varchar(60) NOT NULL,
  `tel_user` varchar(8) NOT NULL,
  `cedula_user` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `username_user`, `pass_user`, `nombre_user`, `apellido_user`, `targeta_user`, `dir_user`, `tel_user`, `cedula_user`) VALUES
(1, 'Rafael427', '$2a$10$R0okjq.rXz.rIMruKIBuX.jnv1YSk0fPFu9fSGLZTqYhPFgcE1T9a', 'Rafael', 'Sequeira', '123456789', '', '', '702800601'),
(3, 'MariaP', '$2a$10$BUh3rYci8oFlT1P9VEk4seeNqqpMHlOYvQvHCXL2f26FzndicRH2i', 'Maria', 'Perez', '123456785', 'Heredia', '87654321', '702700601'),
(4, 'Mario2k', '$2a$10$r0wp2yrzfNkNl.U61C7wGe3L26Fd2wPj1UY4rHG20LJgC5MKUc4Cq', 'Mario', 'Castillo', '000000002', 'Talamanca', '81726354', '702900602'),
(5, 'Vannessa09', '$2a$10$zIpaIkvQnM4J.lOZKqAg/uX2sJ4Z5qsjWCvOU8uvONIJX52A2osOq', 'Vannesaa', 'Sandoval', '61731739', 'Talamanca ', '85365753', '000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_productos`
--

CREATE TABLE `ventas_productos` (
  `numeroCompras` int(11) NOT NULL,
  `nombreProducto` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `viewventas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `viewventas` (
`COUNT(nombre_producto)` bigint(21)
,`nombre_producto` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `getclientes`
--
DROP TABLE IF EXISTS `getclientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `getclientes`  AS  select `cliente`.`id_cl` AS `id_cl`,`cliente`.`tarjeta_cl` AS `tarjeta_cl`,`cliente`.`dir_cl` AS `dir_cl`,`cliente`.`tlf_cl` AS `tlf_cl`,`cliente_registrado`.`nom_clr` AS `nom_clr`,`cliente_registrado`.`ced_clr` AS `ced_clr`,`cliente_registrado`.`totalComp_clr` AS `totalComp_clr`,`cliente_registrado`.`puntos_clr` AS `puntos_clr`,`cliente_registrado`.`apell1_clr` AS `apell1_clr`,`cliente_registrado`.`apell2_clr` AS `apell2_clr`,`cliente_registrado`.`id_cl2` AS `id_cl2` from (`cliente` join `cliente_registrado` on((`cliente`.`id_cl` = `cliente_registrado`.`id_cl2`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `get_compra_productos`
--
DROP TABLE IF EXISTS `get_compra_productos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `get_compra_productos`  AS  select `compras_producto`.`id_compra` AS `id_compra`,`users`.`id_user` AS `id_user`,`users`.`username_user` AS `username_user`,`users`.`targeta_user` AS `targeta_user`,`users`.`cedula_user` AS `cedula_user`,`producto`.`id_producto` AS `id_producto`,`producto`.`nombre_producto` AS `nombre_producto`,`producto`.`precio` AS `precio`,`categoria_producto`.`nombre_cp` AS `nombre_cp`,`compras_producto`.`fecha_compra` AS `fecha_compra`,`producto`.`id_cp2` AS `id_cp2` from (((`compras_producto` join `users`) join `producto`) join `categoria_producto`) where ((`compras_producto`.`id_user` = `users`.`id_user`) and (`compras_producto`.`id_producto` = `producto`.`id_producto`) and (`producto`.`id_cp2` = `categoria_producto`.`id_cp`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `get_producto`
--
DROP TABLE IF EXISTS `get_producto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `get_producto`  AS  select `producto`.`id_producto` AS `id_producto`,`producto`.`nombre_producto` AS `nombre_producto`,`producto`.`caracteristica_producto` AS `caracteristica_producto`,`producto`.`precio` AS `precio`,`producto`.`imagen_producto` AS `imagen_producto`,`categoria_producto`.`id_cp` AS `id_cp`,`categoria_producto`.`nombre_cp` AS `nombre_cp` from (`producto` join `categoria_producto`) where (`producto`.`id_cp2` = `categoria_producto`.`id_cp`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `viewventas`
--
DROP TABLE IF EXISTS `viewventas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewventas`  AS  select count(`compras_estaticasdos`.`nombre_producto`) AS `COUNT(nombre_producto)`,`compras_estaticasdos`.`nombre_producto` AS `nombre_producto` from `compras_estaticasdos` group by `compras_estaticasdos`.`nombre_producto` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`id_cp`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cl`);

--
-- Indices de la tabla `cliente_registrado`
--
ALTER TABLE `cliente_registrado`
  ADD KEY `id_cl2` (`id_cl2`);

--
-- Indices de la tabla `compras_producto`
--
ALTER TABLE `compras_producto`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `detalle_fact`
--
ALTER TABLE `detalle_fact`
  ADD PRIMARY KEY (`id_df`),
  ADD KEY `id_p2` (`id_p2`);

--
-- Indices de la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD KEY `id_f2` (`id_f2`),
  ADD KEY `id_transportista2` (`id_transportista2`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_cl3` (`id_cl3`),
  ADD KEY `id_transportista2` (`id_transportista2`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_cp2` (`id_cp2`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `transportista`
--
ALTER TABLE `transportista`
  ADD PRIMARY KEY (`id_transportista`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  MODIFY `id_cp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `compras_producto`
--
ALTER TABLE `compras_producto`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `detalle_fact`
--
ALTER TABLE `detalle_fact`
  MODIFY `id_df` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7538948;

--
-- AUTO_INCREMENT de la tabla `transportista`
--
ALTER TABLE `transportista`
  MODIFY `id_transportista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente_registrado`
--
ALTER TABLE `cliente_registrado`
  ADD CONSTRAINT `cliente_registrado_ibfk_1` FOREIGN KEY (`id_cl2`) REFERENCES `cliente` (`id_cl`);

--
-- Filtros para la tabla `compras_producto`
--
ALTER TABLE `compras_producto`
  ADD CONSTRAINT `compras_producto_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `compras_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `detalle_fact`
--
ALTER TABLE `detalle_fact`
  ADD CONSTRAINT `detalle_fact_ibfk_1` FOREIGN KEY (`id_p2`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD CONSTRAINT `entrega_ibfk_1` FOREIGN KEY (`id_f2`) REFERENCES `factura` (`id_factura`),
  ADD CONSTRAINT `entrega_ibfk_2` FOREIGN KEY (`id_transportista2`) REFERENCES `transportista` (`id_transportista`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_cl3`) REFERENCES `cliente` (`id_cl`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_transportista2`) REFERENCES `transportista` (`id_transportista`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_cp2`) REFERENCES `categoria_producto` (`id_cp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
