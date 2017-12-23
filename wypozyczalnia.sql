-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 23 Gru 2017, 20:58
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
  `okladka` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `rezyser` varchar(255) COLLATE utf8_bin NOT NULL,
  `czasTrwania` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `film`
--

INSERT INTO `film` (`idFilmu`, `tytul`, `rokProdukcji`, `opis`, `sredniaOcena`, `dataDodania`, `okladka`, `rezyser`, `czasTrwania`) VALUES
(1, 'Skazani na Shawshank', 1994, 'Adaptacja opowiadania Stephena Kinga. Niesłusznie skazany na dożywocie bankier, stara się przetrwać w brutalnym, więziennym świecie.', 8.5, '2017-12-14', 'http://1.fwcdn.pl/po/10/48/1048/6925401.3.jpg', '', 0),
(2, 'Nietykalni', 2011, 'Sparaliżowany milioner zatrudnia do opieki młodego chłopaka z przedmieścia, który właśnie wyszedł z więzienia.', 10, '2017-12-14', 'http://1.fwcdn.pl/po/33/90/583390/7441162.3.jpg', '', 0),
(3, 'Zielona mila', 1999, 'Emerytowany strażnik więzienny opowiada przyjaciółce o niezwykłym mężczyźnie, którego skazano na śmierć za zabójstwo dwóch 9-letnich dziewczynek.', 0, '2017-12-14', 'http://1.fwcdn.pl/po/08/62/862/7517878.3.jpg', '', 0),
(4, 'Ojciec chrzestny', 1972, 'Opowieść o nowojorskiej rodzinie mafijnej. Starzejący się Don Corleone pragnie przekazać władzę swojemu synowi.', 0, '2017-12-14', 'http://1.fwcdn.pl/po/10/89/1089/7196615.3.jpg', '', 0),
(5, 'Forrest Gump', 1994, 'Historia życia Forresta, chłopca o niskim ilorazie inteligencji z niedowładem kończyn, który staje się miliarderem i bohaterem wojny w Wietnamie.', 0, '2017-12-14', 'http://1.fwcdn.pl/po/09/98/998/7314731.3.jpg', '', 0),
(6, 'Dwunastu gniewnych ludzi', 1957, 'Dwunastu przysięgłych ma wydać wyrok w procesie o morderstwo. Jeden z nich ma wątpliwości dotyczące winy oskarżonego.', 0, '2017-12-14', 'http://1.fwcdn.pl/po/07/01/30701/7492190.3.jpg', '', 0),
(7, 'Lot nad kukułczym gniazdem', 1975, 'Historia złodzieja, szulera i chuligana, który, by uniknąć więzienia, udaje niepoczytalność. Trafia do szpitala dla umysłowo chorych, gdzie twardą ręką rządzi siostra Ratched.', 0, '2017-12-14', 'http://1.fwcdn.pl/po/10/19/1019/7386645.3.jpg', '', 0),
(8, 'Ojciec chrzestny II', 1974, 'Rok 1917. Młody Vito Corleone stawia pierwsze kroki w mafijnym świecie Nowego Jorku. Ponad 40 lat później jego syn Michael walczy o interesy i dobro rodziny.', 0, '2017-12-14', 'http://1.fwcdn.pl/po/10/90/1090/7196616.3.jpg', '', 0),
(9, 'Władca Pierścieni: Powrót król', 2003, 'Zwieńczenie filmowej trylogii wg powieści Tolkiena. Aragorn jednoczy siły Śródziemia, szykując się do bitwy, która ma odwrócić uwagę Saurona od podążających w kierunku Góry Przeznaczenia hobbitów.', 0, '2017-12-14', 'http://1.fwcdn.pl/po/18/41/11841/7494142.3.jpg', '', 0),
(10, 'Pulp Fiction', 1994, 'Przemoc i odkupienie w opowieści o dwóch płatnych mordercach pracujących na zlecenie mafii, żonie gangstera, bokserze i parze okradającej ludzi w restauracji.', 0, '2017-12-14', 'http://1.fwcdn.pl/po/10/39/1039/7517880.6.jpg', '', 0),
(11, 'Incepcja', 2010, 'Czasy, gdy technologia pozwala na wchodzenie w świat snów. Złodziej Cobb ma za zadanie wszczepić myśl do śpiącego umysłu.', 0, '2017-12-14', 'http://1.fwcdn.pl/po/08/91/500891/7354571.3.jpg', '', 0),
(12, 'Django', 2012, 'Łowca nagród Schultz i czarnoskóry niewolnik Django wyruszają w podróż, aby odbić żonę tego drugiego z rąk bezlitosnego Calvina Candie\'ego.', 0, '2017-12-20', 'http://1.fwcdn.pl/po/05/41/620541/7517014.3.jpg', 'Dupa', 13);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gatunek`
--

CREATE TABLE `gatunek` (
  `idGatunku` int(10) NOT NULL,
  `nazwa` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `gatunek`
--

INSERT INTO `gatunek` (`idGatunku`, `nazwa`) VALUES
(1, 'Dramat'),
(2, 'Komedia'),
(4, 'Gangsterski'),
(5, 'Dramat sądowy'),
(6, 'Psychologiczny'),
(7, 'Fantazy'),
(8, 'Przygodowy'),
(9, 'Sci-Fi'),
(10, 'Thriller'),
(11, 'Surrealistyczny'),
(14, 'Biograficzny'),
(15, 'Western');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gatunek_film`
--

CREATE TABLE `gatunek_film` (
  `idFilmu` int(10) NOT NULL,
  `idGatunku` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `gatunek_film`
--

INSERT INTO `gatunek_film` (`idFilmu`, `idGatunku`) VALUES
(1, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 5),
(7, 1),
(8, 1),
(9, 7),
(10, 4),
(9, 8),
(8, 4),
(7, 6),
(5, 2),
(4, 4),
(11, 9),
(11, 10),
(11, 11),
(2, 14),
(2, 1),
(2, 2),
(12, 15);

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

--
-- Zrzut danych tabeli `ocena`
--

INSERT INTO `ocena` (`idOceny`, `wartosc`, `idFilmu`, `idUzytkownika`) VALUES
(12, 10, 2, 4),
(13, 9, 1, 4),
(14, 8, 1, 3);

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

--
-- Zrzut danych tabeli `recenzja`
--

INSERT INTO `recenzja` (`idRecenzji`, `tresc`, `data`, `idFilmu`, `idUzytkownika`) VALUES
(12, 'to jest dobry film', '2017-12-15 21:40:25', 1, 4);

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
(1, 'Sklep nr1', '3 Maja 6/8'),
(2, 'Sklep nr2', 'Warszawska 24'),
(3, 'Sklep nr3', 'Okulickiego 34');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sklep_film`
--

CREATE TABLE `sklep_film` (
  `idSklepu` int(10) NOT NULL,
  `idFilmu` int(10) NOT NULL,
  `iloscFilmow` int(10) NOT NULL,
  `iloscDostepnychFilmow` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `sklep_film`
--

INSERT INTO `sklep_film` (`idSklepu`, `idFilmu`, `iloscFilmow`, `iloscDostepnychFilmow`) VALUES
(1, 1, 1, 1),
(1, 2, 2, 2),
(1, 3, 5, 5),
(1, 6, 4, 4),
(1, 7, 3, 3),
(1, 8, 5, 5),
(1, 9, 5, 5),
(1, 10, 3, 3),
(1, 11, 6, 6),
(2, 12, 1, 1),
(2, 1, 1, 1),
(2, 2, 11, 11),
(2, 3, 2, 2),
(2, 4, 4, 4),
(2, 5, 1, 1),
(2, 6, 8, 8),
(2, 7, 7, 7),
(2, 8, 6, 6),
(2, 9, 5, 5),
(2, 10, 4, 4),
(2, 11, 3, 3),
(3, 2, 3, 3),
(3, 3, 4, 4),
(3, 4, 6, 6),
(3, 5, 7, 7),
(3, 6, 8, 8),
(3, 8, 108, 108),
(3, 9, 4, 4),
(3, 10, 5, 5),
(3, 11, 6, 6),
(1, 12, 3, 3),
(3, 12, 1, 1),
(1, 5, 2, 2),
(1, 4, 3, 3),
(3, 7, 34, 34),
(3, 1, 2, 2);

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
  `rola` varchar(255) COLLATE utf8_bin NOT NULL,
  `zablokowany` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `uzytkownik`
--

INSERT INTO `uzytkownik` (`idUzytkownika`, `login`, `haslo`, `imie`, `nazwisko`, `numerTelefonu`, `miejsceZamieszkania`, `email`, `rola`, `zablokowany`) VALUES
(1, 'pracownik', 'a03d603193c93860b74fb3839bc62716', 'pracownik', 'pracownik', '777555333', 'pracownik', 'pracownik@gmail.com', 'pracownik', 0),
(3, 'admin1', '0192023a7bbd73250516f069df18b500', 'admin1', 'admin1', '111222333', 'admin1', 'admin@gmail.com', 'administrator', 0),
(4, 'user12345', '80ec08504af83331911f5882349af59d', 'user12345', 'user12345', '987654321', 'user12345', 'user12345@gmail.com', 'klient', 0),
(5, 'user23456', 'b6a02b73d239c9b22e74c406b6b53fbc', 'user23456', 'user23456', '111111111', 'user23456', 'user23456@gmail.com', 'klient', 0),
(6, 'user54321', '62d45781b210f9961097d1cfe90fbac5', 'user54321', 'user54321', '22222222', 'user54321', 'user54321@gmail.com', 'klient', 0);

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
(2, '2017-12-14 23:47:46', '2017-12-19 11:19:42', 5, 1, 1, NULL, NULL, 'Zakończony'),
(3, '2017-12-14 23:49:27', '2017-12-19 10:58:00', 6, 1, 1, NULL, NULL, 'Zakończony'),
(4, '2017-12-19 11:22:24', '2017-12-19 11:22:37', 4, 1, 1, NULL, NULL, 'Zakończony'),
(5, '2017-12-22 17:00:45', '2017-12-22 17:03:50', 4, 1, 2, NULL, NULL, 'Zakończony'),
(6, '2017-12-22 17:03:13', '2017-12-22 17:03:54', 5, 1, 2, NULL, NULL, 'Zakończony'),
(7, '2017-12-23 16:10:14', '2017-12-23 19:40:36', 4, 1, 1, NULL, NULL, 'Zakończony'),
(8, '2017-12-23 18:18:59', '2017-12-23 19:40:38', 4, 12, 3, NULL, NULL, 'Zakończony');

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
  ADD PRIMARY KEY (`idGatunku`);

--
-- Indexes for table `gatunek_film`
--
ALTER TABLE `gatunek_film`
  ADD KEY `idFilmu` (`idFilmu`),
  ADD KEY `idGatunku` (`idGatunku`);

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
  MODIFY `idFilmu` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT dla tabeli `gatunek`
--
ALTER TABLE `gatunek`
  MODIFY `idGatunku` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT dla tabeli `ocena`
--
ALTER TABLE `ocena`
  MODIFY `idOceny` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT dla tabeli `platnosc`
--
ALTER TABLE `platnosc`
  MODIFY `idPlatnosci` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `recenzja`
--
ALTER TABLE `recenzja`
  MODIFY `idRecenzji` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT dla tabeli `sklep`
--
ALTER TABLE `sklep`
  MODIFY `idSklepu` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `idUzytkownika` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `wypozyczenie`
--
ALTER TABLE `wypozyczenie`
  MODIFY `idWypozyczenia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  MODIFY `idZamowienia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ograniczenia dla zrzutów tabel
--

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
