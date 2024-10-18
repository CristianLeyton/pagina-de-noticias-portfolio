-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-10-2024 a las 23:59:59
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `canal3_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anuncios`
--

CREATE TABLE `anuncios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `banner` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `anuncios`
--

INSERT INTO `anuncios` (`id`, `name`, `banner`, `link`, `created_at`, `updated_at`) VALUES
(1, 'Banner ', '01J81JRK4BSXZCAA47HGCGZTA6.gif', 'https://municipalidadsalta.gob.ar/', '2024-09-18 03:28:07', '2024-09-18 03:28:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `images`
--

INSERT INTO `images` (`id`, `name`, `image`, `link`, `created_at`, `updated_at`) VALUES
(1, 'Wuaze - Banner', '01JAGJQ9FYNG2J3Z8J077QHHM9.webp', 'https://breakingnews.wuaze.com/', '2024-09-18 03:29:07', '2024-10-18 19:47:25'),
(5, ' Reto 50 dias | Web Page', '01JAGPW4VKA3GD9HT044K2DF7C.webp', 'https://reto-50-dias.vercel.app/', '2024-10-18 20:18:29', '2024-10-18 20:59:58'),
(6, 'Tareas | Web App', '01JAGPWM9YGGXW0GWJ3XXS4AR1.webp', 'https://cdl.free.nf/', '2024-10-18 20:19:06', '2024-10-18 21:00:14'),
(7, 'Esmarty | Ecommerce', '01JAGPX55XRPS2SYCZ0NYSCJGS.webp', 'https://esmarty.free.nf/', '2024-10-18 20:19:28', '2024-10-18 21:00:31'),
(8, 'Estetica | Landing Page', '01JAGPXNHD7AP4KC1ZBZTGQJ3S.webp', 'https://page-cosmetica.vercel.app/', '2024-10-18 20:19:53', '2024-10-18 21:00:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `links`
--

CREATE TABLE `links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `links`
--

INSERT INTO `links` (`id`, `name`, `link`, `created_at`, `updated_at`) VALUES
(1, 'Canal 3 - En vivo', 'https://www.youtube.com/embed/t_P4mOSv5hY?autoplay=1&mute=1&modestbranding=1', '2024-09-18 02:36:46', '2024-10-18 19:28:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_08_29_215749_create_noticias_table', 1),
(6, '2024_08_29_215859_create_sponsors_table', 1),
(7, '2024_08_29_215905_create_images_table', 1),
(8, '2024_08_31_190638_create_anuncios_table', 1),
(9, '2024_08_31_232935_create_links_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `published_at` date DEFAULT NULL,
  `short_description` mediumtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`id`, `title`, `slug`, `content`, `published_at`, `short_description`, `image`, `created_at`, `updated_at`) VALUES
(2, 'La economía en recesión: en los primeros seis meses del año la actividad cayó 3,4%', 'la-economia-en-recesion-en-los-primeros-seis-meses-del-ano-la-actividad-cayo-34', '* En el segundo trimestre retrocedió 1,7%.\n* Acumula tres ciclos seguidos a la baja.\n\n![](http://canalpage.com/storage_public/ezZaBzoY893IczFbem84Umd15iiaodb17jy5xce6.webp)\n\nEn la primera parte del año se profundizó la recesión y el semestre cerró con una **caída de la actividad del 3,4%.** Según informó el INDEC, en el segundo trimestre el **producto bruto interno bajó 1,7%** con relación al mismo período del año anterior. Con esto la economía enlaza tres trimestres seguido a la baja y se encamina a cerrar su segundo año consecutivo de recesión.\n\nEl informe del INDEC muestra que del lado de la demanda solamente las exportaciones mostraron un crecimiento, con un avance del 31,4%. En cambio el consumo privado descendió 9,8%, el Consumo público cayó 6% y la Formación bruta de capital fijo bajó 29,4%, siempre en la comparación contra igual período del 2023-\n\nA nivel interanual, los sectores con mayores caídas fueron la construcción (-22,2%), la Industria manufacturera (-17,4%) y las actividades de Comercio **mayorista, minorista y reparaciones (-15,7%)**\n\nEl sector que creció con fuerza fue el sector de Agricultura, ganadería, caza y silvicultura, con un **salto del 81,2%.**\n\nEn el segundo trimestre la caída se acotó respecto del primero. En términos desestacionalizados, las importaciones descendieron 5,5%, el consumo privado registró una caída de 4,1%, el consumo público tuvo una variación negativa de 1,1%, las exportaciones crecieron 3,9% y la formación bruta de capital fijo tuvo una **disminución de 9,1%**.\n\n<hr>\n\nNoticia en desarrollo\n', '2024-09-16', 'La economía sigue en recesión y el PBI acumuló una caída del 3,4% en los primeros seis del año\nLleva tres trimestres en baja', '01JAGRXSVE7TTC2VZEKZ9JXK96.webp', '2024-09-18 21:29:32', '2024-10-18 21:35:50'),
(3, 'Otro round de Maduro contra Milei', 'otro-round-de-maduro-contra-milei', '* Lo anunció el fiscal general del régimen de Nicolás Maduro, Tarek William Saab.\n* El pedido de captura también regirá para Karina Milei y Patricia Bullrich.\n* Un día antes, el Gobierno argentino había respaldado un pedido de detención contra el líder chavista en la Justicia.\n\n<iframe width=\"860\" height=\"615\" src=\"https://www.youtube.com/embed/mokyEKAdSiE?si=mbPB2UMYcNUU1J81\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>\n\nLa Fiscalía de Venezuela tramita la solicitud de una orden de captura contra el presidente de Argentina, Javier Milei, a quien le abrió \"una averiguación\" por el \"robo\" del avión venezolano-iraní que estuvo retenido en Buenos Aires desde junio de 2022 y fue enviado a Estados Unidos en febrero. Se trata de un nuevo round en la pelea de **Maduro contra Milei**.\n\nAsí lo informó este miércoles el fiscal general del régimen de Nicolás Maduro, Tarek William Saab. Indicó que es por el caso del avión venezolano-iraní que quedó retenido en Ezeiza en el gobierno de Alberto Fernández, en junio de 2022, y que fue entregado en febrero pasado a Estados Unidos, que había pedido su decomiso.\n\nSaab anunció este miércoles \"la asignación de dos fiscales especializados en la materia, quienes adelantan las diligencias pertinentes del caso y se encuentran tramitando la orden de aprehensión\" también contra la secretaria general de Presidencia de Argentina, Karina Milei, y la ministra de Seguridad, Patricia Bullrich.\n\n\"Una burla para la Justicia argentina\", acotó Saab sobre los funcionarios. Se limitó a detallar que la presentación, con las solicitudes de aprehensión, se concretará \"en las próximas horas en un tribunal competente\" en Venezuela.\n\nEn su anuncio, el fiscal del régimen chavista recordó que hubo tripulantes venezolanos retenidos en Argentina. \"Se establece la facultad de nuestro país de ejercer su jurisdicción no sólo como forma de defensa ante acciones tendentes a atacar responsabilidades penales y la sanción ante la comisión por las personas involucradas, de los tipos penales en los que incurran\", agregó Saab.\n\nA la hora de referirse a los supuestos delitos, enumeró: \"robo agravado\", \"intimación de capitales\", \"privación ilegítima de la libertad\", \"simulación de hecho punible\", \"interferencia ilícita\", \"inutilización de aeronave\" y \"asociación para delinquir\".\n\nEl anuncio del régimen chavista ocurre un día después de que el Gobierno de Milei respaldara un pedido de detención contra el líder chavista en la Justicia argentina.\n\n![](http://canalpage.com/storage_public/4NatG59h20VvtH1Fk2hFMKSCzZ19X6kNk328fkiw.webp)\nCon información de EFE', '2024-09-18', 'Ahora Venezuela pedirá la detención del Presidente en el caso del avión que estuvo retenido en Ezeiza. Lo anunció el fiscal general de Venezuela por el \"robo\" del avión venezolano-iraní que estuvo retenido en Buenos Aires.', '01JAGRYWEJYFMZN4TPBCP5J2V6.webp', '2024-09-18 21:37:37', '2024-10-18 21:36:25'),
(7, 'Despidos y ajuste, el día a día en Argentina', 'despidos-y-ajuste-el-dia-a-dia-en-argentina', 'Mentras apela a una mezcla de posibilismo y pragmatismo para desbloquear la negociación en el Senado para aprobar la Ley Bases y el paquete fiscal, el gobierno de Javier Milei avanza con el plan para reducir los costos operativos y reformular el perfil de las nueve empresas públicas que pretende privatizar de forma total o parcial, en caso de que, finalmente, consiga los apoyos en el Congreso para sancionar las reformas económicas del Presidente.\n\n![](http://canalpage.com/storage_public/haa3HG7FmbbuKHc33oLrheBgdN8HQUqGotLkivPS.webp)\n\nEn las últimas semanas, el Poder Ejecutivo comenzó a preparar el terreno para la ola privatizadora al intensificar su política de recortes de gastos en empresas estatales, como Aerolíneas Argentinas, AySA o el Correo Argentino, que reciben aportes del Tesoro Nacional y son deficitarias, con el propósito de equilibrar sus cuentas. De esa forma, Milei pretende encontrar una vía para hacerlas más rentables y, a mediano o largo plazo, convertirlas en un negocio atractivo para el sector privado de cara al eventual proceso de venta integral, concesión o esquema mixto. Sin embargo, al Gobierno aún le queda un camino cuesta arriba para lograrlo.\n\n', '2024-05-21', 'El Gobierno activa el plan para achicar y reformular empresas públicas antes de la ola privatizadora. Las cosas se ven cada vez más dificiles para la gente normal. ', '01JAGSEWGQWA0PZJ2JAYPNZHF4.webp', '2024-10-18 21:42:31', '2024-10-18 21:45:09'),
(8, 'Jonatan Viale y las mentiras sobre Marcelo Tinelli', 'jonatan-viale-y-las-mentiras-sobre-marcelo-tinelli', '![](http://canalpage.com/storage_public/hqp9LjwmKcYm7RWRsubrv28E56xunVirE0Vw5MgU.webp)\n\n**Jonatan Viale tuvo que pedir disculpas.** Y no una vez, sino en dos ocasiones, tanto en su programa de radio como en el de la TV. Es que el ahora periodista de TN y Radio Rivadavia había sido denunciado por daños y perjuicios por parte del conductor Marcelo Tinelli, a quien el año pasado había acusado en LN+ de *“corrupto” y de recibir dinero del “narcotráfico”*, entre otras descalificaciones. El animador de Showmatch le había iniciado una demanda civil por una cifra millonaria al periodista, la cual había acordado retirar siempre y cuando Viale pidiera disculpas públicas. Algo que, la primera vez, el periodista intentó hacer pasar como si solo hubiera tenido un malentendido con Tinelli y no una demanda judicial en su contra por injurias. Una “avivada” por la que esta semana Viale tuvo que disculparse tal cual se había acordado para salvarse de pagar 80 millones de pesos.\n\n<hr>\n\n**En la emisión del 2 de octubre del 2023 del programa +Realidad en LN+**, Viale realizó un editorial a propósito del escándalo que se había desatado por las fotos del ex intendente de Lomas de Zamora, Martín Insaurralde, vacacionando en un yate de lujo en Marbella. En ese editorial, acorde a su estilo, el periodista había dicho: “¿Va a contar algún día Marcelo todo? ¿Va a contar algún día Tinelli cuánto dinero recibía de Lomas de Zamora para llevar a Insaurralde o no? Repito: no es Insaurralde, eh. Es un sistema corrupto, no nos hagamos los pelotudos. Si barremos, barremos todo, como dice Milei\". Y no se quedó ahí el hijo de Mauro Viale. “Es un sistema de empresarios corruptos, sindicalistas corruptos, presentadores de la tele corruptos, periodistas corruptos, políticos corruptos que viven del juego clandestino, de la salada y del narcotráfico. Basta, la pobreza es funcional al kirchnerismo por estos hijos de puta\", subrayó, sin ponerse colorado.\n\n<hr>\n\n**Esa acusación -que incluyó un tape en el que se mostraba a Tinelli entrevistando a la vedette Jésica Cirio,** acompañada en el piso de Showmatch por Insaurralde, quien entonces era su pareja- derivó en que el ahora gerente artístico de América TV le iniciara la demanda judicial, por verse afectado en su *“prestigio”, “buen nombre”, “honor”, “imagen” y “dignidad”.* El reclamo económico contra Viale y la empresa Publirevistas S. A., titular de LN+, ascendía a los 80 millones de pesos. En la presentación judicial, patrocinada por el abogado Osvaldo Pereira, Tinelli exigía que los demandados se vean obligados a publicar la sentencia en caso de resultar favorable.\n\n<hr> \n\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/c7jWOnjIGzE?si=2VdKHj24IdLYOBde\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', '2024-10-18', 'El periodista había señalado al animador de \"corrupto\", y fue demandado por 80 millones de pesos. Su primera disculpa pública quiso disfrazar todo como un \"malentendido\".', '01JAGSQT77F2ANRE3JRVPR47XM.webp', '2024-10-18 21:50:02', '2024-10-18 21:50:02'),
(9, 'Enfrentados. Cristina Kirchner, durísima con Kicillof', 'enfrentados-cristina-kirchner-durisima-con-kicillof', '![](http://canalpage.com/storage_public/F3eQqlVb00qd1oXyIwWlANy1x0QwV9bPPMLcaQk1.webp)\n\n**Cristina Kirchner** blanqueó este viernes su malestar político con Axel Kicillof. En una reunión con sindicalistas, intendentes y dirigentes políticos en la sede de Smata, la expresidenta acusó a los ministros del gobierno bonaerense de “buscar avales” para que el riojano Ricardo Quintela pueda competir contra ella por la jefatura del Partido Justicialista (PJ).\n\n**“El que tiene que hablar con Quintela es Axel, que es el que lo apoya. Son sus ministros los que están buscando avales para él”,** arremetió Cristina Kirchner ante un auditorio que la escuchó con sorpresa, según reveló a LA NACION uno de los dirigentes que se presentaron a la sede sindical de la avenida Belgrano porteña.\n\nVisiblemente enojada con su otrora **“hijo político”**, Cristina Kirchner abundó: **“Los Poncio Pilatos en el peronismo no van más. Ni los Poncio Pilatos ni los Judas”**. La expresidenta agregó: **“Ningún dirigente es víctima. La única víctima en este país es la gente”.**\n\nAdemás, Cristina Kirchner confirmó su rechazo a que un gobernador encabece el PJ. **“Nadie que tenga responsabilidad de gestión puede estar al frente del partido porque el peronismo no puede terminar siendo rehén del gobierno nacional”**, sostuvo.\n\n<hr>\n\n<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/GmhoNtFB5uk?si=ACO_lB8koPfJ6w3R\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>\n', '2024-10-10', '“Sus ministros son los que están buscando avales para Quintela”\nLa expresidenta habló ante sindicalistas, intendentes y dirigentes políticos en la sede de Smata; allí exhibió sin tapujos su malestar con el gobernador bonaerense; “los Poncio Pilatos en el peronismo no van más”, advirtió.', '01JAGSYTGD0K5ZZQBKFWAFJPVZ.webp', '2024-10-18 21:53:52', '2024-10-18 21:53:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sponsors`
--

CREATE TABLE `sponsors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sponsors`
--

INSERT INTO `sponsors` (`id`, `name`, `image`, `link`, `created_at`, `updated_at`) VALUES
(5, 'Sponsor - 1', '01JAGKWKGJ4FKGKBABCMXNVAXN.webp', 'https://www.cdl.net.ar/', '2024-10-18 20:00:38', '2024-10-18 20:07:47'),
(6, 'Sponsor - 2', '01JAGKX69KRVPZP3Q9EP7FNVNS.webp', 'https://www.cdl.net.ar/', '2024-10-18 20:08:07', '2024-10-18 20:08:07'),
(7, 'Sponsor - 3', '01JAGKXWYYVC1QYRVR17CPMB5C.webp', 'https://www.cdl.net.ar/', '2024-10-18 20:08:30', '2024-10-18 20:08:30'),
(8, 'Sponsor - 4', '01JAGKZ08H5M2BRZ5GN354TK00.webp', 'https://www.cdl.net.ar/', '2024-10-18 20:09:06', '2024-10-18 20:09:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@canal3.com.ar', '2023-11-17 21:07:39', '$2y$12$Y4XzIr9fcQNPzZ8hey6.he13c1CVdZUywm8fEtY.YDKHeyuHl0bN6', 'isp7Gt07kumRmkH6K19PbtmOidGDAIfypG6H9t8dLrXsRyGpW4VlNg4HahOT', '2024-09-18 02:36:46', '2024-09-18 02:36:46');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `anuncios`
--
ALTER TABLE `anuncios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `noticias_slug_unique` (`slug`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `sponsors`
--
ALTER TABLE `sponsors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `anuncios`
--
ALTER TABLE `anuncios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `links`
--
ALTER TABLE `links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sponsors`
--
ALTER TABLE `sponsors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
