-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Gegenereerd op: 14 mei 2018 om 18:28
-- Serverversie: 10.2.13-MariaDB
-- PHP-versie: 7.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sebasmz276_rsw`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `auth`
--

CREATE TABLE `auth` (
  `user` int(11) NOT NULL,
  `score_veld` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `auth`
--

INSERT INTO `auth` (`user`, `score_veld`) VALUES
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(5, 1),
(5, 4),
(5, 5),
(6, 1),
(6, 4),
(6, 5),
(7, 1),
(7, 4),
(7, 5),
(8, 1),
(8, 4),
(8, 5),
(9, 1),
(9, 4),
(9, 5),
(10, 1),
(10, 4),
(10, 5),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(11, 5),
(11, 6);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `config`
--

CREATE TABLE `config` (
  `name` varchar(50) NOT NULL,
  `value` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `team` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `score_veld` int(11) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `route_info`
--

CREATE TABLE `route_info` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `route_info`
--

INSERT INTO `route_info` (`id`, `naam`) VALUES
(1, 'Versie A'),
(2, 'Versie B');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `score_groep`
--

CREATE TABLE `score_groep` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `score_groep`
--

INSERT INTO `score_groep` (`id`, `naam`) VALUES
(6, 'Avondeten'),
(4, 'Avondspel 1'),
(1, 'Hike'),
(5, 'Kampopbouw zaterdag'),
(8, 'Kampopbouw zondag'),
(7, 'Postenspel zondag'),
(2, 'Thuisopdracht'),
(3, 'Uniform'),
(0, '[SPECIAL]');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `score_veld`
--

CREATE TABLE `score_veld` (
  `id` int(11) NOT NULL,
  `groep` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `omschrijving` varchar(250) NOT NULL,
  `max` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `score_veld`
--

INSERT INTO `score_veld` (`id`, `groep`, `naam`, `omschrijving`, `max`) VALUES
(1, 0, 'poll', 'Lijst opvragen zonder error', 0),
(2, 0, 'team.update', 'Gegevens van een team aanpassen (naam nummer tag)', 0),
(3, 0, 'team.update.route', 'Alle posten beheren', 0),
(4, 0, 'team.checkin.route', 'Post checkin (eige post)', 0),
(5, 0, 'team.checkout.route', 'Post checkout (eige post)', 0),
(6, 0, 'teams.reload', 'Reload all teams from a SOL CSV export', 0),
(7, 1, 'post[1].score', '', 0),
(8, 1, 'post[2].score', '', 100),
(9, 1, 'post[3].score', '', 10),
(10, 1, 'post[4].score', '', 10),
(11, 1, 'post[5].score', '', 10),
(12, 1, 'post[6].score', '', 10),
(13, 1, 'post[7].score', '', 10),
(14, 1, 'post[8].score', '', 10),
(15, 5, 'Teambord', 'Aanwezig ja 10 Nee 0', 10),
(16, 5, 'Thema aankleding', 'Moeite gedaan voor beetje aankleding Ja 10 Nee 0', 10),
(17, 5, 'Tentdoek', 'Netjes en strak 25 losjes 20 onstabiel 10 rommel 0', 25),
(18, 5, 'Haringen', 'haringen netjes volgen bouw tent  in lijn is er aandacht besteed of niet 25-10-0', 25),
(19, 5, 'Kampkist', 'Opgeruimt en schoon 25, anders 0, niet inzichtelijkmaar ook niets los 10', 25),
(20, 5, 'Compleetheid matriaal', 'Volgens paklijst 25 -3 bij missend', 25),
(21, 5, 'Veiligheid matriaal', 'Veilig 20 zo niet 0.\r\nletop gasslangen max 5 jaar geen tyrip geen kootoestel met gasbus\r\nDrukloosheid coleman. Geen gekoeld voesel aanwezig', 20),
(22, 5, 'Algemene indruk', 'is het netjes en opgeruimt 20 anders 0', 20),
(23, 6, 'Hygiene', '30,15 of 0', 30),
(24, 6, 'Aankleding', '10 tafelgedekt 5 menu 5netjes opgediend', 20),
(25, 6, 'Samenwerken', '20 of 0 iedereen betrokken?', 20),
(26, 6, 'Voorgerecht', 'Smakelijkheid schaal 0-15', 15),
(27, 6, 'Hoofdgerecht', 'Smakelijkheid schaal 0-20', 20),
(28, 6, 'Toetje', 'Smakelijkheid schaal 0-15', 15),
(29, 7, 'Punten', '', 100),
(30, 8, 'Teambord', 'Aanwezig 20 zo niet 0', 20),
(31, 8, 'Kampkist', 'schoon en opgeruimt 20 zo niet 0', 20),
(32, 8, 'Afval', 'in vuilniszak/reedsweggegooid 20 zo niet 0', 20),
(33, 8, 'Algemene indruk', 'ligt matriaal netjes bij elkaar 20 zo niet 20', 20),
(34, 2, 'Inleveren', 'Nee 0 punten Ja 5 punten', 5),
(35, 2, 'zelf gemaakt', 'Nee 0 punten Ja 5 punten', 5),
(36, 2, 'Originaliteit', 'Originaliteit materialen, vormen, kleuren etc', 15),
(37, 2, 'Herkenbaar van team', 'Komt thuisopdracht overeen met teamnaam ja 10 nee 0', 10),
(38, 2, 'maatvoering', 'Valt thuisopdracht binnen maar van 50x50x50 CM', 5),
(39, 3, 'Uniformiteit', 'is iedereen in zelfde stijl gekleed (thema/scoutfit) normalekleding 0  punten', 20),
(40, 3, 'Das', 'heeft iedereen', 20),
(41, 4, 'Punten', '', 100);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `subkamp`
--

CREATE TABLE `subkamp` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `subkamp`
--

INSERT INTO `subkamp` (`id`, `naam`) VALUES
(4, 'Area51'),
(3, 'Floradia'),
(2, 'Mustattio'),
(1, 'Oranis'),
(5, 'Vulkania');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `kamp` int(11) NOT NULL,
  `nummer` int(11) NOT NULL,
  `speltak` varchar(100) NOT NULL,
  `groep` varchar(100) NOT NULL,
  `tag` varchar(7) NOT NULL,
  `route` int(11) NOT NULL,
  `joker` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `team`
--

INSERT INTO `team` (`id`, `naam`, `kamp`, `nummer`, `speltak`, `groep`, `tag`, `route`, `joker`) VALUES
(1, 'Leeuwenbek', 1, 1, 'Padvindsters', 'Maurits Viool', '1LFMAE', 1, 0),
(2, 'Femaliens', 1, 2, 'Wolven Troep', 'Ruwaard van Putten', '2PLAME', 2, 0),
(3, 'Otters', 1, 3, 'Waterscouts', 'Karel Doorman', '3FLZE', 1, 0),
(4, 'KD Vossen', 1, 4, 'Landscouts', 'Karel Doorman', '4YUUD', 2, 0),
(5, 'Space control', 1, 5, 'Luchtverkenners &amp; Amfibie&euml;n', 'Scouting Hellevoetsluis', '5ANHX', 1, 0),
(6, 'Jupiter Jagers', 1, 6, 'Verkenners', 'Marnix v. St. Aldegonde', '6KARH', 2, 0),
(8, 'de Ruimtemanderijntjes', 1, 9, 'Scouts', 'Taize Groep', '9TEWW', 1, 0),
(9, 'De Groempies', 1, 10, 'Smirnoff Eskader', 'Hartelgroep', '10KWUA', 2, 0),
(10, 'Geitenbaard', 2, 21, 'Padvindsters', 'Maurits Viool', '21BLZH', 1, 0),
(11, 'Snip', 2, 22, 'Waterscouts', 'G.J. Geysendorffer', '22XZOW', 2, 0),
(12, 'Space birds', 2, 23, 'Landscouts', 'De Strandvogels', '23THZU', 1, 0),
(13, 'De Melkweg', 2, 24, 'Wolven Troep', 'Ruwaard van Putten', '24WHRF', 2, 0),
(14, 'Black Space Dragons', 2, 25, 'Raymond Maufraistroep', 'Franciscus Lodewijkgroep', '25HGPX', 1, 0),
(15, 'De Plutoianiers', 2, 26, 'Scouts', 'Scouting Puttershoek', '26EAGZ', 2, 0),
(16, 'Fonkelende Sterren', 2, 27, 'Verkenners', 'Marnix v. St. Aldegonde', '27FCUS', 1, 0),
(17, 'Marshmallow Gang', 2, 28, 'Smirnoff Eskader', 'Hartelgroep', '28ZPTA', 2, 0),
(18, 'The Space Stars', 2, 29, 'Scouts', 'Willem de Zwijger', '29ASHX', 1, 0),
(19, 'Space Milk', 2, 30, 'Landverkenners', 'Scouting Hellevoetsluis', '30SYTK', 2, 0),
(20, 'Gonk Droids', 3, 42, 'Verkenners', 'Maurits Viool', '42FTDC', 1, 0),
(21, 'De Giechel Aliens', 3, 43, 'Wolven Troep', 'Ruwaard van Putten', '43BUHK', 2, 0),
(22, 'Dolfijnen', 3, 44, 'Waterscouts', 'Karel Doorman', '44CZGG', 1, 0),
(23, 'de Marsmannetjes', 3, 45, 'Scouts', 'Taize Groep', '45ZPGF', 2, 0),
(24, 'Star Mars', 3, 46, 'Scouts', 'Paulusgroep', '46SBZS', 1, 0),
(25, '308', 3, 47, 'Zeeverkenners', 'Scouting Hellevoetsluis', '47RSSS', 2, 0),
(26, 'Ruimterovers', 3, 48, 'Scouts', 'Willem de Zwijger', '48KBOB', 1, 0),
(27, 'Ananassen met hyper drive', 3, 49, 'Landverkenners', 'Scouting Hellevoetsluis', '49AFNG', 2, 0),
(28, 'Maanbaas', 3, 50, 'Verkenners', 'Beelaerts van Blokland', '50ZSKB', 1, 0),
(29, 'Phoenix', 4, 61, 'Waterscouts', 'G.J. Geysendorffer', '61NULP', 2, 0),
(30, 'The Buzzlightyears', 4, 62, 'Wolven Troep', 'Ruwaard van Putten', '62TTXT', 1, 0),
(31, 'BvH Landscouts', 4, 64, 'Landscouts', 'Scouting BvH', '64HDAB', 2, 0),
(32, 'KD Leeuwen', 4, 65, 'Landscouts', 'Karel Doorman', '65FZTY', 1, 0),
(33, 'De Koele RuimteChinezen', 4, 66, 'Scouts', 'Scouting Puttershoek', '66SKPB', 2, 0),
(34, 'Big Planet', 4, 67, 'Luchtverkenners &amp; Amfibie&euml;n', 'Scouting Hellevoetsluis', '67NDDO', 1, 0),
(36, 'Space Explorers', 4, 69, 'Sequoia Vendel', 'Hartelgroep', '69HFNW', 2, 0),
(37, 'RaketV2', 4, 70, 'Verkenners', 'Beelaerts van Blokland', '70BZKW', 1, 0),
(38, 'Neptunusvogels', 5, 81, 'Blauwe Vogels', 'Maurits Viool', '81TGPB', 2, 0),
(39, 'The Space Invaders', 5, 82, 'Wolven Troep', 'Ruwaard van Putten', '82LPCT', 1, 0),
(40, 'Orca\'s', 5, 83, 'Waterscouts', 'Karel Doorman', '83PWSF', 2, 0),
(41, 'KD Panters', 5, 84, 'Landscouts', 'Karel Doorman', '84FFHU', 1, 0),
(42, 'Bears of the Galaxy', 5, 85, 'Verkenners', 'Marnix v. St. Aldegonde', '85LOGX', 2, 0),
(43, 'Falling Stars', 5, 86, 'Scouts', 'Paulusgroep', '86ECGO', 1, 0),
(44, 'Space Unicorns', 5, 87, 'Sequoia Vendel', 'Hartelgroep', '87KUHL', 2, 0),
(45, 'De Aardblobjes', 5, 89, 'Scouts', 'Willem de Zwijger', '89TTFL', 1, 0),
(46, 'Rosaviakosmos', 5, 90, 'Verkenners', 'Beelaerts van Blokland', '90AWON', 2, 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tocht_log`
--

CREATE TABLE `tocht_log` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `post` int(11) NOT NULL,
  `team` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `state` enum('aangekome','vertrokke') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `tocht_log`
--

INSERT INTO `tocht_log` (`id`, `user`, `post`, `team`, `time`, `state`) VALUES
(1, 2, 1, 1, 1524346706, 'vertrokke'),
(2, 2, 1, 2, 1524346741, 'vertrokke'),
(3, 2, 3, 1, 1524347434, 'aangekome'),
(4, 2, 8, 2, 1524347913, 'aangekome');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tocht_log_org`
--

CREATE TABLE `tocht_log_org` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `post` int(11) NOT NULL,
  `team` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `state` enum('aangekome','vertrokke') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `tocht_log_org`
--

INSERT INTO `tocht_log_org` (`id`, `user`, `post`, `team`, `time`, `state`) VALUES
(1, 3, 1, 1, 1524297034, 'vertrokke'),
(2, 3, 1, 3, 1524297220, 'vertrokke'),
(3, 3, 1, 6, 1524297416, 'vertrokke'),
(4, 3, 1, 5, 1524297426, 'vertrokke'),
(5, 3, 1, 4, 1524297535, 'vertrokke'),
(6, 3, 1, 8, 1524297702, 'vertrokke'),
(7, 3, 1, 2, 1524297721, 'vertrokke'),
(8, 3, 1, 9, 1524297917, 'vertrokke'),
(9, 3, 1, 11, 1524298182, 'vertrokke'),
(10, 3, 1, 10, 1524298194, 'vertrokke'),
(11, 3, 1, 13, 1524298415, 'vertrokke'),
(12, 3, 1, 12, 1524298421, 'vertrokke'),
(13, 3, 1, 15, 1524298619, 'vertrokke'),
(14, 3, 1, 14, 1524298625, 'vertrokke'),
(15, 3, 1, 17, 1524298814, 'vertrokke'),
(16, 3, 1, 16, 1524298823, 'vertrokke'),
(17, 5, 3, 1, 1524298915, 'aangekome'),
(18, 3, 1, 19, 1524299048, 'vertrokke'),
(19, 3, 1, 18, 1524299053, 'vertrokke'),
(20, 10, 8, 6, 1524299266, 'aangekome'),
(21, 3, 1, 20, 1524299289, 'vertrokke'),
(22, 3, 1, 23, 1524299294, 'vertrokke'),
(23, 5, 3, 1, 1524299298, 'vertrokke'),
(24, 10, 8, 4, 1524299304, 'aangekome'),
(25, 5, 3, 3, 1524299539, 'aangekome'),
(26, 3, 1, 21, 1524299542, 'vertrokke'),
(27, 3, 1, 24, 1524299547, 'vertrokke'),
(28, 3, 1, 22, 1524299745, 'vertrokke'),
(29, 3, 1, 25, 1524299747, 'vertrokke'),
(30, 10, 8, 6, 1524299813, 'vertrokke'),
(31, 5, 3, 5, 1524299929, 'aangekome'),
(32, 3, 1, 26, 1524299931, 'vertrokke'),
(33, 3, 1, 27, 1524299934, 'vertrokke'),
(34, 10, 8, 11, 1524299946, 'aangekome'),
(35, 10, 8, 4, 1524300013, 'vertrokke'),
(36, 5, 3, 8, 1524300042, 'aangekome'),
(37, 5, 3, 3, 1524300079, 'vertrokke'),
(38, 3, 1, 31, 1524300116, 'vertrokke'),
(39, 3, 1, 28, 1524300121, 'vertrokke'),
(40, 10, 8, 9, 1524300155, 'aangekome'),
(41, 10, 8, 13, 1524300253, 'aangekome'),
(42, 10, 8, 11, 1524300290, 'vertrokke'),
(43, 5, 3, 10, 1524300308, 'aangekome'),
(44, 10, 8, 15, 1524300360, 'aangekome'),
(45, 3, 1, 30, 1524300363, 'vertrokke'),
(46, 3, 1, 29, 1524300369, 'vertrokke'),
(47, 5, 3, 5, 1524300418, 'vertrokke'),
(48, 3, 1, 32, 1524300552, 'vertrokke'),
(49, 3, 1, 33, 1524300555, 'vertrokke'),
(50, 5, 3, 14, 1524300654, 'aangekome'),
(51, 5, 3, 8, 1524300662, 'vertrokke'),
(52, 10, 8, 9, 1524300664, 'vertrokke'),
(53, 3, 1, 34, 1524300739, 'vertrokke'),
(54, 3, 1, 36, 1524300745, 'vertrokke'),
(55, 5, 3, 12, 1524300805, 'aangekome'),
(56, 5, 3, 12, 1524300837, 'aangekome'),
(57, 10, 8, 13, 1524300918, 'vertrokke'),
(58, 5, 3, 10, 1524300953, 'vertrokke'),
(59, 3, 1, 40, 1524300960, 'vertrokke'),
(60, 3, 1, 37, 1524300963, 'vertrokke'),
(61, 10, 8, 17, 1524301023, 'aangekome'),
(62, 10, 8, 23, 1524301094, 'aangekome'),
(63, 10, 8, 15, 1524301127, 'vertrokke'),
(64, 3, 1, 41, 1524301159, 'vertrokke'),
(65, 5, 3, 16, 1524301161, 'aangekome'),
(66, 3, 1, 42, 1524301162, 'vertrokke'),
(67, 5, 3, 12, 1524301311, 'vertrokke'),
(68, 5, 3, 14, 1524301321, 'vertrokke'),
(69, 10, 8, 21, 1524301365, 'aangekome'),
(70, 3, 1, 44, 1524301387, 'vertrokke'),
(71, 3, 1, 39, 1524301393, 'vertrokke'),
(72, 10, 8, 17, 1524301596, 'vertrokke'),
(73, 3, 1, 46, 1524301621, 'vertrokke'),
(74, 5, 3, 18, 1524301624, 'aangekome'),
(75, 3, 1, 43, 1524301625, 'vertrokke'),
(76, 10, 8, 23, 1524301691, 'vertrokke'),
(77, 5, 3, 16, 1524301697, 'vertrokke'),
(78, 3, 1, 45, 1524301815, 'vertrokke'),
(79, 10, 8, 31, 1524301815, 'aangekome'),
(80, 5, 3, 22, 1524301946, 'aangekome'),
(81, 10, 8, 21, 1524301954, 'vertrokke'),
(82, 5, 3, 26, 1524301968, 'aangekome'),
(83, 5, 3, 24, 1524301995, 'aangekome'),
(84, 6, 4, 1, 1524302028, 'aangekome'),
(85, 6, 4, 1, 1524302040, 'vertrokke'),
(86, 6, 4, 3, 1524302048, 'aangekome'),
(87, 6, 4, 11, 1524302072, 'aangekome'),
(88, 5, 3, 26, 1524302194, 'vertrokke'),
(89, 10, 8, 29, 1524302235, 'aangekome'),
(90, 5, 3, 18, 1524302278, 'vertrokke'),
(91, 5, 3, 30, 1524302303, 'aangekome'),
(92, 6, 4, 10, 1524302332, 'aangekome'),
(93, 5, 3, 22, 1524302344, 'vertrokke'),
(94, 6, 4, 11, 1524302383, 'vertrokke'),
(95, 10, 8, 36, 1524302387, 'aangekome'),
(96, 10, 8, 31, 1524302423, 'vertrokke'),
(97, 10, 8, 33, 1524302473, 'aangekome'),
(98, 5, 3, 32, 1524302592, 'aangekome'),
(99, 5, 3, 24, 1524302647, 'vertrokke'),
(100, 6, 4, 3, 1524302658, 'vertrokke'),
(101, 5, 3, 30, 1524302675, 'vertrokke'),
(102, 9, 7, 4, 1524302709, 'aangekome'),
(103, 9, 7, 6, 1524302716, 'aangekome'),
(104, 10, 8, 29, 1524302728, 'vertrokke'),
(105, 10, 8, 40, 1524302798, 'aangekome'),
(106, 5, 3, 28, 1524302803, 'aangekome'),
(107, 6, 4, 14, 1524302864, 'aangekome'),
(108, 5, 3, 34, 1524303029, 'aangekome'),
(109, 10, 8, 44, 1524303079, 'aangekome'),
(110, 5, 3, 41, 1524303086, 'aangekome'),
(111, 6, 4, 10, 1524303150, 'vertrokke'),
(112, 10, 8, 36, 1524303177, 'vertrokke'),
(113, 6, 4, 12, 1524303184, 'aangekome'),
(114, 10, 8, 42, 1524303198, 'aangekome'),
(115, 5, 3, 39, 1524303230, 'aangekome'),
(116, 9, 7, 15, 1524303234, 'aangekome'),
(117, 6, 4, 16, 1524303301, 'aangekome'),
(118, 9, 7, 4, 1524303306, 'vertrokke'),
(119, 5, 3, 32, 1524303309, 'vertrokke'),
(120, 10, 8, 19, 1524303315, 'aangekome'),
(121, 9, 7, 6, 1524303322, 'vertrokke'),
(122, 10, 8, 27, 1524303363, 'aangekome'),
(123, 10, 8, 33, 1524303465, 'vertrokke'),
(124, 5, 3, 37, 1524303526, 'aangekome'),
(125, 5, 3, 41, 1524303588, 'vertrokke'),
(126, 9, 7, 9, 1524303593, 'aangekome'),
(127, 5, 3, 34, 1524303601, 'vertrokke'),
(128, 5, 3, 43, 1524303609, 'aangekome'),
(129, 10, 8, 40, 1524303723, 'vertrokke'),
(130, 5, 3, 28, 1524303739, 'vertrokke'),
(131, 5, 3, 39, 1524303778, 'vertrokke'),
(132, 6, 4, 26, 1524303802, 'aangekome'),
(133, 6, 4, 30, 1524303821, 'aangekome'),
(134, 9, 7, 15, 1524303839, 'vertrokke'),
(135, 6, 4, 14, 1524303845, 'vertrokke'),
(136, 6, 4, 12, 1524303885, 'vertrokke'),
(137, 9, 7, 13, 1524303888, 'aangekome'),
(138, 9, 7, 21, 1524303902, 'aangekome'),
(139, 9, 7, 31, 1524303918, 'aangekome'),
(140, 10, 8, 44, 1524304012, 'vertrokke'),
(141, 3, 1, 38, 1524304064, 'vertrokke'),
(142, 9, 7, 21, 1524304103, 'vertrokke'),
(143, 7, 5, 1, 1524304180, 'aangekome'),
(144, 10, 8, 42, 1524304198, 'vertrokke'),
(145, 6, 4, 24, 1524304201, 'aangekome'),
(146, 9, 7, 23, 1524304201, 'aangekome'),
(147, 6, 4, 16, 1524304259, 'vertrokke'),
(148, 6, 4, 22, 1524304302, 'aangekome'),
(149, 5, 3, 37, 1524304426, 'vertrokke'),
(150, 10, 8, 19, 1524304519, 'vertrokke'),
(151, 10, 8, 27, 1524304590, 'vertrokke'),
(152, 6, 4, 26, 1524304595, 'vertrokke'),
(153, 5, 3, 43, 1524304623, 'vertrokke'),
(154, 6, 4, 18, 1524304645, 'aangekome'),
(155, 9, 7, 17, 1524304648, 'aangekome'),
(156, 6, 4, 30, 1524304670, 'vertrokke'),
(157, 6, 4, 32, 1524304674, 'aangekome'),
(158, 6, 4, 26, 1524304742, 'aangekome'),
(159, 6, 4, 26, 1524304768, 'aangekome'),
(160, 8, 6, 4, 1524304826, 'aangekome'),
(161, 10, 8, 46, 1524304827, 'aangekome'),
(162, 6, 4, 41, 1524304844, 'aangekome'),
(163, 10, 8, 2, 1524304883, 'aangekome'),
(164, 9, 7, 31, 1524304942, 'vertrokke'),
(165, 6, 4, 39, 1524304967, 'aangekome'),
(166, 6, 4, 34, 1524305032, 'aangekome'),
(167, 7, 5, 1, 1524305032, 'vertrokke'),
(168, 6, 4, 38, 1524305112, 'aangekome'),
(169, 6, 4, 24, 1524305128, 'vertrokke'),
(170, 6, 4, 22, 1524305211, 'vertrokke'),
(171, 9, 7, 23, 1524305288, 'vertrokke'),
(172, 6, 4, 18, 1524305310, 'vertrokke'),
(173, 8, 6, 3, 1524305348, 'aangekome'),
(174, 10, 8, 2, 1524305357, 'vertrokke'),
(175, 8, 6, 15, 1524305474, 'aangekome'),
(176, 5, 3, 45, 1524305488, 'aangekome'),
(177, 8, 6, 21, 1524305511, 'aangekome'),
(178, 8, 6, 6, 1524305521, 'aangekome'),
(179, 6, 4, 39, 1524305523, 'vertrokke'),
(180, 6, 4, 8, 1524305535, 'aangekome'),
(181, 6, 4, 5, 1524305564, 'aangekome'),
(182, 9, 7, 36, 1524305589, 'aangekome'),
(183, 9, 7, 29, 1524305635, 'aangekome'),
(184, 8, 6, 4, 1524305651, 'vertrokke'),
(185, 9, 7, 33, 1524305677, 'aangekome'),
(186, 6, 4, 34, 1524305729, 'vertrokke'),
(187, 9, 7, 44, 1524305769, 'aangekome'),
(188, 6, 4, 5, 1524305784, 'vertrokke'),
(189, 8, 6, 1, 1524305824, 'aangekome'),
(190, 8, 6, 3, 1524305874, 'vertrokke'),
(191, 6, 4, 38, 1524305888, 'vertrokke'),
(192, 9, 7, 9, 1524305903, 'vertrokke'),
(193, 9, 7, 13, 1524305910, 'vertrokke'),
(194, 7, 5, 16, 1524306037, 'aangekome'),
(195, 7, 5, 18, 1524306048, 'aangekome'),
(196, 6, 4, 32, 1524306060, 'vertrokke'),
(197, 7, 5, 39, 1524306111, 'aangekome'),
(198, 8, 6, 15, 1524306127, 'vertrokke'),
(199, 6, 4, 8, 1524306136, 'vertrokke'),
(200, 9, 7, 17, 1524306188, 'vertrokke'),
(201, 10, 8, 46, 1524306264, 'vertrokke'),
(202, 6, 4, 41, 1524306320, 'vertrokke'),
(203, 8, 6, 6, 1524306346, 'vertrokke'),
(204, 8, 6, 21, 1524306440, 'vertrokke'),
(205, 5, 3, 45, 1524306483, 'vertrokke'),
(206, 7, 5, 30, 1524306603, 'aangekome'),
(207, 6, 4, 28, 1524306648, 'aangekome'),
(208, 9, 7, 29, 1524306652, 'vertrokke'),
(209, 7, 5, 32, 1524306658, 'aangekome'),
(210, 9, 7, 33, 1524306662, 'vertrokke'),
(211, 8, 6, 1, 1524306669, 'vertrokke'),
(212, 8, 6, 23, 1524306713, 'aangekome'),
(213, 7, 5, 18, 1524306740, 'vertrokke'),
(214, 7, 5, 34, 1524306753, 'aangekome'),
(215, 9, 7, 2, 1524307018, 'aangekome'),
(216, 7, 5, 39, 1524307019, 'vertrokke'),
(217, 6, 4, 43, 1524307057, 'aangekome'),
(218, 9, 7, 36, 1524307061, 'vertrokke'),
(219, 8, 6, 14, 1524307062, 'aangekome'),
(220, 6, 4, 28, 1524307072, 'vertrokke'),
(221, 7, 5, 16, 1524307082, 'vertrokke'),
(222, 9, 7, 40, 1524307118, 'aangekome'),
(223, 7, 5, 38, 1524307191, 'aangekome'),
(224, 8, 6, 23, 1524307198, 'vertrokke'),
(225, 8, 6, 12, 1524307223, 'aangekome'),
(226, 7, 5, 30, 1524307224, 'vertrokke'),
(227, 9, 7, 44, 1524307232, 'vertrokke'),
(228, 7, 5, 15, 1524307349, 'aangekome'),
(229, 7, 5, 34, 1524307468, 'vertrokke'),
(230, 8, 6, 13, 1524307497, 'aangekome'),
(231, 8, 6, 11, 1524307511, 'aangekome'),
(232, 8, 6, 14, 1524307562, 'vertrokke'),
(233, 7, 5, 26, 1524307585, 'aangekome'),
(234, 7, 5, 41, 1524307617, 'aangekome'),
(235, 8, 6, 39, 1524307686, 'aangekome'),
(236, 7, 5, 24, 1524307686, 'aangekome'),
(237, 7, 5, 22, 1524307727, 'aangekome'),
(238, 8, 6, 36, 1524307768, 'aangekome'),
(239, 7, 5, 32, 1524307798, 'vertrokke'),
(240, 7, 5, 3, 1524307825, 'aangekome'),
(241, 9, 7, 2, 1524307839, 'vertrokke'),
(242, 7, 5, 28, 1524307853, 'aangekome'),
(243, 8, 6, 12, 1524307858, 'vertrokke'),
(244, 7, 5, 15, 1524307866, 'vertrokke'),
(245, 8, 6, 30, 1524307938, 'aangekome'),
(246, 7, 5, 21, 1524307945, 'aangekome'),
(247, 7, 5, 6, 1524307952, 'aangekome'),
(248, 9, 7, 1, 1524307972, 'aangekome'),
(249, 8, 6, 33, 1524307982, 'aangekome'),
(250, 6, 4, 37, 1524308007, 'aangekome'),
(251, 6, 4, 43, 1524308046, 'vertrokke'),
(252, 8, 6, 18, 1524308076, 'aangekome'),
(253, 7, 5, 4, 1524308164, 'aangekome'),
(254, 8, 6, 13, 1524308187, 'vertrokke'),
(255, 7, 5, 10, 1524308209, 'aangekome'),
(256, 7, 5, 38, 1524308242, 'vertrokke'),
(257, 8, 6, 11, 1524308252, 'vertrokke'),
(258, 7, 5, 26, 1524308386, 'vertrokke'),
(259, 9, 7, 40, 1524308414, 'vertrokke'),
(260, 8, 6, 34, 1524308446, 'aangekome'),
(261, 7, 5, 3, 1524308471, 'vertrokke'),
(262, 6, 4, 45, 1524308529, 'aangekome'),
(263, 8, 6, 32, 1524308563, 'aangekome'),
(264, 8, 6, 44, 1524308575, 'aangekome'),
(265, 7, 5, 24, 1524308593, 'vertrokke'),
(266, 7, 5, 22, 1524308596, 'vertrokke'),
(267, 8, 6, 39, 1524308668, 'vertrokke'),
(268, 9, 7, 1, 1524308679, 'vertrokke'),
(269, 6, 4, 37, 1524308711, 'vertrokke'),
(270, 8, 6, 36, 1524308716, 'vertrokke'),
(271, 7, 5, 41, 1524308813, 'vertrokke'),
(272, 8, 6, 30, 1524309027, 'vertrokke'),
(273, 7, 5, 13, 1524309109, 'aangekome'),
(274, 7, 5, 11, 1524309112, 'aangekome'),
(275, 8, 6, 16, 1524309116, 'aangekome'),
(276, 8, 6, 24, 1524309145, 'aangekome'),
(277, 7, 5, 6, 1524309163, 'vertrokke'),
(278, 8, 6, 38, 1524309171, 'aangekome'),
(279, 7, 5, 4, 1524309179, 'vertrokke'),
(280, 8, 6, 33, 1524309209, 'vertrokke'),
(281, 8, 6, 22, 1524309223, 'aangekome'),
(282, 6, 4, 45, 1524309282, 'vertrokke'),
(283, 8, 6, 18, 1524309346, 'vertrokke'),
(284, 8, 6, 41, 1524309394, 'aangekome'),
(285, 7, 5, 28, 1524309471, 'vertrokke'),
(286, 7, 5, 10, 1524309578, 'vertrokke'),
(287, 7, 5, 21, 1524309646, 'vertrokke'),
(288, 7, 5, 37, 1524309716, 'aangekome'),
(289, 6, 4, 4, 1524309721, 'aangekome'),
(290, 8, 6, 32, 1524309729, 'vertrokke'),
(291, 8, 6, 34, 1524309737, 'vertrokke'),
(292, 7, 5, 13, 1524309766, 'vertrokke'),
(293, 8, 6, 26, 1524309823, 'aangekome'),
(294, 8, 6, 42, 1524309903, 'aangekome'),
(295, 9, 7, 39, 1524309927, 'aangekome'),
(296, 7, 5, 11, 1524309939, 'vertrokke'),
(297, 8, 6, 2, 1524309970, 'aangekome'),
(298, 6, 4, 6, 1524309973, 'aangekome'),
(299, 8, 6, 40, 1524309981, 'aangekome'),
(300, 8, 6, 29, 1524309995, 'aangekome'),
(301, 6, 4, 4, 1524310087, 'vertrokke'),
(302, 9, 7, 3, 1524310151, 'aangekome'),
(303, 8, 6, 44, 1524310152, 'vertrokke'),
(304, 7, 5, 43, 1524310195, 'aangekome'),
(305, 7, 5, 37, 1524310352, 'vertrokke'),
(306, 6, 4, 13, 1524310424, 'aangekome'),
(307, 8, 6, 10, 1524310436, 'aangekome'),
(308, 6, 4, 6, 1524310437, 'vertrokke'),
(309, 6, 4, 21, 1524310449, 'aangekome'),
(310, 9, 7, 32, 1524310531, 'aangekome'),
(311, 10, 8, 1, 1524310574, 'aangekome'),
(312, 8, 6, 24, 1524310605, 'vertrokke'),
(313, 9, 7, 30, 1524310678, 'aangekome'),
(314, 9, 7, 30, 1524310720, 'aangekome'),
(315, 8, 6, 31, 1524310743, 'aangekome'),
(316, 8, 6, 16, 1524310857, 'vertrokke'),
(317, 8, 6, 22, 1524310901, 'vertrokke'),
(318, 9, 7, 14, 1524310918, 'aangekome'),
(319, 7, 5, 44, 1524310985, 'aangekome'),
(320, 9, 7, 3, 1524311001, 'vertrokke'),
(321, 8, 6, 38, 1524311071, 'vertrokke'),
(322, 10, 8, 1, 1524311176, 'vertrokke'),
(323, 6, 4, 21, 1524311183, 'vertrokke'),
(324, 8, 6, 41, 1524311206, 'vertrokke'),
(325, 6, 4, 15, 1524311312, 'aangekome'),
(326, 6, 4, 13, 1524311403, 'vertrokke'),
(327, 7, 5, 43, 1524311412, 'vertrokke'),
(328, 9, 7, 32, 1524311545, 'vertrokke'),
(329, 9, 7, 16, 1524311557, 'aangekome'),
(330, 9, 7, 16, 1524311560, 'aangekome'),
(331, 9, 7, 22, 1524311587, 'aangekome'),
(332, 9, 7, 24, 1524311593, 'aangekome'),
(333, 3, 2, 27, 1524311609, 'aangekome'),
(334, 3, 2, 19, 1524311615, 'aangekome'),
(335, 5, 3, 4, 1524311655, 'aangekome'),
(336, 7, 5, 36, 1524311717, 'aangekome'),
(337, 9, 7, 34, 1524311727, 'aangekome'),
(338, 9, 7, 12, 1524311743, 'aangekome'),
(339, 8, 6, 26, 1524311781, 'vertrokke'),
(340, 8, 6, 42, 1524311820, 'vertrokke'),
(341, 3, 2, 25, 1524311886, 'aangekome'),
(342, 7, 5, 44, 1524311927, 'vertrokke'),
(343, 9, 7, 14, 1524311968, 'vertrokke'),
(344, 8, 6, 10, 1524311981, 'vertrokke'),
(345, 9, 7, 16, 1524312011, 'vertrokke'),
(346, 9, 7, 39, 1524312092, 'vertrokke'),
(347, 9, 7, 30, 1524312096, 'vertrokke'),
(348, 10, 8, 30, 1524312101, 'aangekome'),
(349, 10, 8, 39, 1524312116, 'aangekome'),
(350, 5, 3, 4, 1524312140, 'vertrokke'),
(351, 9, 7, 34, 1524312197, 'vertrokke'),
(352, 5, 3, 6, 1524312259, 'aangekome'),
(353, 8, 6, 2, 1524312259, 'vertrokke'),
(354, 8, 6, 40, 1524312274, 'vertrokke'),
(355, 10, 8, 3, 1524312388, 'aangekome'),
(356, 7, 5, 8, 1524312389, 'aangekome'),
(357, 7, 5, 23, 1524312411, 'aangekome'),
(358, 7, 5, 45, 1524312454, 'aangekome'),
(359, 8, 6, 28, 1524312465, 'aangekome'),
(360, 8, 6, 43, 1524312471, 'aangekome'),
(361, 7, 5, 36, 1524312511, 'vertrokke'),
(362, 9, 7, 38, 1524312574, 'aangekome'),
(363, 7, 5, 33, 1524312581, 'aangekome'),
(364, 8, 6, 29, 1524312613, 'vertrokke'),
(365, 8, 6, 17, 1524312633, 'aangekome'),
(366, 8, 6, 9, 1524312670, 'aangekome'),
(367, 10, 8, 30, 1524312678, 'vertrokke'),
(368, 10, 8, 32, 1524312757, 'aangekome'),
(369, 9, 7, 24, 1524312781, 'vertrokke'),
(370, 6, 4, 44, 1524312787, 'aangekome'),
(371, 6, 4, 15, 1524312793, 'vertrokke'),
(372, 3, 2, 1, 1524312829, 'aangekome'),
(373, 9, 7, 26, 1524312848, 'aangekome'),
(374, 8, 6, 31, 1524312849, 'vertrokke'),
(375, 7, 5, 8, 1524312921, 'vertrokke'),
(376, 9, 7, 22, 1524312932, 'vertrokke'),
(377, 5, 3, 13, 1524313001, 'aangekome'),
(378, 5, 3, 21, 1524313014, 'aangekome'),
(379, 5, 3, 6, 1524313020, 'vertrokke'),
(380, 9, 7, 12, 1524313086, 'vertrokke'),
(381, 7, 5, 33, 1524313143, 'vertrokke'),
(382, 6, 4, 36, 1524313144, 'aangekome'),
(383, 5, 3, 11, 1524313158, 'aangekome'),
(384, 8, 6, 43, 1524313171, 'vertrokke'),
(385, 8, 6, 28, 1524313190, 'vertrokke'),
(386, 7, 5, 23, 1524313234, 'vertrokke'),
(387, 10, 8, 39, 1524313234, 'vertrokke'),
(388, 5, 3, 15, 1524313281, 'aangekome'),
(389, 10, 8, 3, 1524313316, 'vertrokke'),
(390, 5, 3, 13, 1524313405, 'vertrokke'),
(391, 5, 3, 21, 1524313412, 'vertrokke'),
(392, 10, 8, 16, 1524313500, 'aangekome'),
(393, 5, 3, 11, 1524313521, 'vertrokke'),
(394, 6, 4, 44, 1524313538, 'vertrokke'),
(395, 9, 7, 26, 1524313560, 'vertrokke'),
(396, 7, 5, 31, 1524313594, 'aangekome'),
(397, 10, 8, 32, 1524313596, 'vertrokke'),
(398, 7, 5, 2, 1524313757, 'aangekome'),
(399, 7, 5, 31, 1524313769, 'vertrokke'),
(400, 6, 4, 36, 1524313806, 'vertrokke'),
(401, 8, 6, 17, 1524313868, 'vertrokke'),
(402, 8, 6, 9, 1524313877, 'vertrokke'),
(403, 10, 8, 34, 1524313944, 'aangekome'),
(404, 5, 3, 15, 1524313993, 'vertrokke'),
(405, 9, 7, 10, 1524314007, 'aangekome'),
(406, 7, 5, 45, 1524314008, 'vertrokke'),
(407, 9, 7, 38, 1524314025, 'vertrokke'),
(408, 7, 5, 40, 1524314084, 'aangekome'),
(409, 10, 8, 14, 1524314085, 'aangekome'),
(410, 8, 6, 8, 1524314093, 'aangekome'),
(411, 3, 2, 20, 1524314099, 'aangekome'),
(412, 9, 7, 28, 1524314142, 'aangekome'),
(413, 9, 7, 43, 1524314170, 'aangekome'),
(414, 3, 2, 30, 1524314274, 'aangekome'),
(415, 6, 4, 31, 1524314343, 'aangekome'),
(416, 9, 7, 10, 1524314468, 'vertrokke'),
(417, 10, 8, 16, 1524314478, 'vertrokke'),
(418, 3, 2, 4, 1524314586, 'aangekome'),
(419, 10, 8, 12, 1524314590, 'aangekome'),
(420, 7, 5, 29, 1524314652, 'aangekome'),
(421, 8, 6, 8, 1524314794, 'vertrokke'),
(422, 6, 4, 23, 1524314797, 'aangekome'),
(423, 9, 7, 43, 1524314848, 'vertrokke'),
(424, 9, 7, 43, 1524314850, 'vertrokke'),
(425, 3, 2, 39, 1524314851, 'aangekome'),
(426, 9, 7, 28, 1524314867, 'vertrokke'),
(427, 9, 7, 28, 1524314869, 'vertrokke'),
(428, 7, 5, 2, 1524314884, 'vertrokke'),
(429, 10, 8, 34, 1524314920, 'vertrokke'),
(430, 7, 5, 40, 1524315022, 'vertrokke'),
(431, 7, 5, 29, 1524315113, 'vertrokke'),
(432, 6, 4, 31, 1524315155, 'vertrokke'),
(433, 10, 8, 14, 1524315178, 'vertrokke'),
(434, 3, 2, 3, 1524315193, 'aangekome'),
(435, 5, 3, 44, 1524315221, 'aangekome'),
(436, 7, 5, 5, 1524315281, 'aangekome'),
(437, 3, 2, 32, 1524315309, 'aangekome'),
(438, 8, 6, 37, 1524315323, 'aangekome'),
(439, 3, 2, 13, 1524315375, 'aangekome'),
(440, 5, 3, 36, 1524315451, 'aangekome'),
(441, 3, 2, 21, 1524315466, 'aangekome'),
(442, 6, 4, 33, 1524315489, 'aangekome'),
(443, 10, 8, 12, 1524315511, 'vertrokke'),
(444, 3, 2, 11, 1524315531, 'aangekome'),
(445, 10, 8, 41, 1524315581, 'aangekome'),
(446, 6, 4, 23, 1524315625, 'vertrokke'),
(447, 3, 2, 6, 1524315636, 'aangekome'),
(448, 10, 8, 38, 1524315640, 'aangekome'),
(449, 8, 6, 37, 1524315651, 'vertrokke'),
(450, 10, 8, 26, 1524315746, 'aangekome'),
(451, 10, 8, 10, 1524315775, 'aangekome'),
(452, 6, 4, 2, 1524315815, 'aangekome'),
(453, 6, 4, 40, 1524315830, 'aangekome'),
(454, 8, 6, 45, 1524315874, 'aangekome'),
(455, 5, 3, 44, 1524315926, 'vertrokke'),
(456, 5, 3, 36, 1524315928, 'vertrokke'),
(457, 3, 2, 15, 1524316086, 'aangekome'),
(458, 5, 3, 46, 1524316129, 'aangekome'),
(459, 5, 3, 46, 1524316132, 'vertrokke'),
(460, 10, 8, 43, 1524316146, 'aangekome'),
(461, 10, 8, 38, 1524316158, 'vertrokke'),
(462, 6, 4, 33, 1524316189, 'vertrokke'),
(463, 9, 7, 8, 1524316299, 'aangekome'),
(464, 9, 7, 18, 1524316303, 'aangekome'),
(465, 10, 8, 26, 1524316306, 'vertrokke'),
(466, 10, 8, 41, 1524316316, 'vertrokke'),
(467, 7, 5, 5, 1524316346, 'vertrokke'),
(468, 3, 2, 16, 1524316415, 'aangekome'),
(469, 5, 3, 38, 1524316442, 'aangekome'),
(470, 5, 3, 38, 1524316446, 'vertrokke'),
(471, 10, 8, 28, 1524316498, 'aangekome'),
(472, 10, 8, 10, 1524316582, 'vertrokke'),
(473, 8, 6, 45, 1524316720, 'vertrokke'),
(474, 10, 8, 28, 1524316791, 'vertrokke'),
(475, 10, 8, 43, 1524316851, 'vertrokke'),
(476, 5, 3, 31, 1524316929, 'aangekome'),
(477, 6, 4, 2, 1524316962, 'vertrokke'),
(478, 6, 4, 40, 1524316964, 'vertrokke'),
(479, 9, 7, 8, 1524317050, 'vertrokke'),
(480, 9, 7, 18, 1524317052, 'vertrokke'),
(481, 3, 2, 34, 1524317088, 'aangekome'),
(482, 10, 8, 22, 1524317108, 'aangekome'),
(483, 10, 8, 24, 1524317113, 'aangekome'),
(484, 5, 3, 23, 1524317159, 'aangekome'),
(485, 5, 3, 31, 1524317177, 'vertrokke'),
(486, 5, 3, 23, 1524317179, 'vertrokke'),
(487, 3, 2, 14, 1524317306, 'aangekome'),
(488, 3, 2, 12, 1524317517, 'aangekome'),
(489, 3, 2, 36, 1524317870, 'aangekome'),
(490, 3, 2, 44, 1524317877, 'aangekome'),
(491, 5, 3, 33, 1524317960, 'aangekome'),
(492, 5, 3, 33, 1524317964, 'vertrokke'),
(493, 10, 8, 22, 1524318167, 'vertrokke'),
(494, 10, 8, 24, 1524318170, 'vertrokke'),
(495, 3, 2, 41, 1524318210, 'aangekome'),
(496, 3, 2, 26, 1524318294, 'aangekome'),
(497, 3, 2, 10, 1524318459, 'aangekome'),
(498, 5, 3, 40, 1524318589, 'aangekome'),
(499, 5, 3, 2, 1524318596, 'aangekome'),
(500, 8, 6, 5, 1524318597, 'aangekome'),
(501, 5, 3, 40, 1524318599, 'vertrokke'),
(502, 5, 3, 2, 1524318601, 'vertrokke'),
(503, 3, 2, 28, 1524318683, 'aangekome'),
(504, 3, 2, 38, 1524318844, 'aangekome'),
(505, 10, 8, 8, 1524318981, 'aangekome'),
(506, 10, 8, 18, 1524319016, 'aangekome'),
(507, 8, 6, 5, 1524319020, 'vertrokke'),
(508, 3, 2, 43, 1524319073, 'aangekome'),
(509, 10, 8, 8, 1524319252, 'vertrokke'),
(510, 10, 8, 18, 1524319254, 'vertrokke'),
(511, 5, 3, 17, 1524319270, 'aangekome'),
(512, 5, 3, 17, 1524319275, 'vertrokke'),
(513, 3, 2, 31, 1524319325, 'aangekome'),
(514, 3, 2, 46, 1524319421, 'aangekome'),
(515, 3, 2, 23, 1524319526, 'aangekome'),
(516, 3, 2, 22, 1524319958, 'aangekome'),
(517, 3, 2, 24, 1524319992, 'aangekome'),
(518, 3, 2, 33, 1524320592, 'aangekome'),
(519, 3, 2, 2, 1524320897, 'aangekome'),
(520, 3, 2, 40, 1524320907, 'aangekome'),
(521, 3, 2, 37, 1524321153, 'aangekome'),
(522, 3, 2, 29, 1524321242, 'aangekome'),
(523, 3, 2, 42, 1524321531, 'aangekome'),
(524, 3, 2, 18, 1524321540, 'aangekome'),
(525, 3, 2, 8, 1524321567, 'aangekome'),
(526, 3, 2, 5, 1524322103, 'aangekome'),
(527, 3, 2, 9, 1524323461, 'aangekome'),
(528, 3, 2, 17, 1524323469, 'aangekome'),
(529, 3, 2, 45, 1524325221, 'aangekome'),
(530, 2, 4, 26, 1524301440, 'aangekome'),
(531, 2, 4, 26, 1524304595, 'vertrokke'),
(532, 2, 4, 26, 1524303780, 'aangekome'),
(533, 2, 4, 26, 1524304595, 'vertrokke'),
(534, 2, 4, 26, 1524303780, 'aangekome'),
(535, 2, 4, 26, 1524268560, 'vertrokke'),
(536, 2, 4, 26, 1524303780, 'aangekome'),
(537, 2, 4, 26, 1524304560, 'vertrokke'),
(538, 2, 4, 26, 1524303780, 'aangekome'),
(539, 2, 4, 26, 1524265320, 'vertrokke'),
(540, 2, 4, 26, 1524303780, 'aangekome'),
(541, 2, 4, 26, 1524261720, 'vertrokke'),
(542, 2, 4, 26, 1524303780, 'aangekome'),
(543, 2, 4, 26, 1524261600, 'vertrokke'),
(544, 2, 4, 26, 1524303780, 'aangekome'),
(545, 2, 4, 26, 1524261900, 'vertrokke'),
(546, 2, 4, 26, 1524303780, 'aangekome'),
(547, 2, 4, 26, 1524305100, 'vertrokke');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tocht_post`
--

CREATE TABLE `tocht_post` (
  `id` int(11) NOT NULL,
  `naam` varchar(200) NOT NULL,
  `type_post` enum('post','start','stop','checkpoint') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `tocht_post`
--

INSERT INTO `tocht_post` (`id`, `naam`, `type_post`) VALUES
(1, 'Start', 'start'),
(2, 'Finish', 'stop'),
(3, 'Post 1', 'post'),
(4, 'Post 2', 'post'),
(5, 'Post 3', 'post'),
(6, 'Post 4', 'post'),
(7, 'Post 5', 'post'),
(8, 'Post 6', 'post');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tocht_route`
--

CREATE TABLE `tocht_route` (
  `route` int(11) NOT NULL,
  `place` int(11) NOT NULL,
  `post` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `tocht_route`
--

INSERT INTO `tocht_route` (`route`, `place`, `post`) VALUES
(1, 0, 1),
(2, 0, 1),
(1, 7, 2),
(2, 7, 2),
(1, 1, 3),
(2, 6, 3),
(1, 2, 4),
(2, 5, 4),
(1, 3, 5),
(2, 4, 5),
(1, 4, 6),
(2, 3, 6),
(1, 5, 7),
(2, 2, 7),
(1, 6, 8),
(2, 1, 8);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `tag` varchar(40) NOT NULL,
  `post` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`user`,`score_veld`),
  ADD KEY `score_veld` (`score_veld`);

--
-- Indexen voor tabel `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team` (`team`),
  ADD KEY `score_veld` (`score_veld`),
  ADD KEY `user` (`user`);

--
-- Indexen voor tabel `route_info`
--
ALTER TABLE `route_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `score_groep`
--
ALTER TABLE `score_groep`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `naam` (`naam`);

--
-- Indexen voor tabel `score_veld`
--
ALTER TABLE `score_veld`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groep` (`groep`);

--
-- Indexen voor tabel `subkamp`
--
ALTER TABLE `subkamp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `naam` (`naam`);

--
-- Indexen voor tabel `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nummer` (`nummer`),
  ADD UNIQUE KEY `tag` (`tag`),
  ADD KEY `kamp` (`kamp`),
  ADD KEY `joker` (`joker`),
  ADD KEY `team_ibfk_3` (`route`);

--
-- Indexen voor tabel `tocht_log`
--
ALTER TABLE `tocht_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tocht_log_ibfk_1` (`post`,`team`) USING BTREE,
  ADD KEY `team` (`team`),
  ADD KEY `user` (`user`);

--
-- Indexen voor tabel `tocht_log_org`
--
ALTER TABLE `tocht_log_org`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tocht_log_ibfk_1` (`post`,`team`) USING BTREE,
  ADD KEY `team` (`team`),
  ADD KEY `user` (`user`);

--
-- Indexen voor tabel `tocht_post`
--
ALTER TABLE `tocht_post`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `naam` (`naam`);

--
-- Indexen voor tabel `tocht_route`
--
ALTER TABLE `tocht_route`
  ADD PRIMARY KEY (`route`,`place`),
  ADD KEY `post` (`post`),
  ADD KEY `route` (`route`);

--
-- Indexen voor tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user` (`user`) USING BTREE,
  ADD KEY `user_ibfk_1` (`post`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `route_info`
--
ALTER TABLE `route_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `score_groep`
--
ALTER TABLE `score_groep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT voor een tabel `score_veld`
--
ALTER TABLE `score_veld`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT voor een tabel `subkamp`
--
ALTER TABLE `subkamp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT voor een tabel `tocht_log`
--
ALTER TABLE `tocht_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `tocht_log_org`
--
ALTER TABLE `tocht_log_org`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=548;

--
-- AUTO_INCREMENT voor een tabel `tocht_post`
--
ALTER TABLE `tocht_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT voor een tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `auth`
--
ALTER TABLE `auth`
  ADD CONSTRAINT `auth_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `auth_ibfk_2` FOREIGN KEY (`score_veld`) REFERENCES `score_veld` (`id`);

--
-- Beperkingen voor tabel `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_ibfk_1` FOREIGN KEY (`team`) REFERENCES `team` (`id`),
  ADD CONSTRAINT `log_ibfk_2` FOREIGN KEY (`score_veld`) REFERENCES `score_veld` (`id`),
  ADD CONSTRAINT `log_ibfk_3` FOREIGN KEY (`user`) REFERENCES `user` (`id`);

--
-- Beperkingen voor tabel `score_veld`
--
ALTER TABLE `score_veld`
  ADD CONSTRAINT `score_veld_ibfk_1` FOREIGN KEY (`groep`) REFERENCES `score_groep` (`id`);

--
-- Beperkingen voor tabel `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `team_ibfk_1` FOREIGN KEY (`kamp`) REFERENCES `subkamp` (`id`),
  ADD CONSTRAINT `team_ibfk_2` FOREIGN KEY (`joker`) REFERENCES `score_groep` (`id`),
  ADD CONSTRAINT `team_ibfk_3` FOREIGN KEY (`route`) REFERENCES `route_info` (`id`);

--
-- Beperkingen voor tabel `tocht_log`
--
ALTER TABLE `tocht_log`
  ADD CONSTRAINT `tocht_log_ibfk_1` FOREIGN KEY (`post`) REFERENCES `tocht_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tocht_log_ibfk_2` FOREIGN KEY (`team`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tocht_log_ibfk_3` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `tocht_route`
--
ALTER TABLE `tocht_route`
  ADD CONSTRAINT `tocht_route_ibfk_1` FOREIGN KEY (`post`) REFERENCES `tocht_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tocht_route_ibfk_2` FOREIGN KEY (`route`) REFERENCES `route_info` (`id`);

--
-- Beperkingen voor tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`post`) REFERENCES `tocht_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
