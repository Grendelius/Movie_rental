-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 15 Sty 2018, 23:43
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
(1, 'Skazani na Shawshank', 1994, 'Adaptacja opowiadania Stephena Kinga. Niesłusznie skazany na dożywocie bankier, stara się przetrwać w brutalnym, więziennym świecie.', 9, '2017-12-14', 'http://1.fwcdn.pl/po/10/48/1048/6925401.3.jpg', 'Frank Darabont', 142),
(2, 'Nietykalni', 2011, 'Sparaliżowany milioner zatrudnia do opieki młodego chłopaka z przedmieścia, który właśnie wyszedł z więzienia.', 9.6, '2017-12-14', 'http://1.fwcdn.pl/po/33/90/583390/7441162.3.jpg', 'Olivier Nakache,Eric Toledano', 112),
(3, 'Zielona mila', 1999, 'Emerytowany strażnik więzienny opowiada przyjaciółce o niezwykłym mężczyźnie, którego skazano na śmierć za zabójstwo dwóch 9-letnich dziewczynek.', 7.6, '2017-12-14', 'http://1.fwcdn.pl/po/08/62/862/7517878.3.jpg', 'Frank Darabont', 188),
(4, 'Ojciec chrzestny', 1972, 'Opowieść o nowojorskiej rodzinie mafijnej. Starzejący się Don Corleone pragnie przekazać władzę swojemu synowi.', 8.6, '2017-12-14', 'http://1.fwcdn.pl/po/10/89/1089/7196615.3.jpg', 'Francis Ford Coppola', 175),
(5, 'Forrest Gump', 1994, 'Historia życia Forresta, chłopca o niskim ilorazie inteligencji z niedowładem kończyn, który staje się miliarderem i bohaterem wojny w Wietnamie.', 8.2, '2017-12-14', 'http://1.fwcdn.pl/po/09/98/998/7314731.3.jpg', 'Robert Zemeckis', 142),
(6, 'Dwunastu gniewnych ludzi', 1957, 'Dwunastu przysięgłych ma wydać wyrok w procesie o morderstwo. Jeden z nich ma wątpliwości dotyczące winy oskarżonego.', 6.4, '2017-12-14', 'http://1.fwcdn.pl/po/07/01/30701/7492190.3.jpg', 'Sidney Lumet', 96),
(7, 'Lot nad kukułczym gniazdem', 1975, 'Historia złodzieja, szulera i chuligana, który, by uniknąć więzienia, udaje niepoczytalność. Trafia do szpitala dla umysłowo chorych, gdzie twardą ręką rządzi siostra Ratched.', 5.2, '2017-12-14', 'http://1.fwcdn.pl/po/10/19/1019/7386645.3.jpg', 'Miloš Forman', 133),
(8, 'Ojciec chrzestny II', 1974, 'Rok 1917. Młody Vito Corleone stawia pierwsze kroki w mafijnym świecie Nowego Jorku. Ponad 40 lat później jego syn Michael walczy o interesy i dobro rodziny.', 7.4, '2017-12-14', 'http://1.fwcdn.pl/po/10/90/1090/7196616.3.jpg', 'Francis Ford Coppola', 200),
(9, 'Władca Pierścieni: Powrót króla', 2003, 'Zwieńczenie filmowej trylogii wg powieści Tolkiena. Aragorn jednoczy siły Śródziemia, szykując się do bitwy, która ma odwrócić uwagę Saurona od podążających w kierunku Góry Przeznaczenia hobbitów.', 8.2, '2017-12-14', 'http://1.fwcdn.pl/po/18/41/11841/7494142.3.jpg', 'Peter Jackson', 201),
(10, 'Pulp Fiction', 1994, 'Przemoc i odkupienie w opowieści o dwóch płatnych mordercach pracujących na zlecenie mafii, żonie gangstera, bokserze i parze okradającej ludzi w restauracji.', 8.8, '2017-12-14', 'http://1.fwcdn.pl/po/10/39/1039/7517880.6.jpg', 'Quentin Tarantino', 154),
(11, 'Incepcja', 2010, 'Czasy, gdy technologia pozwala na wchodzenie w świat snów. Złodziej Cobb ma za zadanie wszczepić myśl do śpiącego umysłu.', 9, '2017-12-14', 'http://1.fwcdn.pl/po/08/91/500891/7354571.3.jpg', 'Christopher Nolan', 148),
(12, 'Django', 2012, 'Łowca nagród Schultz i czarnoskóry niewolnik Django wyruszają w podróż, aby odbić żonę tego drugiego z rąk bezlitosnego Calvina Candie\'ego.', 8.4, '2017-12-20', 'http://1.fwcdn.pl/po/05/41/620541/7517014.3.jpg', 'Quentin Tarantino', 165);

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
(29, 9, 1, 4),
(30, 10, 2, 4),
(31, 8, 3, 4),
(32, 9, 4, 4),
(33, 8, 5, 4),
(34, 6, 6, 4),
(35, 5, 7, 4),
(36, 7, 8, 4),
(37, 8, 9, 4),
(38, 9, 10, 4),
(39, 9, 11, 4),
(40, 9, 12, 5),
(41, 10, 1, 5),
(42, 9, 2, 5),
(43, 7, 3, 5),
(44, 8, 4, 5),
(45, 7, 5, 5),
(46, 9, 6, 5),
(47, 7, 7, 5),
(48, 8, 8, 5),
(49, 9, 9, 5),
(50, 8, 10, 5),
(51, 10, 11, 5),
(52, 7, 12, 6),
(53, 8, 1, 6),
(54, 10, 2, 6),
(55, 8, 3, 6),
(56, 8, 4, 6),
(57, 9, 5, 6),
(58, 7, 6, 6),
(59, 9, 7, 6),
(60, 8, 8, 6),
(61, 7, 9, 6),
(62, 9, 10, 6),
(63, 9, 11, 6),
(64, 7, 12, 1),
(65, 10, 1, 1),
(66, 9, 2, 1),
(67, 7, 3, 1),
(68, 9, 4, 1),
(69, 9, 5, 1),
(70, 4, 6, 1),
(71, 2, 7, 1),
(72, 7, 8, 1),
(73, 9, 9, 1),
(74, 9, 10, 1),
(75, 7, 11, 1),
(77, 8, 1, 3),
(78, 10, 2, 3),
(79, 8, 3, 3),
(80, 9, 4, 3),
(81, 8, 5, 3),
(82, 6, 6, 3),
(83, 3, 7, 3),
(84, 7, 8, 3),
(85, 8, 9, 3),
(86, 9, 10, 3),
(87, 10, 11, 3),
(88, 9, 12, 4),
(90, 10, 12, 3);

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
(1, 'Mamy przed sobą  kolejny film skazany na szufladkę \"kultowe\". \"Django\" bowiem to Quentin w pełnej krasie – dobry, zły i brzydki. Dokładnie taki, jakiego lubimy najbardziej. ', '2018-01-13 10:52:27', 12, 4),
(2, 'Tak jak w przypadku \"Bękartów wojny\", tak i tym razem inspiracji poszukał Tarantino u Włochów. Jego \"Django\" to hołd dla spaghetti westernów: tytuł (oraz piosenka tytułowa) zaczerpnięte zostały z obrazu Sergio Corbucciego. ', '2018-01-13 10:55:19', 12, 5),
(3, 'Po tak pozytywnych recenzjach i opiniach widzów spodziewałem się filmu świetnego, ale nie tak wybitnego. To nie jest obraz, przy którym trzeba przesadnie wysilać szare komórki, ale to nie przeszkadza, aby \"Django\" był filmem genialnym. ', '2018-01-13 10:58:02', 12, 5),
(4, 'Jeżeli jakiś film może czuć się pokrzywdzony brakiem Oscara na swoim koncie, to właśnie jest to obraz Franka Darabonta pt. \"Skazani na Shawshank\". Obok tego filmu nie można przejść obojętnie. ', '2018-01-13 21:27:08', 1, 4),
(5, 'Pozycja absolutnie obligatoryjna dla wszystkich kinomanów, bo o coś bardziej wzruszającego i przepełnionego emocjami po prostu trudno, szczególnie dzisiaj, gdy większość filmów to super produkcje robione za ogromne pieniądze. ', '2018-01-13 21:27:36', 1, 5),
(6, 'Uważam, że dla każdego, nawet zwykłego \"połykacza\" kina, powinna być to lektura obowiązkowa. Polecam! ', '2018-01-13 21:28:39', 1, 6);

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
(1, 1, 1, 0),
(1, 2, 2, 0),
(1, 3, 5, 5),
(1, 6, 4, 4),
(1, 7, 3, 3),
(1, 8, 6, 6),
(1, 9, 5, 5),
(1, 10, 3, 3),
(1, 11, 6, 6),
(2, 12, 1, 0),
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
(3, 12, 1, 1),
(3, 7, 34, 34),
(3, 1, 2, 2),
(1, 4, 4, 4),
(1, 5, 3, 3);

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
(6, 'user54321', '62d45781b210f9961097d1cfe90fbac5', 'user54321', 'user54321', '222222222', 'user54321', 'user54321@gmail.com', 'klient', 0),
(7, 'user123456', '4da49c16db42ca04538d629ef0533fe8', 'user123456', 'user123456', '333879845', 'user123456', 'user123456@gmail.com', 'klient', 0);

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
(8, '2017-12-23 18:18:59', '2017-12-23 19:40:38', 4, 12, 3, NULL, NULL, 'Zakończony'),
(9, '2018-01-09 17:41:55', '2018-01-10 10:43:23', 4, 12, 2, NULL, NULL, 'Zakończony'),
(10, '2018-01-10 10:35:29', '2018-01-10 10:43:21', 4, 1, 1, NULL, NULL, 'Zakończony'),
(12, '2018-01-10 10:40:10', '2018-01-10 10:43:19', 4, 3, 1, NULL, NULL, 'Zakończony'),
(13, '2018-01-10 10:41:31', '2018-01-10 10:43:17', 4, 4, 3, NULL, NULL, 'Zakończony'),
(14, '2018-01-09 17:43:41', '2018-01-10 10:43:27', 6, 12, 2, NULL, NULL, 'Zakończony'),
(15, '2018-01-10 10:41:46', '2018-01-10 10:43:29', 5, 12, 2, NULL, NULL, 'Zakończony'),
(19, '2018-01-14 16:05:54', '2018-01-14 22:54:10', 5, 2, 1, NULL, NULL, 'Zakończony'),
(20, '2018-01-14 16:05:48', '2018-01-14 22:53:45', 5, 12, 2, NULL, NULL, 'Zakończony'),
(21, '2018-01-14 16:06:12', '2018-01-14 22:53:50', 6, 2, 1, NULL, NULL, 'Zakończony'),
(22, '2018-01-14 16:06:03', '2018-01-14 22:53:54', 6, 12, 2, NULL, NULL, 'Zakończony'),
(23, '2018-01-14 16:05:51', '2018-01-14 22:54:14', 5, 1, 1, NULL, NULL, 'Zakończony'),
(24, '2018-01-14 16:06:07', '2018-01-14 22:54:19', 6, 1, 1, NULL, NULL, 'Zakończony'),
(25, '2018-01-14 22:54:33', NULL, 4, 12, 2, NULL, NULL, 'Do odbioru w sklepie'),
(26, '2018-01-14 22:54:37', NULL, 4, 1, 1, NULL, NULL, 'Wypożyczony'),
(27, '2018-01-14 22:54:40', NULL, 4, 2, 1, NULL, NULL, 'W trakcie realizacji'),
(28, '2018-01-14 22:54:54', NULL, 5, 2, 1, NULL, NULL, 'Wypożyczony');

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

--
-- Zrzut danych tabeli `zamowienie`
--

INSERT INTO `zamowienie` (`idZamowienia`, `dataZamowienia`, `idUzytkownika`, `idSklepu`, `idFilmu`) VALUES
(1, '2018-01-14 22:55:02', 6, 2, 12),
(2, '2018-01-14 22:55:05', 6, 1, 1),
(3, '2018-01-14 22:55:08', 6, 1, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zapowiedz`
--

CREATE TABLE `zapowiedz` (
  `idFilmu` int(10) NOT NULL,
  `linkZapowiedzi` varchar(255) COLLATE utf8_bin NOT NULL,
  `czasTrwania` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `zapowiedz`
--

INSERT INTO `zapowiedz` (`idFilmu`, `linkZapowiedzi`, `czasTrwania`) VALUES
(1, '<iframe width=\"450\" height=\"252\" src=\"https://www.youtube-nocookie.com/embed/Crx0JKcSt-U?rel=0&amp;controls=0\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', '00:02:07'),
(2, '<iframe width=\"450\" height=\"252\" src=\"https://www.youtube-nocookie.com/embed/UppQaEffPOI?rel=0&amp;controls=0\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', '00:00:30'),
(12, '<iframe width=\"450\" height=\"252\" src=\"https://www.youtube-nocookie.com/embed/fmwcCsS0-YM?rel=0&amp;controls=0\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', '00:02:35');

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
  MODIFY `idFilmu` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT dla tabeli `gatunek`
--
ALTER TABLE `gatunek`
  MODIFY `idGatunku` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `ocena`
--
ALTER TABLE `ocena`
  MODIFY `idOceny` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT dla tabeli `platnosc`
--
ALTER TABLE `platnosc`
  MODIFY `idPlatnosci` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `recenzja`
--
ALTER TABLE `recenzja`
  MODIFY `idRecenzji` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `idWypozyczenia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  MODIFY `idZamowienia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
