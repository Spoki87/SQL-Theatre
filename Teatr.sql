DROP DATABASE IF EXISTS TEATR;
CREATE DATABASE TEATR;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ile_biletow` ()  NO SQL
select nazwa,count(bilet.id_biletu) as 'ile biletów' from bilet,spektakl where bilet.id_spektaklu=spektakl.id_spektaklu GROUP BY nazwa ORDER BY count(bilet.id_biletu) DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `jakie_bilety` ()  NO SQL
select rodzaj_biletu, COUNT(id_biletu) as 'ile biletów' from bilet GROUP BY rodzaj_biletu$$

DELIMITER ;



CREATE TABLE `bilet` (
  `Id_biletu` int(8) NOT NULL,
  `Id_spektaklu` int(8) NOT NULL,
  `Id_klienta` int(8) NOT NULL,
  `Id_miejsca` int(8) NOT NULL,
  `rodzaj_biletu` varchar(30) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `bilet` (`Id_biletu`, `Id_spektaklu`, `Id_klienta`, `Id_miejsca`, `rodzaj_biletu`) VALUES
(1, 1, 1, 3, 'Normalny'),
(2, 1, 2, 4, 'Normalny'),
(3, 1, 3, 6, 'Normalny'),
(4, 4, 4, 15, 'Ulgowy'),
(5, 5, 5, 20, 'Normalny'),
(6, 3, 6, 5, 'Normalny'),
(7, 2, 7, 1, 'Ulgowy'),
(8, 2, 9, 10, 'Normalny'),
(9, 2, 8, 21, 'Ulgowy'),
(10, 4, 10, 14, 'Normalny'),
(11, 5, 11, 18, 'Ulgowy'),
(12, 5, 13, 17, 'Normalny'),
(13, 2, 12, 20, 'Normalny'),
(14, 3, 14, 8, 'Normalny'),
(15, 4, 15, 13, 'Normalny'),
(16, 4, 16, 21, 'Ulgowy'),
(17, 5, 17, 3, 'Normalny'),
(18, 5, 18, 4, 'Ulgowy'),
(19, 1, 19, 13, 'Normalny'),
(20, 1, 20, 25, 'Ulgowy'),
(21, 2, 22, 5, 'Normalny'),
(22, 2, 23, 7, 'Ulgowy'),
(23, 3, 24, 12, 'Ulgowy'),
(24, 3, 26, 26, 'Normalny'),
(25, 5, 27, 8, 'Normalny'),
(26, 4, 29, 28, 'Normalny'),
(27, 3, 30, 27, 'Normalny');


CREATE TABLE `klient` (
  `Id_klienta` int(8) NOT NULL,
  `Imie` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `Nazwisko` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `Numer telefonu` varchar(9) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `klient` (`Id_klienta`, `Imie`, `Nazwisko`, `Numer telefonu`) VALUES
(1, 'Dariusz', 'Figarski', '600876123'),
(2, 'Kewin', 'Ścigała', '609124756'),
(3, 'Mariusz', 'Sobieszek', '504725637'),
(4, 'Patryk', 'Czerw', '305478264'),
(5, 'Maciej', 'Iwanowicz', '689162487'),
(6, 'Gustaw', 'Popowski', '143578675'),
(7, 'Bartosz', 'Lebioda', '499765456'),
(8, 'Aleksandra', 'Pełka', '123543789'),
(9, 'Paulina', 'Sadłowska', '597345195'),
(10, 'Sylwia', 'Komosa', '948487315'),
(11, 'Maksymilian', 'Niedźwiedź', '975135452'),
(12, 'Damian', 'Skowroński', '745845963'),
(13, 'Jan', 'Kowalczyk', '157785964'),
(14, 'Wiktoria', 'Dębska', '325648421'),
(15, 'Bartek', 'Szczepański', '186486213'),
(16, 'Natalia', 'Kowalewska', '189546541'),
(17, 'Michał', 'Żukowski', '984165561'),
(18, 'Wiktoria', 'Wolska', '864162131'),
(19, 'Jakub', 'Wójcik', '984964635'),
(20, 'Jeremi', 'Chmielewski', '486454163'),
(21, 'Amelia', 'Kaźmierczak', '468541651'),
(22, 'Krzysztof', 'Marciniak', '496846353'),
(23, 'Maja', 'Muszyńska', '486465284'),
(24, 'Zofia', 'Zakrzewska', '488654654'),
(25, 'Jakub', 'Kurkowski', '912184621'),
(26, 'Pola', 'Brzezińska', '687462411'),
(27, 'Wiktoria', 'Dąbkowska', '987986564'),
(28, 'Bartek', 'Romanowski', '498468545'),
(29, 'Alan', 'Jasiński', '489486534'),
(30, 'Michał', 'Grabowski', '487986442');


CREATE TABLE `logi_spektakli` (
  `id_log` int(11) NOT NULL,
  `nazwa_spektaklu` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL,
  `Id_spektaklu` int(11) NOT NULL,
  `operacja` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;


INSERT INTO `logi_spektakli` (`id_log`, `nazwa_spektaklu`, `Id_spektaklu`, `operacja`, `data`) VALUES
(9, 'Nieodkryty Świat', 12, 'Dodano', '2021-04-13 23:53:50'),
(10, 'Nieodkryty Świat', 12, 'usunieto', '2021-04-13 23:53:58');


CREATE TABLE `miejsca` (
  `Id_miejsca` int(8) NOT NULL,
  `Numer_siedzenia` int(2) NOT NULL,
  `Numer_rzędu` int(2) NOT NULL,
  `balkon` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `miejsca` (`Id_miejsca`, `Numer_siedzenia`, `Numer_rzędu`, `balkon`) VALUES
(1, 1, 1, 0),
(21, 1, 1, 1),
(11, 1, 2, 0),
(2, 2, 1, 0),
(22, 2, 1, 1),
(12, 2, 2, 0),
(3, 3, 1, 0),
(23, 3, 1, 1),
(13, 3, 2, 0),
(4, 4, 1, 0),
(24, 4, 1, 1),
(14, 4, 2, 0),
(5, 5, 1, 0),
(25, 5, 1, 1),
(15, 5, 2, 0),
(6, 6, 1, 0),
(26, 6, 1, 1),
(16, 6, 2, 0),
(7, 7, 1, 0),
(27, 7, 1, 1),
(17, 7, 2, 0),
(8, 8, 1, 0),
(28, 8, 1, 1),
(18, 8, 2, 0),
(9, 9, 1, 0),
(29, 9, 1, 1),
(19, 9, 2, 0),
(10, 10, 1, 0),
(30, 10, 1, 1),
(20, 10, 2, 0);


CREATE TABLE `spektakl` (
  `Id_spektaklu` int(8) NOT NULL,
  `Nazwa` varchar(30) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `Godzina` datetime NOT NULL,
  `Czas_trwania` time NOT NULL,
  `Gatunek` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `spektakl` (`Id_spektaklu`, `Nazwa`, `Godzina`, `Czas_trwania`, `Gatunek`) VALUES
(1, 'Kolacja dla Głupca', '2021-04-12 20:00:00', '03:00:00', 'Komedia'),
(2, 'Pozytywni', '2021-04-18 19:00:00', '02:30:00', 'Tragikomedia'),
(3, 'Pomoc domowa', '2021-04-16 20:00:00', '02:00:00', 'Komedia'),
(4, 'Hamlet', '2021-04-24 18:30:00', '02:00:00', 'Dramat'),
(5, 'Piloci', '2021-04-25 16:30:00', '03:00:00', 'Musical');


DELIMITER $$
CREATE TRIGGER `DodawanieLog` AFTER INSERT ON `spektakl` FOR EACH ROW INSERT INTO logi_spektakli VALUES(null,NEW.nazwa,new.id_spektaklu,"Dodano",NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UsuwanieLog` AFTER DELETE ON `spektakl` FOR EACH ROW INSERT INTO logi_spektakli VALUES(null,OLD.nazwa,old.id_spektaklu,"usunieto",NOW())
$$
DELIMITER ;

ALTER TABLE `bilet`
  ADD PRIMARY KEY (`Id_biletu`),
  ADD KEY `Id_spektaklu` (`Id_spektaklu`) USING BTREE,
  ADD KEY `Id_klienta` (`Id_klienta`),
  ADD KEY `Id_miejsca` (`Id_miejsca`);


ALTER TABLE `klient`
  ADD PRIMARY KEY (`Id_klienta`),
  ADD UNIQUE KEY `index_osoby` (`Nazwisko`,`Imie`);


ALTER TABLE `logi_spektakli`
  ADD PRIMARY KEY (`id_log`);


ALTER TABLE `miejsca`
  ADD PRIMARY KEY (`Id_miejsca`),
  ADD UNIQUE KEY `index_miejsca` (`Numer_siedzenia`,`Numer_rzędu`,`balkon`);


ALTER TABLE `spektakl`
  ADD PRIMARY KEY (`Id_spektaklu`),
  ADD UNIQUE KEY `index_spektakl` (`Nazwa`);


ALTER TABLE `bilet`
  MODIFY `Id_biletu` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;


ALTER TABLE `klient`
  MODIFY `Id_klienta` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;


ALTER TABLE `logi_spektakli`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;


ALTER TABLE `miejsca`
  MODIFY `Id_miejsca` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;


ALTER TABLE `spektakl`
  MODIFY `Id_spektaklu` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;


ALTER TABLE `bilet`
  ADD CONSTRAINT `bilet_ibfk_1` FOREIGN KEY (`Id_klienta`) REFERENCES `klient` (`Id_klienta`),
  ADD CONSTRAINT `bilet_ibfk_2` FOREIGN KEY (`Id_miejsca`) REFERENCES `miejsca` (`Id_miejsca`),
  ADD CONSTRAINT `bilet_ibfk_3` FOREIGN KEY (`Id_spektaklu`) REFERENCES `spektakl` (`Id_spektaklu`);
COMMIT;
