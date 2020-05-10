-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 14 2020 г., 00:41
-- Версия сервера: 10.3.13-MariaDB-log
-- Версия PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `potolkirostov`
--

-- --------------------------------------------------------

--
-- Структура таблицы `catalog`
--

CREATE TABLE `catalog` (
  `id_catalog` int(10) NOT NULL,
  `good_name` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `catalog`
--

INSERT INTO `catalog` (`id_catalog`, `good_name`) VALUES
(1, 'Звездное небо'),
(2, 'Матовый'),
(3, 'Сатиновый'),
(4, 'Тканевые'),
(5, 'Двух уровненный'),
(6, 'Парящие'),
(7, 'С фотопечатью'),
(8, 'Глянцевые'),
(9, 'Бесшовные'),
(10, 'Цветные'),
(11, 'С подсветкой');

-- --------------------------------------------------------

--
-- Структура таблицы `catalog_price`
--

CREATE TABLE `catalog_price` (
  `id_catalog_price` int(10) NOT NULL,
  `id_catalog` int(10) NOT NULL,
  `kitchen` varchar(10) COLLATE utf8_bin NOT NULL,
  `bathroom` varchar(10) COLLATE utf8_bin NOT NULL,
  `living_room` varchar(10) COLLATE utf8_bin NOT NULL,
  `bedroom` varchar(10) COLLATE utf8_bin NOT NULL,
  `hall` varchar(10) COLLATE utf8_bin NOT NULL,
  `flat` varchar(10) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `catalog_price`
--

INSERT INTO `catalog_price` (`id_catalog_price`, `id_catalog`, `kitchen`, `bathroom`, `living_room`, `bedroom`, `hall`, `flat`) VALUES
(1, 1, '25999', '13999', '35999', '31999', '29999', '119999'),
(2, 2, '3999', '2299', '6999', '3399', '5600', '19999'),
(13, 3, '3399', '1699', '5399', '4199', '5199', '18999'),
(14, 4, '8999', '3399', '11999', '9399', '9999', '52999'),
(15, 5, '8299', '3399', '13999', '10999', '12199', '43999'),
(16, 6, '5999', '3499', '7999', '4999', '6999', '27999'),
(17, 7, '12999', '5999', '16999', '10999', '15999', '59999'),
(18, 8, '4599', '2399', '7299', '4699', '5999', '22999'),
(19, 9, '4999', '1999', '6799', '5399', '5999', '29999'),
(20, 10, '4899', '2399', '6599', '4799', '5399', '26999'),
(21, 11, '5999', '3499', '7999', '4999', '6999', '27999');

-- --------------------------------------------------------

--
-- Структура таблицы `data_shop`
--

CREATE TABLE `data_shop` (
  `id` int(10) NOT NULL,
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `time` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `data_shop`
--

INSERT INTO `data_shop` (`id`, `address`, `time`, `phone`, `email`) VALUES
(1, 'г. Ростов-на-Дону,Коммунистический проспект, 31', 'Пн - Сб с 9:00 до 19:00', '+7 (863) 226-37-04', 'potolkirostov@mail.ru');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id_catalog`);

--
-- Индексы таблицы `catalog_price`
--
ALTER TABLE `catalog_price`
  ADD PRIMARY KEY (`id_catalog_price`),
  ADD KEY `catalog_price_fk0` (`id_catalog`);

--
-- Индексы таблицы `data_shop`
--
ALTER TABLE `data_shop`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id_catalog` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `catalog_price`
--
ALTER TABLE `catalog_price`
  MODIFY `id_catalog_price` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `data_shop`
--
ALTER TABLE `data_shop`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `catalog_price`
--
ALTER TABLE `catalog_price`
  ADD CONSTRAINT `catalog_price_fk0` FOREIGN KEY (`id_catalog`) REFERENCES `catalog` (`id_catalog`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
