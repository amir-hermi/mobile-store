-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : Dim 21 fév. 2021 à 11:47
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mtech`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(255) NOT NULL,
  `cat_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`) VALUES
(1, 'sumsung'),
(2, 'apple'),
(3, 'huawei'),
(4, 'oppo'),
(5, 'oneplus'),
(6, 'xiaomi');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` int(255) NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment_user` int(255) NOT NULL,
  `comment_post` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `comment_user`, `comment_post`) VALUES
(24, 'aaaaaa', 4, 40),
(25, 'fff', 5, 40),
(26, 'prix svp', 5, 40);

-- --------------------------------------------------------

--
-- Structure de la table `likes`
--

CREATE TABLE `likes` (
  `id_user` int(255) NOT NULL,
  `id_post` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `likes`
--

INSERT INTO `likes` (`id_user`, `id_post`) VALUES
(4, 40),
(4, 43);

-- --------------------------------------------------------

--
-- Structure de la table `mobilist`
--

CREATE TABLE `mobilist` (
  `id` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ecran` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `camera` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cpu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `battery` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `memory` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ram` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `_date` date NOT NULL,
  `mob_cat` int(255) NOT NULL,
  `image_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `add_last_update` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `resolution` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `camera_f` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `mobilist`
--

INSERT INTO `mobilist` (`id`, `name`, `ecran`, `camera`, `cpu`, `battery`, `memory`, `ram`, `price`, `_date`, `mob_cat`, `image_url`, `add_last_update`, `resolution`, `camera_f`) VALUES
(46, 'huawei mate 10', '5.9 pouces', '12 Mpx 2 capteurs', 'Kirin 970', '4000 mAh', '64 Go', '4 Go', '950Dt', '2021-01-06', 3, 'mtech/huawei mate 10.jpg', '0', '2560 x 1440 pixels', '8 Mpx'),
(47, 'Samsung a30', '6.4 pouces', '16 Mpx, 5 Mpx', 'Exynos 7904', '4000 mAh', '32 Go, 64 Go', '3 Go', '850DT', '2021-01-07', 1, 'mtech/samsung a30.jpg', 'true', '2340 x 1080 pixels', '16 Mpx'),
(48, 'Samsung Note10', '6.3 pouces', '12 Mpx, 16 Mpx, 12 Mpx', 'Exynos 9825', '3500 mAh', '256 Go', '8 Go', '3 599DT', '2021-01-07', 1, 'mtech/Samsung Note10.webp', 'true', '2280 x 1080 pixels', '10 Mpx');

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `id` int(255) NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `post_user` int(255) NOT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `post_like` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `content`, `post_user`, `image`, `post_like`) VALUES
(40, 'aaaa', 4, 'postImage//133083af-6951-497e-ba55-0592063008d87704998447781263742.jpg', 67),
(42, 'tv', 4, 'postImage//236d8283-b614-4f14-b0a6-144f578e57697689666809798023149.jpg', 0),
(43, 'holll', 4, 'postImage//314efe8a-6d0f-4cb9-ac99-77f16f5c8f241861911778246118034.jpg', 1),
(44, 'tttttt', 4, 'postImage//34f0f1ba-b3f5-4aa9-9475-0d29c147f1a03576353566841504917.jpg', 1),
(45, 'tttt', 4, 'postImage//d9ba23e9-9d5f-4474-8c40-0184f29c21e35437460940939594594.jpg', 4),
(46, 'ttttttggggg', 4, 'postImage//5e5c6927-5fb4-470f-8b64-7e181a5034725696938915262901739.jpg', 0),
(47, 'tttt', 4, 'postImage//cff9c8c6-615b-4158-9408-691f32949c024239420294289982194.jpg', 1),
(49, 'ss', 5, 'postImage//f8a98000-c23d-446e-9664-5fbf36d669848202238992136040526.jpg', 0);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(250) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`) VALUES
(1, 'amir', 'amirhermi@gmail.com', '123654789'),
(4, 'semi', 'saidi@gmail.com', '123'),
(5, 'bilelghazouani', 'bilel@gmail.com', '123');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commpost` (`comment_post`),
  ADD KEY `userpost` (`comment_user`);

--
-- Index pour la table `likes`
--
ALTER TABLE `likes`
  ADD KEY `likes` (`id_post`),
  ADD KEY `likesuser` (`id_user`);

--
-- Index pour la table `mobilist`
--
ALTER TABLE `mobilist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobilist` (`mob_cat`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postuser` (`post_user`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `mobilist`
--
ALTER TABLE `mobilist`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `commpost` FOREIGN KEY (`comment_post`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userpost` FOREIGN KEY (`comment_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likesuser` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `mobilist`
--
ALTER TABLE `mobilist`
  ADD CONSTRAINT `mobilist` FOREIGN KEY (`mob_cat`) REFERENCES `categories` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `postuser` FOREIGN KEY (`post_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
