-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 21 Mar 2023, 16:37
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `gz`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rozwiazania`
--

CREATE TABLE `rozwiazania` (
  `id` int(11) NOT NULL,
  `id_zadania` int(11) NOT NULL,
  `odpowiedz` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `rozwiazania`
--

INSERT INTO `rozwiazania` (`id`, `id_zadania`, `odpowiedz`) VALUES
(1, 1, 'SELECT id, nazwa, wystepowanie FROM `ryby` WHERE styl_zycia = 1'),
(2, 2, 'SELECT Ryby_id, wymiar_ochronny FROM `okres_ochronny` WHERE wymiar_ochronny < 30'),
(3, 3, 'SELECT nazwa, akwen, wojewodztwo FROM ryby, lowisko WHERE lowisko.Ryby_id = ryby.id AND rodzaj = 3'),
(4, 4, 'ALTER TABLE ryby\nADD Dobowy_limit TINYINT;'),
(5, 5, 'SELECT id, imie, nazwisko, rok_urodzenia, zdjecie FROM osoby LIMIT 30'),
(6, 6, 'SELECT imie, nazwisko, rok_urodzenia, opis, zdjecie, nazwa FROM osoby JOIN hobby ON osoby.Hobby_id = hobby.id WHERE osoby.id = 10;'),
(7, 7, 'SELECT AVG(rok_urodzenia), MIN(rok_urodzenia), MAX(rok_urodzenia) FROM osoby;'),
(8, 8, 'UPDATE osoby SET opis=\"...\" WHERE Hobby_id = 4;'),
(9, 9, 'SELECT id, nazwa, opis, zdjecie FROM produkty WHERE id IN (18, 22, 23, 25);'),
(10, 10, 'SELECT id, nazwa, opis, zdjecie FROM produkty WHERE Rodzaje_id = 12;'),
(11, 11, 'SELECT produkty.nazwa, rodzaje.nazwa FROM produkty JOIN rodzaje ON produkty.Rodzaje_id = rodzaje.id WHERE opis LIKE \"%Leia%\";'),
(12, 12, 'DELETE FROM produkty WHERE id = 15;'),
(13, 13, 'SELECT nazwa, ilosc, opis, cena, zdjecie FROM produkty WHERE Rodzaje_id = 1 OR Rodzaje_id = 2;'),
(14, 14, 'SELECT produkty.nazwa, producenci.nazwa FROM produkty JOIN producenci ON produkty.Producenci_id = producenci.id WHERE produkty.ilosc < 10 AND Rodzaje_id = 1;'),
(17, 15, 'CREATE USER \'anna\'@\'localhost\' IDENTIFIED BY \'@nna23\';'),
(18, 17, 'SELECT osoby.id, nazwisko, nazwa FROM osoby JOIN hobby ON osoby.hobby_id = hobby.id WHERE rok_urodzenia > 2000;'),
(21, 18, 'SELECT id, zdjecie FROM osoby WHERE imie=\'Monika\' LIMIT 5;'),
(22, 20, 'SELECT imie, nazwisko, opis, zdjecie FROM osoby WHERE Hobby_id = 1 OR Hobby_id = 2 OR Hobby_id = 6;'),
(23, 21, 'SELECT id, nr_rejsu, czas, kierunek, status_lotu FROM odloty ORDER BY czas DESC;'),
(24, 22, 'SELECT czas FROM odloty WHERE czas BETWEEN \'10:10\' AND \'10:19\';'),
(25, 23, 'SELECT nr_rejsu, linie FROM odloty JOIN samoloty ON odloty.samoloty_id = samoloty.id WHERE odloty.kierunek = \"Malta\";'),
(26, 24, 'UPDATE przyloty SET status_lotu=\"planowy\" WHERE nr_rejsu = \"LH9829\";'),
(27, 25, 'SELECT imie, nazwisko FROM kadra WHERE stanowisko = \'fryzjer\';'),
(28, 26, 'SELECT count(*) from uslugi where rodzaj=2;'),
(29, 27, 'CREATE USER \'fryzjer\'@\'localhost\' IDENTIFIED BY \'Fryz12\';'),
(30, 28, 'GRANT CREATE, ALTER, SELECT ON dane4.kadra TO \'fryzjer\'@\'localhost\';'),
(31, 29, 'SELECT nazwa, cena FROM uslugi WHERE cena < 30;'),
(32, 30, 'SELECT SUM(cena) FROM uslugi WHERE rodzaj=1;'),
(33, 31, 'CREATE USER \'kosmetyczka\'@\'localhost\' IDENTIFIED BY \'Kosmet34\';'),
(34, 32, 'GRANT SELECT, INSERT ON egzamin1.uslugi TO \'kosmetyczka\'@\'localhost\';'),
(35, 33, 'SELECT miesiac, rok FROM zadania WHERE dataZadania = \'2020-07-01\';'),
(36, 34, 'SELECT dataZadania, wpis FROM zadania WHERE miesiac = \'lipiec\';'),
(37, 35, 'SELECT DISTINCT miesiac FROM zadania WHERE miesiac LIKE \"l%\"'),
(38, 36, 'UPDATE zadania SET wpis=\'Wycieczka: jezioro\' WHERE dataZadania=\'2020-07-13\';'),
(39, 37, 'SELECT nazwaPliku, podpis FROM zdjecia ORDER BY podpis ASC;'),
(40, 38, 'SELECT id, dataWyjazdu, cel, cena FROM wycieczki WHERE dostepna = TRUE;'),
(41, 39, 'SELECT nazwaPliku, cel FROM zdjecia JOIN wycieczki ON zdjecia.id = wycieczki.zdjecia_id WHERE cena > 1000;'),
(42, 40, 'ALTER TABLE wycieczki ADD dataPrzyjazdu DATE AFTER dataWyjazdu;'),
(43, 41, 'SELECT id, cel, cena FROM wycieczki WHERE dostepna = FALSE;'),
(44, 42, 'SELECT nazwaPliku, podpis FROM zdjecia ORDER BY nazwaPliku ASC;'),
(45, 43, 'SELECT podpis, cena, cel FROM zdjecia JOIN wycieczki ON zdjecia.id = wycieczki.zdjecia_id WHERE cena < 1200;'),
(46, 44, 'ALTER TABLE wycieczki\nDROP COLUMN dataWyjazdu;'),
(47, 45, 'SELECT dataZadania, miesiac, wpis FROM zadania WHERE miesiac = \'sierpien\';'),
(48, 46, 'SELECT miesiac, rok FROM zadania WHERE dataZadania = \'2020-08-01\';'),
(49, 47, 'SELECT DISTINCT wpis FROM zadania WHERE wpis LIKE \"%o\";'),
(50, 48, 'UPDATE zadania SET wpis=\'Wycieczka: Karkonosze\' WHERE dataZadania=\'2020-08-27\';'),
(51, 49, 'SELECT * FROM pogoda WHERE miasta_id=2 ORDER BY data_prognozy DESC;'),
(52, 50, 'SELECT id, temperatura_dzien FROM pogoda WHERE cisnienie<1000;'),
(53, 51, 'SELECT data_prognozy, opady, nazwa FROM pogoda JOIN miasta ON miasta.id = pogoda.miasta_id WHERE temperatura_dzien > 20;'),
(54, 52, 'DELETE FROM pogoda WHERE id = 8;'),
(55, 53, 'SELECT id, nazwa, wystepowanie FROM ryby WHERE styl_zycia=2;'),
(56, 54, 'SELECT akwen, wojewodztwo FROM lowisko WHERE rodzaj = 2 OR rodzaj = 3;'),
(57, 55, 'SELECT nazwa FROM ryby JOIN okres_ochronny ON ryby.id = okres_ochronny.Ryby_id WHERE od_miesiaca = 0;'),
(58, 56, 'INSERT INTO `osoby` (`id`, `Hobby_id`, `imie`, `nazwisko`, `rok_urodzenia`, `opis`, `zdjecie`) VALUES (NULL, \'1\', \'Marysia\', \'Marysiowa\', \'1995\', \'Opis\', \'image.jpg\'), (NULL, \'1\', \'Zuzanna\', \'Zuzannowa\', \'1995\', \'opis\', \'image.jpg\'), (NULL, \'1\', \'Karol\', \'Karolowy\', \'1995\', \'opis\', \'image.jpg\'), (NULL, \'1\', \'Andrzej\', \'Andrzejowy\', \'1995\', \'opis\', \'image.jpg\'), (NULL, \'1\', \'Maryla\', \'Marylowy\', \'1995\', \'opis\', \'image.jpg\');'),
(59, 57, 'DELETE FROM osoby WHERE id = 6;'),
(60, 58, 'DELETE FROM osoby WHERE id = 11;'),
(61, 59, 'DELETE FROM osoby WHERE id = 15;'),
(62, 60, 'DELETE FROM osoby WHERE id = 21;'),
(63, 61, 'SELECT id, imie, nazwisko from osoby where rok_urodzenia < 1997;'),
(64, 62, 'SELECT id, imie, nazwisko from osoby where rok_urodzenia < 1999;'),
(65, 63, 'SELECT id, imie, nazwisko from osoby where rok_urodzenia < 2001;'),
(66, 64, 'SELECT id, imie, nazwisko from osoby where rok_urodzenia > 2003;'),
(67, 65, 'SELECT id, imie, nazwisko from osoby where rok_urodzenia > 2006;'),
(68, 66, 'SELECT id, imie, nazwisko from osoby where rok_urodzenia > 2008;'),
(69, 67, 'INSERT INTO `samoloty` (`id`, `typ`, `linie`) VALUES (NULL, \'Boening123\', \'Mariuszowo\'), (NULL, \'Boeniiing199\', \'Kacprowo\'), (NULL, \'Mapp9\', \'Danielowo\'), (NULL, \'SWBIB19\', \'BMP\'), (NULL, \'Skydude1\', \'FlyToHeave\');'),
(70, 68, 'INSERT INTO `samoloty` (`id`, `typ`, `linie`) VALUES (127, \'Boening123\', \'BMPP\');'),
(71, 69, 'DELETE FROM samoloty WHERE id = 3;'),
(72, 70, 'INSERT INTO `odloty` (`id`, `samoloty_id`, `nr_rejsu`, `kierunek`, `czas`, `dzien`, `status_lotu`) VALUES (NULL, \'1\', \'XC199\', \'Polska\', \'16:06:34\', \'2023-03-21\', \'Planowany\'), (NULL, \'2\', \'XC991\', \'Barcelona\', \'14:21:34\', \'2023-03-23\', \'Planowany\');'),
(73, 71, 'INSERT INTO `przyloty` (`id`, `samoloty_id`, `nr_rejsu`, `kierunek`, `czas`, `dzien`, `status_lotu`) VALUES (NULL, \'3\', \'CC0155\', \'Chiny\', \'07:44:31\', \'2023-03-31\', \'Planowany\'), (NULL, \'4\', \'C9019\', \'Hiszpania\', \'16:45:31\', \'2023-03-28\', \'Boarding\');'),
(74, 72, 'UPDATE odloty SET status_lotu = \'Boarding\' WHERE status_lotu = \'\';'),
(75, 73, 'UPDATE przyloty SET status_lotu = \'planowany\' WHERE status_lotu = \'\';'),
(76, 74, 'UPDATE przyloty SET dzien = \'1996-05-21\' WHERE id IN(5,7,8);'),
(77, 75, 'UPDATE przyloty SET dzien = \'1997-06-23\' WHERE id IN(2,4,7);'),
(78, 76, 'UPDATE przyloty SET dzien = \'2004-07-21\' WHERE id IN(1,3,8);'),
(79, 77, 'UPDATE producenci SET rokWspolpraca = \'2022\' WHERE id IN(4,6,8);'),
(80, 78, 'INSERT INTO `producenci` (`id`, `nazwa`, `adres`, `miasto`, `rokWspolpraca`) VALUES (\'1\', \'nazwa1\', \'adres1\', \'miasto1\', \'2023\'), (\'2\', \'nazwa2\', \'adres2\', \'miasto2\', \'2023\'), (\'3\', \'nazwa3\', \'adres3\', \'miasto3\', \'2023\');'),
(81, 79, 'INSERT INTO `producenci` (`id`, `nazwa`, `adres`, `miasto`, `rokWspolpraca`) VALUES (\'123\', \'nazwa1\', \'adres1\', \'miasto1\', \'2023\'), (\'321\', \'nazwa2\', \'adres2\', \'miasto2\', \'2023\'), (\'195\', \'nazwa3\', \'adres3\', \'miasto3\', \'2023\');'),
(82, 80, 'DELETE FROM rodzaje WHERE id IN(13,12,6);'),
(83, 81, 'DELETE FROM rodzaje WHERE id = 2;'),
(84, 82, 'DELETE FROM rodzaje WHERE id = 1;'),
(85, 83, 'INSERT INTO `produkty` (`id`, `Rodzaje_id`, `Producenci_id`, `nazwa`, `ilosc`, `opis`, `cena`, `zdjecie`) VALUES (NULL, \'1\', \'1\', \'Random\', \'25\', \'Random\', \'30\', \'Random.jpg\'), (NULL, \'2\', \'2\', \'Random\', \'25\', \'Random\', \'30\', \'Random.jpg\'), (NULL, \'3\', \'3\', \'Random\', \'25\', \'Random\', \'30\', \'Random.jpg\'), (NULL, \'4\', \'4\', \'Random\', \'25\', \'Random\', \'30\', \'Random.jpg\'), (NULL, \'5\', \'5\', \'Random\', \'25\', \'Random\', \'30\', \'Random.jpg\');'),
(86, 84, 'SELECT id, nazwa, adres, miasto from producenci where rokWspolpraca < 1999;'),
(87, 85, 'SELECT id, nazwa, adres, miasto from producenci where rokWspolpraca < 2001;'),
(88, 86, 'SELECT id, nazwa, adres, miasto from producenci where rokWspolpraca < 2003;'),
(89, 87, 'SELECT id, nazwa, adres, miasto from producenci where rokWspolpraca > 1999;'),
(90, 88, 'SELECT id, nazwa, adres, miasto from producenci where rokWspolpraca < 1980;'),
(91, 89, 'SELECT id, nazwa, adres, miasto from producenci where rokWspolpraca < 1982;'),
(92, 90, 'INSERT INTO `kadra` (`id`, `imie`, `nazwisko`, `stanowisko`) VALUES (NULL, \'Magdalena\', \'Magdalenowa\', \'Fryzjer\'), (NULL, \'Agnieszka\', \'Agnieszkowa\', \'Fryzjer\'), (NULL, \'Dagmara\', \'Dagmarowa\', \'Fryzjer\'), (NULL, \'Paulina\', \'Paulinowa\', \'Fryzjer\');'),
(93, 91, 'INSERT INTO `kadra` (`id`, `imie`, `nazwisko`, `stanowisko`) VALUES (NULL, \'Pawel\', \'Pawlowski\', \'Fryzjer\'), (NULL, \'Patryk\', \'Patrykowski\', \'Fryzjer\'), (NULL, \'Dawid\', \'Dawidowski\', \'Fryzjer\'), (NULL, \'Seweryn\', \'Sewerynowski\', \'Fryzjer\');'),
(94, 92, 'UPDATE uslugi SET cena = 250 WHERE id = 3;'),
(95, 93, 'DELETE FROM kadra WHERE id = 2;'),
(96, 94, 'DELETE FROM kadra WHERE id = 1;'),
(97, 95, 'INSERT INTO `ryby` (`id`, `nazwa`, `wystepowanie`, `styl_zycia`, `Dobowy_limit`) VALUES (NULL, \'Ognica Pstra\', \'Morze\', \'1\', NULL);'),
(98, 96, 'DELETE FROM ryby WHERE id = 2;'),
(99, 97, 'DELETE FROM ryby WHERE id = 7;'),
(100, 98, 'CREATE VIEW Rybki AS\nSELECT id, ryby_id\nFROM okres_ochronny;'),
(101, 99, 'CREATE VIEW Lowiska AS\nSELECT akwen, wojewodztwo\nFROM lowisko;'),
(102, 100, 'DELETE FROM lowisko WHERE id = 5;'),
(103, 101, 'DELETE FROM lowisko WHERE id = 3;'),
(104, 102, 'DELETE FROM okres_ochronny WHERE id = 3;');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zadania`
--

CREATE TABLE `zadania` (
  `id` int(11) NOT NULL,
  `tresc_zapytania` text NOT NULL,
  `arkusz` varchar(255) NOT NULL,
  `jaka_baza` varchar(255) NOT NULL,
  `link_bazy` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zadania`
--

INSERT INTO `zadania` (`id`, `tresc_zapytania`, `arkusz`, `jaka_baza`, `link_bazy`) VALUES
(1, 'Wybierajace jedynie pola ID, Nazwa i Wystepowanie z tabeli Ryby dla ryb drapieznych', 'INF.03 : 2022 - czerwiec - zad. 01 (php)', 'baza.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-inf03-2022-06-01/'),
(2, 'Wybierajace jedynie pola Ryby_id oraz Wymiar_ochronny z Tabeli Okres_ochronny dla ryb, ktorych wymiar ochronny jest mniejszy niz 30 cm', 'INF.03 : 2022 - czerwiec - zad. 01 (php)', 'baza.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-inf03-2022-06-01/'),
(3, 'Wybierajace jedynie pole Nazwa z Tabeli Ryby oraz odpowiadajace tej nazwie pola Akwen i Wojewodztwo z Tabeli Lowisko dla Lowisk, ktore sa Rzekami. Zapytanie Wykorzystuje Relacje', 'INF.03 : 2022 - czerwiec - zad. 01 (php)', 'baza.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-inf03-2022-06-01/'),
(4, 'Dodajace do Tabeli Ryby Kolumne Dobowy_limit typu numerycznego, o rozmiarze pozwalajacym na wpisanie jedynie liczb z przedzialu <0, 255>', 'INF.03 : 2022 - czerwiec - zad. 01 (php)', 'baza.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-inf03-2022-06-01/'),
(5, 'Wybierajace jedynie pola Id, Imie, Nazwisko, Rok_urodzenia, Zdjecie z tabeli Osoby. Kwerenda wybiera pierwsze 30 wierszy, nalezy jawnie wskazac liczbe wierszy', 'EE.09 : 2021 - czerwiec - zad. 04 (php)', 'dane.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-04/'),
(6, 'Wybierajace jedynie pola Imie, Nazwisko, Rok_urodzenia, Opis, Zdjecie z tabeli Osoby oraz odpowiadajace im pole nazwa z tabeli Hobby dla osoby o Id rownym 10', 'EE.09 : 2021 - czerwiec - zad. 04 (php)', 'dane.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-04/'),
(7, 'Liczace sredni Rok Urodzenia oraz najnizszy I najwyzszy Rok Urodzenia z tabeli Osoby', 'EE.09 : 2021 - czerwiec - zad. 04 (php)', 'dane.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-04/'),
(8, 'Aktualizujace pole Opis z tabeli Osoby dla Osob, ktorych pole Hobby_id jest rowne 4. Wartosc nowego wpisu w Polu Opis jest dowolna bedaca mozliwym Hobby', 'EE.09 : 2021 - czerwiec - zad. 04 (php)', 'dane.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-04/'),
(9, 'Wybierajace jedynie Pola Id, Nazwa, Opis, Zdjecie z Tabeli Produkty, dla Produktow, ktorych Id jest jedna z Wartosci: 18, 22, 23, 25\n', 'EE.09 : 2021 - czerwiec - zad. 03 (php)', 'dane0.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-03/'),
(10, 'Wybierajace jedynie Pola Id, Nazwa, Opis, Zdjecie z Tabeli Produkty, dla Produktow, ktorych pole Rodzaje_id przyjmuje wartosc 12', 'EE.09 : 2021 - czerwiec - zad. 03 (php)', 'dane0.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-03/'),
(11, 'Wybierajace nazwe z Tabeli Produkty i odpowiadajaca mu nazwe z Tabeli Rodzaje Dla Wierszy, w ktorych w polu opis wystepuje ciag znakow: \"Leia\"', 'EE.09 : 2021 - czerwiec - zad. 03 (php)', 'dane0.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-03/'),
(12, 'Usuwajace wiersz z Tabeli Produkty o Id rownym 15', 'EE.09 : 2021 - czerwiec - zad. 03 (php)', 'dane0.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-03/'),
(13, 'Wybierajace jedynie pola Nazwa, Ilosc, Opis, Cena, Zdjecie z Tabeli Produkty, dla Produktow, ktorych pole Rodzaje_id przyjmuje jedna z wartosci: 1, 2', 'EE.09 : 2021 - czerwiec - zad. 02 (php)', 'dane1.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-02/'),
(14, 'Wybierajace jedynie Nazwe Produktu z Tabeli Produkty i odpowiadajaca mu nazwe Producenta z Tabeli Producenci dla Produktow, dla ktorych ilosc jest mniejsza od 10 oraz pole Rodzaje_id przyjmuje wartosc 1', 'EE.09 : 2021 - czerwiec - zad. 02 (php)', 'dane1.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-02/'),
(15, 'Tworzace uzytkownika Anna Z Haslem @Nna23', 'EE.09 : 2021 - czerwiec - zad. 02 (php)', 'dane1.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-02/'),
(17, 'Wybierajace jedynie pola Id I Nazwisko z Tabeli Osoby oraz odpowiadajace im pole Nazwa z Tabeli Hobby dla Osob, ktore urodzily sie po 2000 Roku', 'EE.09 : 2021 - czerwiec - zad. 01 (php)', 'dane2.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-01/'),
(18, 'Wybierajace jedynie pola Id i Zdjecie z Tabeli Osoby dla Osob, ktore maja na imie Monika. Kwerenda wybiera pierwsze 5 Wierszy, nalezy jawnie wskazac liczbe wierszy', 'EE.09 : 2021 - czerwiec - zad. 01 (php)', 'dane2.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-01/'),
(20, 'Wybierajace jedynie pola Imie, Nazwisko, Opis, Zdjecie z Tabeli Osoby, dla wszystkich Osob, ktorych Hobby_id jest jedna z wartosci: 1, 2, 6', 'EE.09 : 2021 - czerwiec - zad. 01 (php)', 'dane2.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-01/'),
(21, 'Wybierajace jedynie pola Id, Nr_rejsu, Czas, Kierunek i Status_lotu z tabeli Odloty posortowane malejaco wedlug Czasu', 'EE.09 : 2021 - styczeń - zad. 06 (php)', 'dane3.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-01-06/'),
(22, 'Wyznaczajace najwczesniejszy (najmniejszy) Czas Odlotu dla Lotow, ktorych Czas Odlotu jest Pomiedzy 10:10 / 10:19', 'EE.09 : 2021 - styczeń - zad. 06 (php)', 'dane3.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-01-06/'),
(23, 'Wybierajace jedynie pola Nr_rejsu z tabeli Odloty oraz Linie z tabeli Samoloty, dla Lotow ktorych kierunkiem jest Malta; zapytanie wykorzystuje relacje', 'EE.09 : 2021 - styczeń - zad. 06 (php)', 'dane3.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-01-06/'),
(24, 'Aktualizujace w tabeli Przyloty pole Status_lotu na: \"planowy\" dla lotu o Numerze Rejsu LH9829', 'EE.09 : 2021 - styczeń - zad. 06 (php)', 'dane3.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-01-06/'),
(25, 'Wybierajaca jedynie pola Imie i Nazwisko z tabeli Kadra dla pracownikow na Stanowisku fryzjer', 'EE.09 : 2020 - czerwiec - zad. 05 (js)', 'dane4.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-05/'),
(26, 'Liczace liczbe rekordow w tabeli Uslugi dla wszystkich uslug fryzjerskich (rodzaj odpowiada uslugom fryzjerskim)\r\n', 'EE.09 : 2020 - czerwiec - zad. 05 (js)', 'dane4.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-05/'),
(27, 'Tworzace uzytkownika fryzjer na localhost z haslem Fryz12', 'EE.09 : 2020 - czerwiec - zad. 05 (js)', 'dane4.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-05/'),
(28, 'Nadajace prawa Tworzenia i Modyfikowania struktury tabeli oraz Przegladania danych w tabeli Kadra bazy dane4 dla uzytkownika fryzjer', 'EE.09 : 2020 - czerwiec - zad. 05 (js)', 'dane4.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-05/'),
(29, 'Wybierajace jedynie pola Nazwa i Cena z tabeli Uslugi dla uslug, ktorych cena jest nizsza od 30 zl', 'EE.09 : 2020 - czerwiec - zad. 04 (js)', 'dane5.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-04/'),
(30, 'Liczace sume cen dla wszystkich Uslug kosmetycznych (rodzaj odpowiada uslugom kosmetycznym)\r\n', 'EE.09 : 2020 - czerwiec - zad. 04 (js)', 'dane5.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-04/'),
(31, 'Tworzace uzytkownika kosmetyczka na localhost z haslem Kosmet34', 'EE.09 : 2020 - czerwiec - zad. 04 (js)', 'dane5.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-04/'),
(32, 'Nadajace prawa Przegladania danych i Wstawiania rekordow do tabeli Uslugi bazy dane5 dla uzytkownika kosmetyczka', 'EE.09 : 2020 - czerwiec - zad. 04 (js)', 'dane5.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-04/'),
(33, 'Wybierajace jedynie pola Miesiac i Rok z tabeli Zadania dla zadania z data 2020-07-01', 'EE.09 : 2020 - czerwiec - zad. 03 (php)', 'dane6.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-03/'),
(34, 'Wybierajace jedynie pola dataZadania i wpis z tabeli Zadania dla zadan, ktorych miesiac to lipiec', 'EE.09 : 2020 - czerwiec - zad. 03 (php)', 'dane6.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-03/'),
(35, 'Wybierajace jedynie pole Miesiac i wyswietlajace je bez powtorzen, z tabeli zadania dla miesiecy zaczynajacych sie na litere ,,l\" (l jak lew, lizak)', 'EE.09 : 2020 - czerwiec - zad. 03 (php)', 'dane6.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-03/'),
(36, 'Zmieniajace pole wpis w tabeli Zadania dla zadania z data 2020-07-13, nowy wpis to \"Wycieczka: jezioro\"', 'EE.09 : 2020 - czerwiec - zad. 03 (php)', 'dane6.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-03/'),
(37, 'Wybierajace jedynie pola nazwaPliku i podpis z tabeli Zdjecia, sortujac je rosnaco alfabetycznie wedlug kolumny Podpis', 'EE.09 : 2020 - czerwiec - zad. 02 (php)', 'dane7.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-02/'),
(38, 'Wybierajace jedynie pola Id, dataWyjazdu, Cel i Cena z tabeli Wycieczki dla dostepnych wycieczek (pole dostepna)', 'EE.09 : 2020 - czerwiec - zad. 02 (php)', 'dane7.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-02/'),
(39, 'Wykorzystujace relacje i wybierajace jedynie pola nazwaPliku i cel zwiazany ze zdjeciem z tabel Zdjecia i Wcieczki, dla wycieczek, ktorych cena jest wyzsza niz 1000 zl', 'EE.09 : 2020 - czerwiec - zad. 02 (php)', 'dane7.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-02/'),
(40, 'Dodajace do tabeli Wycieczki pole dataPrzyjazdu typu data, pole powinno byc wstawione po polu dataWyjazdu', 'EE.09 : 2020 - czerwiec - zad. 02 (php)', 'dane7.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-02/'),
(41, 'Wybierajace jedynie pola Id, Cel, Cena z tabeli Wycieczki dla wycieczek, ktore nie sa dostepne (pole dostepna)', 'EE.09 : 2020 - czerwiec - zad. 06 (php)', 'dane7.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-06/'),
(42, 'Wybierajace jedynie pola nazwaPliku i podpis z tabeli Zdjecia sortujac je malejaco alfabetycznie wedlug kolumny nazwaPliku', 'Autorskie Zadanie', 'dane7.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-06/'),
(43, 'Wykorzystujace relacje i wybierajace jedynie pola Podpis, Cena i Cel zwiazany ze Zdjeciem z tabel Zdjecia i Wycieczki, dla Wycieczek, ktorych Cena jest nizsza niz 1200 zl', 'EE.09 : 2020 - czerwiec - zad. 06 (php)', 'dane7.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-06/'),
(44, 'Usuwajace pole dataWyjazdu z tabeli Wycieczki', 'EE.09 : 2020 - czerwiec - zad. 06 (php)', 'dane7.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-06/'),
(45, 'Wybierajace jedynie pola dataZadania, Miesiac i wpis z tabeli Zadania dla zadan, ktorych miesiac to sierpien', 'EE.09 : 2020 - czerwiec - zad. 01 (php)', 'dane6.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-03/'),
(46, 'Wybierajace jedynie pola Miesiac i Rok z tabeli Zadania dla zadania z data 2020-08-01', 'EE.09 : 2020 - czerwiec - zad. 01 (php)', 'dane6.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-03/'),
(47, 'Wybierajace jedynie pole Wpis i Wyswietlajace je bez powtorzen, z tabeli Zadania dla wpisow konczacych sie litera \"o\"', 'EE.09 : 2020 - czerwiec - zad. 01 (php)', 'dane6.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-03/'),
(48, 'Zmieniajace pole Wpis w tabeli Zadania dla zadania z data 2020-08-27, nowy wpis to \"Wycieczka: Karkonosze\"', 'EE.09 : 2020 - czerwiec - zad. 01 (php)', 'dane6.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-03/'),
(49, 'Wybierajace wszystkie pola z tabeli Pogoda dla Miast o id rownym 2, posortowane malejaco wedlug Daty Prognozy', 'EE.09 : 2020 - styczeń - zad. 03 (php)', 'dane8.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-01-03/'),
(50, 'Wybierajace jedynie pola Id oraz Temperatura_dzien z tabeli Pogoda dla tych rekordow, dla ktorych Cisnienie jest ponizej 1000 hPa', 'EE.09 : 2020 - styczeń - zad. 03 (php)', 'dane8.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-01-03/'),
(51, 'Wybierajace jedynie pola Data_prognozy, Opady z tabeli Pogoda oraz Nazwa z tabeli Miasta dla temperatur dziennych powyzej 20 stopni. Zapytanie wykorzystuje relacje', 'EE.09 : 2020 - styczeń - zad. 03 (php)', 'dane8.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-01-03/'),
(52, 'Usuwajace z tabeli Pogoda rekord o Id rownym 8', 'EE.09 : 2020 - styczeń - zad. 03 (php)', 'dane8.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-01-03/'),
(53, 'Wybierajace jedynie pola Id, Nazwa i Wystepowanie z tabeli Ryby dla ryb spokojnego zeru', 'EE.09 : 2020 - styczeń - zad. 01 (php)', 'baza.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-01-01/'),
(54, 'Wybierajace jedynie pola Akwen i Wojewodztwo z tabeli Lowisko dla lowisk, ktore sa Jeziorami lub Rzekami', 'EE.09 : 2020 - styczeń - zad. 01 (php)', 'baza.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-01-01/'),
(55, 'Wybierajace jedynie pole Nazwa z tabeli Ryby dla ryb, ktore nie maja okresu ochronnego. Zapytanie wykorzystuje relacje', 'EE.09 : 2020 - styczeń - zad. 01 (php)', 'baza.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-01-01/'),
(56, 'Dodaj 5 osob do tabeli Osoby o imionach: Marysia, Zuzanna, Karol, Andrzej, Maryla\r\nkazda kolumna musi byc uzupelniona', 'Autorskie Zadanie', 'dane.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-04/'),
(57, 'Usuwajace z tabeli Osoby rekord o Id rownym 6', 'Autorskie Zadanie', 'dane.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-04/'),
(58, 'Usuwajace z tabeli Osoby rekord o Id rownym 11', 'Autorskie Zadanie', 'dane.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-04/'),
(59, 'Usuwajace z tabeli Osoby rekord o Id rownym 15', 'Autorskie Zadanie', 'dane.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-04/'),
(60, 'Usuwajace z tabeli Osoby rekord o Id rownym 21', 'Autorskie Zadanie', 'dane.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-04/'),
(61, 'Wybierajace jedynie pola Id, Imie, Nazwisko z tabeli Osoby dla rocznika mniejszego niz 1997', 'Autorskie Zadanie', 'dane.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-04/'),
(62, 'Wybierajace jedynie pola Id, Imie, Nazwisko z tabeli Osoby dla rocznika mniejszego niz 1999', 'Autorskie Zadanie', 'dane.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-04/'),
(63, 'Wybierajace jedynie pola Id, Imie, Nazwisko z tabeli Osoby dla rocznika mniejszego niz 2001', 'Autorskie Zadanie', 'dane.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-04/'),
(64, 'Wybierajace jedynie pola Id, Imie, Nazwisko z tabeli Osoby dla rocznika wiekszego niz 2003', 'Autorskie Zadanie', 'dane.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-04/'),
(65, 'Wybierajace jedynie pola Id, Imie, Nazwisko z tabeli Osoby dla rocznika wiekszego niz 2006', 'Autorskie Zadanie', 'dane.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-04/'),
(66, 'Wybierajace jedynie pola Id, Imie, Nazwisko z tabeli Osoby dla rocznika wiekszego niz 2008', 'Autorskie Zadanie', 'dane.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-04/'),
(67, 'Dodaj 5 samolotow do tabeli Samoloty, kazda kolumna musi byc uzupelniona', 'Autorskie Zadanie', 'dane3.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-01-06/'),
(68, 'Dodaj samolot do tabeli Samoloty o id 127', 'Autorskie Zadanie', 'dane3.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-01-06/'),
(69, 'Usuwajace z tabeli Samoloty rekord o Id rownym 3', 'Autorskie Zadanie', 'dane3.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-01-06/'),
(70, 'Dodaj 2 odloty do tabeli Odloty, kazda kolumna musi byc uzupelniona', 'Autorskie Zadanie', 'dane3.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-01-06/'),
(71, 'Dodaj 2 przyloty do tabeli Przyloty, kazda kolumna musi byc uzupelniona', 'Autorskie Zadanie', 'dane3.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-01-06/'),
(72, 'Dla kazdego rekordu w tabeli Odloty, ktory nie posiada Statusu Lotu. Dodaj status \"Boarding\" ', 'Autorskie Zadanie', 'dane3.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-01-06/'),
(73, 'Dla kazdego rekordu w tabeli Przyloty, ktory nie posiada Statusu Lotu. Dodaj status \"planowany\" ', 'Autorskie Zadanie', 'dane3.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-01-06/'),
(74, 'Dla rekordów w tabeli Przyloty o ID [5, 7, 8] zmien date na \"1996-05-21\"', 'Autorskie Zadanie', 'dane3.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-01-06/'),
(75, 'Dla rekordów w tabeli Przyloty o ID [2, 4, 7] zmien date na \"1997-06-23\"', 'Autorskie Zadanie', 'dane3.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-01-06/'),
(76, 'Dla rekordów w tabeli Przyloty o ID [1, 3, 8] zmien date na \"2004-07-21\"', 'Autorskie Zadanie', 'dane3.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-01-06/'),
(77, 'Dla rekordów w tabeli Producenci o ID [4, 6, 8] zmien rok na \"2022\"', 'Autorskie Zadanie', 'dane1.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-02/'),
(78, 'Dodaj 3 rekordy o ID [1,2,3] do tabeli Producenci, kazda kolumna musi byc uzupelniona', 'Autorskie Zadanie', 'dane1.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-02/'),
(79, 'Dodaj 3 rekordy o ID [123,321,195] do tabeli Producenci, kazda kolumna musi byc uzupelniona', 'Autorskie Zadanie', 'dane1.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-02/'),
(80, 'Usun rekordy o ID [13,12,6] w tabeli Rodzaje', 'Autorskie Zadanie', 'dane1.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-02/'),
(81, 'Usun rekord o ID 2 w tabeli Rodzaje', 'Autorskie Zadanie', 'dane1.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-02/'),
(82, 'Usun rekord o ID 1 w tabeli Rodzaje', 'Autorskie Zadanie', 'dane1.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-02/'),
(83, 'Dodaj 5 produktow do tabeli Produkty', 'Autorskie Zadanie', 'dane1.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-02/'),
(84, 'Wybierajace jedynie pola Id, Nazwa, Adres, Miasto z tabeli Producenci dla rocznika mniejszego niz 1999', 'Autorskie Zadanie', 'dane1.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-02/'),
(85, 'Wybierajace jedynie pola Id, Nazwa, Adres, Miasto z tabeli Producenci dla rocznika mniejszego niz 2001', 'Autorskie Zadanie', 'dane1.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-02/'),
(86, 'Wybierajace jedynie pola Id, Nazwa, Adres, Miasto z tabeli Producenci dla rocznika mniejszego niz 2003', 'Autorskie Zadanie', 'dane1.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-02/'),
(87, 'Wybierajace jedynie pola Id, Nazwa, Adres, Miasto z tabeli Producenci dla rocznika wiekszego niz 2003', 'Autorskie Zadanie', 'dane1.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-02/'),
(88, 'Wybierajace jedynie pola Id, Nazwa, Adres, Miasto z tabeli Producenci dla rocznika wiekszego niz 1980', 'Autorskie Zadanie', 'dane1.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-02/'),
(89, 'Wybierajace jedynie pola Id, Nazwa, Adres, Miasto z tabeli Producenci dla rocznika wiekszego niz 1982', 'Autorskie Zadanie', 'dane1.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2021-06-02/'),
(90, 'Dodaj 4 fryzjerki o imionach: Magdalena, Agnieszka, Dagmara, Paulina.', 'Autorskie Zadanie', 'dane5.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-04/'),
(91, 'Dodaj 4 fryzjerow o imionach: Pawel, Patryk, Dawid, Seweryn.', 'Autorskie Zadanie', 'dane5.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-04/'),
(92, 'Zmien cene uslugi o id 3 w tabeli Uslugi na wartosc \"250\"', 'Autorskie Zadanie', 'dane5.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-04/'),
(93, 'Usun rekord z tabeli Kadra o id 2', 'Autorskie Zadanie', 'dane5.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-04/'),
(94, 'Usun rekord z tabeli Kadra o id 1', 'Autorskie Zadanie', 'dane5.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-ee09-2020-06-04/'),
(95, 'Dodaj rekord do tabeli Ryby o danych [\"Ognica pstra\", \"Morze\", \"1\"] ', 'Autorskie Zadanie', 'baza.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-inf03-2022-06-01/'),
(96, 'Usun rekord z tabeli Ryby o ID 2 ', 'Autorskie Zadanie', 'baza.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-inf03-2022-06-01/'),
(97, 'Usun rekord z tabeli Ryby o ID 7 ', 'Autorskie Zadanie', 'baza.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-inf03-2022-06-01/'),
(98, 'Stworz widok dla Tabeli okres_ochronny o nazwie \"Rybki\" z kolunami ID oraz Ryby_id', 'Autorskie Zadanie', 'baza.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-inf03-2022-06-01/'),
(99, 'Stworz widok dla Tabeli lowisko o nazwie \"Lowiska\" z kolunami Akwen oraz Wojewodztwo', 'Autorskie Zadanie', 'baza.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-inf03-2022-06-01/'),
(100, 'Usun rekord z tabeli Lowisko o ID 5', 'Autorskie Zadanie', 'baza.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-inf03-2022-06-01/'),
(101, 'Usun rekord z tabeli Lowisko o ID 3', 'Autorskie Zadanie', 'baza.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-inf03-2022-06-01/'),
(102, 'Usun rekord z tabeli Okres_ochronny o ID 3', 'Autorskie Zadanie', 'baza.sql', 'https://egzamin-informatyk.pl/arkusz-praktyczny-inf03-2022-06-01/');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `rozwiazania`
--
ALTER TABLE `rozwiazania`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_zadania` (`id_zadania`);

--
-- Indeksy dla tabeli `zadania`
--
ALTER TABLE `zadania`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `rozwiazania`
--
ALTER TABLE `rozwiazania`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT dla tabeli `zadania`
--
ALTER TABLE `zadania`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `rozwiazania`
--
ALTER TABLE `rozwiazania`
  ADD CONSTRAINT `id_zadania` FOREIGN KEY (`id_zadania`) REFERENCES `zadania` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
