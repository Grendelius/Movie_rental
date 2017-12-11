-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 11 Gru 2017, 20:12
-- Wersja serwera: 10.1.28-MariaDB
-- Wersja PHP: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `wypozyczalnia`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `film`
--

CREATE TABLE `film` (
  `idFilmu` int(10) NOT NULL,
  `tytul` varchar(255) COLLATE utf8_bin NOT NULL,
  `rokProdukcji` int(10) NOT NULL,
  `opis` varchar(255) COLLATE utf8_bin NOT NULL,
  `sredniaOcena` double NOT NULL,
  `dataDodania` date NOT NULL,
  `okladka` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `film`
--

INSERT INTO `film` (`idFilmu`, `tytul`, `rokProdukcji`, `opis`, `sredniaOcena`, `dataDodania`, `okladka`) VALUES
(1, 'Skazani na Shawshank', 1994, 'Adaptacja opowiadania Stephena Kinga. Niesłusznie skazany na dożywocie bankier, stara się przetrwać w brutalnym, więziennym świecie.', 0, '2017-12-06', NULL),
(2, 'Ojciec Chrzestny', 1972, 'Opowieść o nowojorskiej rodzinie mafijnej. Starzejący się Don Corleone pragnie przekazać władzę swojemu synowi.', 0, '2017-12-01', NULL),
(3, 'Nietykalni', 2011, 'Sparaliżowany milioner zatrudnia do opieki młodego chłopaka z przedmieścia, który właśnie wyszedł z więzienia.', 2, '2017-12-07', 'https://upload.wikimedia.org/wikipedia/en/9/93/The_Intouchables.jpg'),
(4, 'Zielona mila', 1999, 'Emerytowany strażnik więzienny opowiada przyjaciółce o niezwykłym mężczyźnie, którego skazano na śmierć za zabójstwo dwóch 9-letnich dziewczynek.', 0, '2017-12-03', NULL),
(5, 'Forrest Gump', 1994, 'Historia życia Forresta, chłopca o niskim ilorazie inteligencji z niedowładem kończyn, który staje się miliarderem i bohaterem wojny w Wietnamie.', 0, '2017-12-05', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gatunek`
--

CREATE TABLE `gatunek` (
  `nazwa` varchar(255) COLLATE utf8_bin NOT NULL,
  `idFilmu` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `gatunek`
--

INSERT INTO `gatunek` (`nazwa`, `idFilmu`) VALUES
('Biograficzny', 3),
('Dramat', 1),
('Komedia', 3),
('Dramat', 3),
('Dramat', 4),
('Dramat', 2),
('Gangsterski', 2),
('Dramat', 5),
('Komedia', 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ocena`
--

CREATE TABLE `ocena` (
  `idOceny` int(10) NOT NULL,
  `wartosc` int(10) NOT NULL,
  `idFilmu` int(10) NOT NULL,
  `idUzytkownika` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `platnosc`
--

CREATE TABLE `platnosc` (
  `idPlatnosci` int(10) NOT NULL,
  `idUzytkownika` int(10) NOT NULL,
  `typ` varchar(255) COLLATE utf8_bin NOT NULL,
  `suma` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `recenzja`
--

CREATE TABLE `recenzja` (
  `idRecenzji` int(10) NOT NULL,
  `tresc` varchar(255) COLLATE utf8_bin NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idFilmu` int(10) NOT NULL,
  `idUzytkownika` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sklep`
--

CREATE TABLE `sklep` (
  `idSklepu` int(10) NOT NULL,
  `nazwaSklepu` varchar(255) COLLATE utf8_bin NOT NULL,
  `ulica` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `sklep`
--

INSERT INTO `sklep` (`idSklepu`, `nazwaSklepu`, `ulica`) VALUES
(1, 'Sklep nr1', '3 Maja '),
(2, 'Sklep nr2', 'Warszawska 24'),
(3, 'Sklep nr3', 'Okulickiego 34');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sklep_film`
--

CREATE TABLE `sklep_film` (
  `idSklepu` int(10) NOT NULL,
  `idFilmu` int(10) NOT NULL,
  `iloscFilmow` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `sklep_film`
--

INSERT INTO `sklep_film` (`idSklepu`, `idFilmu`, `iloscFilmow`) VALUES
(1, 1, 4),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `idUzytkownika` int(10) NOT NULL,
  `login` varchar(255) COLLATE utf8_bin NOT NULL,
  `haslo` varchar(255) COLLATE utf8_bin NOT NULL,
  `imie` varchar(255) COLLATE utf8_bin NOT NULL,
  `nazwisko` varchar(255) COLLATE utf8_bin NOT NULL,
  `numerTelefonu` varchar(255) COLLATE utf8_bin NOT NULL,
  `miejsceZamieszkania` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `rola` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `uzytkownik`
--

INSERT INTO `uzytkownik` (`idUzytkownika`, `login`, `haslo`, `imie`, `nazwisko`, `numerTelefonu`, `miejsceZamieszkania`, `email`, `rola`) VALUES
(3, 'admin1', '0192023a7bbd73250516f069df18b500', 'admin', 'admin', '111222333', 'admin', 'admin@gmail.com', 'pracownik'),
(4, 'user12345', '80ec08504af83331911f5882349af59d', 'user', 'user', '111222111', 'user', 'user@gmail.com', 'klient'),
(5, 'user23456', 'b6a02b73d239c9b22e74c406b6b53fbc', 'user23456', 'user23456', '111111111', 'user23456', 'user23456@gmail.com', 'klient'),
(6, 'user54321', '62d45781b210f9961097d1cfe90fbac5', 'user54321', 'user54321', '22222222', 'user54321', 'user54321@gmail.com', 'klient');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wypozyczenie`
--

CREATE TABLE `wypozyczenie` (
  `idWypozyczenia` int(10) NOT NULL,
  `dataWypozyczenia` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dataZwrotu` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idUzytkownika` int(10) NOT NULL,
  `idFilmu` int(10) NOT NULL,
  `idSklepu` int(10) NOT NULL,
  `znizka` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `idPlatnosci` int(10) DEFAULT NULL,
  `status` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `wypozyczenie`
--

INSERT INTO `wypozyczenie` (`idWypozyczenia`, `dataWypozyczenia`, `dataZwrotu`, `idUzytkownika`, `idFilmu`, `idSklepu`, `znizka`, `idPlatnosci`, `status`) VALUES
(14, '2017-12-10 20:22:54', '2017-12-10 20:52:54', 5, 1, 2, NULL, NULL, 'Zakończony'),
(41, '2017-12-11 12:20:58', '2017-12-11 12:21:34', 6, 3, 3, NULL, NULL, 'Zakończony'),
(42, '2017-12-11 12:21:18', '2017-12-11 12:21:44', 5, 3, 3, NULL, NULL, 'Zakończony'),
(44, '2017-12-11 12:31:19', '2017-12-11 12:31:46', 4, 3, 3, NULL, NULL, 'Zakończony'),
(45, '2017-12-11 12:31:33', '2017-12-11 12:31:51', 5, 3, 3, NULL, NULL, 'Zakończony'),
(47, '2017-12-11 17:13:50', '2017-12-11 17:49:10', 4, 3, 3, NULL, NULL, 'Zakończony'),
(61, '2017-12-11 18:46:49', '2017-12-11 18:47:27', 4, 3, 3, NULL, NULL, 'Zakończony'),
(63, '2017-12-11 18:53:17', '2017-12-11 18:54:43', 4, 3, 3, NULL, NULL, 'Zakończony'),
(67, '2017-12-11 18:57:04', '2017-12-11 18:57:23', 6, 3, 3, NULL, NULL, 'Zakończony');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienie`
--

CREATE TABLE `zamowienie` (
  `idZamowienia` int(10) NOT NULL,
  `dataZamowienia` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idUzytkownika` int(10) NOT NULL,
  `idSklepu` int(10) NOT NULL,
  `idFilmu` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zapowiedz`
--

CREATE TABLE `zapowiedz` (
  `idFilmu` int(10) NOT NULL,
  `linkZapowiedzi` varchar(255) COLLATE utf8_bin NOT NULL,
  `czasTrwania` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zdjecie`
--

CREATE TABLE `zdjecie` (
  `idFilmu` int(10) NOT NULL,
  `linkZdjecia` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `znizka`
--

CREATE TABLE `znizka` (
  `nazwaZnizki` varchar(255) COLLATE utf8_bin NOT NULL,
  `procent` varchar(255) COLLATE utf8_bin NOT NULL,
  `opis` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`idFilmu`);

--
-- Indexes for table `gatunek`
--
ALTER TABLE `gatunek`
  ADD KEY `IdFilmu` (`idFilmu`);

--
-- Indexes for table `ocena`
--
ALTER TABLE `ocena`
  ADD PRIMARY KEY (`idOceny`),
  ADD KEY `IdUżytkownika` (`idUzytkownika`),
  ADD KEY `IdFilmu` (`idFilmu`);

--
-- Indexes for table `platnosc`
--
ALTER TABLE `platnosc`
  ADD PRIMARY KEY (`idPlatnosci`),
  ADD KEY `IdUżytkownika` (`idUzytkownika`);

--
-- Indexes for table `recenzja`
--
ALTER TABLE `recenzja`
  ADD PRIMARY KEY (`idRecenzji`),
  ADD KEY `IdUżytkownika` (`idUzytkownika`),
  ADD KEY `IdFilmu` (`idFilmu`);

--
-- Indexes for table `sklep`
--
ALTER TABLE `sklep`
  ADD PRIMARY KEY (`idSklepu`);

--
-- Indexes for table `sklep_film`
--
ALTER TABLE `sklep_film`
  ADD KEY `IdFilmu` (`idFilmu`),
  ADD KEY `IdSklepu` (`idSklepu`);

--
-- Indexes for table `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`idUzytkownika`),
  ADD UNIQUE KEY `Login` (`login`),
  ADD UNIQUE KEY `NumerTelefonu` (`numerTelefonu`),
  ADD UNIQUE KEY `login_2` (`login`),
  ADD UNIQUE KEY `numerTelefonu_2` (`numerTelefonu`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wypozyczenie`
--
ALTER TABLE `wypozyczenie`
  ADD PRIMARY KEY (`idWypozyczenia`),
  ADD KEY `IdUżytkownika` (`idUzytkownika`),
  ADD KEY `IdFilmu` (`idFilmu`),
  ADD KEY `Zniżka` (`znizka`),
  ADD KEY `IdPłatności` (`idPlatnosci`),
  ADD KEY `IdSklepu` (`idSklepu`);

--
-- Indexes for table `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD PRIMARY KEY (`idZamowienia`),
  ADD KEY `IdFilmu` (`idFilmu`),
  ADD KEY `IdSklepu` (`idSklepu`),
  ADD KEY `IdUżytkownika` (`idUzytkownika`);

--
-- Indexes for table `zapowiedz`
--
ALTER TABLE `zapowiedz`
  ADD KEY `IdFilmu` (`idFilmu`);

--
-- Indexes for table `zdjecie`
--
ALTER TABLE `zdjecie`
  ADD KEY `IdFilmu` (`idFilmu`);

--
-- Indexes for table `znizka`
--
ALTER TABLE `znizka`
  ADD PRIMARY KEY (`nazwaZnizki`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `film`
--
ALTER TABLE `film`
  MODIFY `idFilmu` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `ocena`
--
ALTER TABLE `ocena`
  MODIFY `idOceny` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `platnosc`
--
ALTER TABLE `platnosc`
  MODIFY `idPlatnosci` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `recenzja`
--
ALTER TABLE `recenzja`
  MODIFY `idRecenzji` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `sklep`
--
ALTER TABLE `sklep`
  MODIFY `idSklepu` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `idUzytkownika` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `wypozyczenie`
--
ALTER TABLE `wypozyczenie`
  MODIFY `idWypozyczenia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  MODIFY `idZamowienia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `gatunek`
--
ALTER TABLE `gatunek`
  ADD CONSTRAINT `gatunek_ibfk_1` FOREIGN KEY (`idFilmu`) REFERENCES `film` (`idFilmu`);

--
-- Ograniczenia dla tabeli `ocena`
--
ALTER TABLE `ocena`
  ADD CONSTRAINT `ocena_ibfk_1` FOREIGN KEY (`idFilmu`) REFERENCES `film` (`idFilmu`),
  ADD CONSTRAINT `ocena_ibfk_3` FOREIGN KEY (`idUzytkownika`) REFERENCES `uzytkownik` (`idUzytkownika`);

--
-- Ograniczenia dla tabeli `platnosc`
--
ALTER TABLE `platnosc`
  ADD CONSTRAINT `platnosc_ibfk_1` FOREIGN KEY (`idUzytkownika`) REFERENCES `uzytkownik` (`idUzytkownika`);

--
-- Ograniczenia dla tabeli `recenzja`
--
ALTER TABLE `recenzja`
  ADD CONSTRAINT `recenzja_ibfk_1` FOREIGN KEY (`idUzytkownika`) REFERENCES `uzytkownik` (`idUzytkownika`),
  ADD CONSTRAINT `recenzja_ibfk_2` FOREIGN KEY (`idFilmu`) REFERENCES `film` (`idFilmu`);

--
-- Ograniczenia dla tabeli `sklep_film`
--
ALTER TABLE `sklep_film`
  ADD CONSTRAINT `sklep_film_ibfk_1` FOREIGN KEY (`idFilmu`) REFERENCES `film` (`idFilmu`),
  ADD CONSTRAINT `sklep_film_ibfk_4` FOREIGN KEY (`idSklepu`) REFERENCES `sklep` (`idSklepu`);

--
-- Ograniczenia dla tabeli `wypozyczenie`
--
ALTER TABLE `wypozyczenie`
  ADD CONSTRAINT `wypozyczenie_ibfk_1` FOREIGN KEY (`idUzytkownika`) REFERENCES `uzytkownik` (`idUzytkownika`),
  ADD CONSTRAINT `wypozyczenie_ibfk_2` FOREIGN KEY (`idFilmu`) REFERENCES `film` (`idFilmu`),
  ADD CONSTRAINT `wypozyczenie_ibfk_3` FOREIGN KEY (`idPlatnosci`) REFERENCES `platnosc` (`idPlatnosci`),
  ADD CONSTRAINT `wypozyczenie_ibfk_7` FOREIGN KEY (`znizka`) REFERENCES `znizka` (`nazwaZnizki`);

--
-- Ograniczenia dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD CONSTRAINT `zamowienie_ibfk_1` FOREIGN KEY (`idFilmu`) REFERENCES `film` (`idFilmu`),
  ADD CONSTRAINT `zamowienie_ibfk_2` FOREIGN KEY (`idUzytkownika`) REFERENCES `uzytkownik` (`idUzytkownika`),
  ADD CONSTRAINT `zamowienie_ibfk_3` FOREIGN KEY (`idSklepu`) REFERENCES `sklep` (`idSklepu`);

--
-- Ograniczenia dla tabeli `zapowiedz`
--
ALTER TABLE `zapowiedz`
  ADD CONSTRAINT `zapowiedz_ibfk_1` FOREIGN KEY (`idFilmu`) REFERENCES `film` (`idFilmu`);

--
-- Ograniczenia dla tabeli `zdjecie`
--
ALTER TABLE `zdjecie`
  ADD CONSTRAINT `zdjecie_ibfk_1` FOREIGN KEY (`idFilmu`) REFERENCES `film` (`idFilmu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
