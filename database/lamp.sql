-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: database
-- Время создания: Июн 17 2024 г., 05:03
-- Версия сервера: 5.7.29
-- Версия PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lamp`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(5, 'Комедия ', '2024-06-02 08:55:54', '2024-06-02 08:55:54'),
(6, 'Ужасы', '2024-06-02 08:56:08', '2024-06-02 08:56:08'),
(7, 'Драма', '2024-06-14 07:26:59', '2024-06-14 07:26:59');

-- --------------------------------------------------------

--
-- Структура таблицы `movies`
--

CREATE TABLE `movies` (
  `id` int(11) UNSIGNED NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` mediumtext NOT NULL,
  `preview` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `movies`
--

INSERT INTO `movies` (`id`, `category_id`, `name`, `description`, `preview`, `created_at`, `updated_at`) VALUES
(2, 5, 'Бригада', 'Раньше было не так сладко', 'movies/b8f87e28e2a99367f04c3f276ff1fe49.png', '2024-06-03 03:10:44', '2024-06-03 03:10:44'),
(3, 6, 'Базы данных', 'Спасибо за знания!!!', 'movies/666e7c205804c5fa8771c09f9192380b.jpg', '2024-06-14 07:20:12', '2024-06-14 07:20:12'),
(4, 5, 'Час пик', 'Джеки Чан здесь еще такой молодой.', 'movies/7af2cecac19cbbb8eba3656acc72d26c.jpg', '2024-06-14 07:23:58', '2024-06-14 07:23:58');

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `movie_id` int(11) UNSIGNED DEFAULT NULL,
  `review` mediumtext,
  `rating` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `movie_id`, `review`, `rating`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Хорошо, что все прошло!!!', 8, '2024-06-13 10:41:56', '2024-06-13 10:41:56'),
(2, 1, 2, '123132', 4, '2024-06-13 10:54:59', '2024-06-13 10:54:59'),
(3, 1, 2, 'Вау!! Супер!! Клааааа$$$$!!', 10, '2024-06-13 12:01:50', '2024-06-13 12:01:50'),
(4, 2, 3, 'Солидарен!!!', 10, '2024-06-14 07:20:53', '2024-06-14 07:20:53'),
(5, 1, 3, 'Ожидаю высокую оценку!!!!', 10, '2024-06-14 07:21:27', '2024-06-14 07:21:27'),
(6, 1, 4, 'Вот это да!', 9, '2024-06-14 07:27:35', '2024-06-14 07:27:35');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id_admin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `id_admin`, `created_at`, `updated_at`) VALUES
(1, 'Сергей Черников', 'sergey.steam.21@yandex.ru', '$2y$10$ZEHiEEvwfvL0eXq0dkA8cehhS9t4Ve4RIVBs6/YDtM/Z.wzFlJC.6', 0, '2024-06-01 06:23:54', '2024-06-01 06:23:54'),
(2, 'Иван', 'ivan123@gmail.com', '$2y$10$/PfqidFc8Uhy0JhwGmK86.kohBItSF3FTChdM9fpW.UUrhqoztRPK', 0, '2024-06-14 07:17:49', '2024-06-14 07:17:49');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
