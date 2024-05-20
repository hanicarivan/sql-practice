CREATE TABLE mjestoBezKljuca (
	pbrMjesto INT,
	naziv VARCHAR(50)
)

CREATE TABLE mjesto (
	pbrMjesto INT,
	naziv VARCHAR(50),
	PRIMARY KEY pbrMjesto (pbrMjesto)
)

CREATE TABLE student (
	sifStudent INT,
	jmbag VARCHAR(10) DEFAULT NULL,
	ime VARCHAR(255) COLLATE cp1250_croatian_ci DEFAULT NULL,
	prezime VARCHAR(255) COLLATE cp1250_croatian_ci DEFAULT NULL,
	pbrRodjenja INT(11) DEFAULT NULL,
	datUnos DATE DEFAULT NULL,
	PRIMARY KEY sifStudent (sifStudent)
	CONSTRAINT FK_Student_Mjesto FOREIGN KEY (pbrRodjenja) REFERENCES mjesto(pbrMjesto)...
)

ALTER TABLE STUDENT
DROP COLUMN datUnos,
ADD COLUMN visina DECIMAL(5,2) DEFAULT NULL AFTER pbrRodjenja,
CHANGE COLUMN ime imeStudent VARCHAR(50) NOT NULL;

DROP DATABASE autoservis;
DROP TABLE klijent;

INSERT INTO rezervacija VALUES (oznRadionica, satServis, sifKvar)
VALUES ('s55', 2, 33);
INSERT INTO rezervacija (oznRadionica, satServis, sifKvar)
SELECT oznRadionica, satServis, sifKvar FROM rezervacija

SELECT * FROM klijent;
SELECT klijent.* FROM klijent; (samo klijente a ima vise spojenih tablica)
SELECT klijent.jmbgKlijent, klijent.imeKlijent, klijent.prezimeKlijent
FROM klijent;

DELETE FROM klijent;

INSERT INTO zupanija(naziv) VALUES ("Zagrebačka županija");

INSERT INTO mjesto(pbrMjesto, nazivMjesto, sifZupanija)
VALUES (10002, "Neko mjesto u zagrebačkoj županiji", 1);

UPDATE mjesto
SET geoX = 10;
(SVIM MJESTIMA GEOX U 10)

UPDATE mjesto
SET geoX 0 geoX + 2;

UPDATE mjesto
SET geoY = geoX - 3,
    nazivMjesto = 'Mjesto1234';

CREATE TABLE album (
	sifAlbum INT,
	naslov VARCHAR(150),
	izvodjac VARCHAR(170),
	trajanjeMin DECIMAL(5,2),
	zanr INT
);

ALTER TABLE album
CHANGE COLUMN zanr zanr VARCHAR(50),
DROP COLUMN trajanjeMin,
CHANGE COLUMN sifAlbum id INT,
ADD COLUMN prikladnoZaDjecu BIT(1) AFTER naslov;

INSERT INTO album (id, naslov, prikladnoZaDjecu, izvodjac, zanr)
VALUES (1, "1984", 0, "Van Halen",  "Hard rock");

UPDATE album
SET id = 2, naslov = "Koloss", prikladnoZaDjecu = 1, izvodjac = "Meshuggah", zanr = "Djent";

SELECT naslov, izvodjac FROM album;

TRUNCATE TABLE album;

DROP TABLE album;

ALTER TABLE nalog
DROP COLUMN prioritetNalog,
CHANGE COLUMN OstvareniSatiRada SatiRada INT;

ALTER TABLE nastavnici
DROP COLUMN titulaIza,
CHANGE titulaIspred titula VARCHAR(30);

TRUNCATE TABLE klijent;

DROP TABLE klijent;

TRUNCATE TABLE ocjene;
DROP TABLE ocjene;

INSERT INTO kvar (sifKvar, nazivKvar, sifOdjel, brojRadnika, satiKvar)
VALUES (37, "Kvačilo", 6, 2, 1);

INSERT INTO smjerovi (id, naziv, oibUstanova, idNadsmjer)
VALUES (28, "Specijalistički studij mogovanja", "08814003451", 24);

INSERT INTO radnik (imeRadnik, prezimeRadnik, KoefPlaca)
VALUES ("Ivan", "Haničar", 1.56);

SELECT imeKlijent, prezimeKlijent FROM klijent;

SELECT * FROM odjel;

UPDATE klijent
SET imeKlijent = "Ivan", prezimeKlijent = "Kovačević";

UPDATE smjerovi
SET naziv = "informatika";

UPDATE radnik
SET koefPlaca = koefPlaca + 1;

UPDATE studenti
SET ocjene = 5;

SELECT imeKlijent, prezimeKlijent, datumUnosa FROM klijent;

CREATE TABLE rezervacije (
    idRezervacije INT NOT NULL,
    imeGost VARCHAR(25) NOT NULL,
    prezimeGost VARCHAR(50) NOT NULL,
    brojSoba INT,
    brojGostiju INT,
    kontakt VARCHAR(10),
    drzava CHAR(2),
    PRIMARY KEY (idRezervacije)
);

ALTER TABLE rezervacije
DROP COLUMN drzava,
CHANGE COLUMN kontakt broj VARCHAR(10),
ADD COLUMN datumOd DATE,
ADD COLUMN datumDo DATE;

CREATE TABLE filmovi (
	sifra INT,
	naziv VARCHAR(100),
	redatelj VARCHAR(100),
	glavniGlumci TEXT,
	zanr INT,
	vrijemeTrajanja TIME
);

SELECT * FROM kvar;

INSERT INTO klijent (imeKlijent, prezimeKlijent, jmbgKlijent)
VALUES ("Ivan", "Haničar", "1234567890123");

ALTER TABLE nalog
DROP COLUMN prioritetNalog,
CHANGE COLUMN OstvareniSatiRada SatiRada INT;

DROP TABLE rezervacija;

UPDATE radnik
SET imeRadnik = "Ivan",
SET pbrStan = 10000;

SELECT MAX(KoefPlaca) FROM radnik;

SELECT MIN(ocjena) FROM ocjene
WHERE jmbagStudent = "0128055514";

SELECT MAX(datumPolaganja) FROM ocjene
WHERE ocjena = 5;

SELECT UPPER(CONCAT(imeKlijent," ", prezimeKlijent)) FROM klijent;

SELECT naziv, LENGTH(naziv) FROM kolegiji;

SELECT  naziv FROM kolegiji
WHERE LENGTH(naziv) > 8;

SELECT nazivMjesto FROM mjesto
WHERE sifZupanija = 5 OR sifZupanija = 8 OR sifZupanija = 11;

SELECT COUNT(*) FROM studenti
WHERE idSmjer = 1;

SELECT idSmjer FROM kolegiji
WHERE naziv = "Fizika";

SELECT * FROM studenti
WHERE jmbag LIKE "119%";

SELECT * FROM zupanija
WHERE nazivZupanija LIKE "%zagreb%";

SELECT COUNT(*) FROM klijent
WHERE imeKlijent LIKE "T%";

SELECT * FROM klijent
WHERE LENGTH(imeKlijent) = LENGTH(prezimeKlijent);

SELECT * FROM nastavnici
WHERE LEFT(ime, 1) = RIGHT(prezime, 1);

SELECT SUM(satServis) FROM rezervacija
WHERE datVrstaDan = "PO" AND oznRadionica = "R3";

SELECT * FROM studenti.studenti WHERE prezime NOT REGEXP '[čćžšđ]' AND ime = 'Dino';

SELECT * FROM studenti.nastavnici n WHERE SUBSTR(prezime, 2, 1) = "a" AND RIGHT(prezime, 1) NOT REGEXP "[čćšđž]";

SELECT COUNT(*) AS broj_studenata
FROM studenti
WHERE JMBAG LIKE '0036%' AND prezime = 'Horvat';

SELECT COUNT(*)
FROM nastavnici
WHERE SUBSTRING(jmbg, 5, 3) BETWEEN '980' AND '989';

SELECT * FROM nastavnici WHERE ime LIKE "S_j%" AND lozinka = MD5("StjepanLukić");

SELECT * FROM studenti
WHERE ime LIKE "_e%" AND prezime LIKE '__mi%';

SELECT CONCAT(UPPER(RIGHT(prezime, 1)), '. ', UPPER(RIGHT(ime, 1)), '.') AS Inicijali FROM nastavnici;

SELECT *, (IFNULL(koefPlaca, 1) * iznosOsnovice) FROM radnik;

SELECT imeRadnik,prezimeRadnik,KoefPlaca*IznosOsnovice
FROM radnik WHERE KoefPlaca
BETWEEN 0.4 AND 1.5;

SELECT COUNT(*) FROM radnik;

SELECT SUM(IznosOsnovice) FROM radnik;
SELECT SUM(IFNULL(KoefPlaca, 1) * IznosOsnovice)
FROM radnik;

SELECT * FROM studenti
ORDER BY ime ASC, prezime ASC;

SELECT * FROM studenti
ORDER BY prezime ASC, ime ASC;

SELECT DISTINCT ime, prezime FROM studenti;

SELECT * FROM mjesta, zupanija, studenti, smjerovi;

radionica.oznRadionica = rezervacija.oznRadionica
rezervacija.sifKvar = kvar.sifKvar
odjel.sifOdjel = kvar.sifOdjel
odjel.sifOdjel = radnik.sifOdjel
kvar.sifKvar = nalog.sifKvar
radnik.sifRadnik = nalog.sifRadnik
radnik.pbrStan = mjesto.pbrMjesto
nalog.sifKlijent = klijent.sifKlijent
klijent.pbrKlijent = mjesto.pbrMjesto
klijent.pbrReg = mjesto.pbrMjesto
mjesto.sifZupanija = zupanija.sifZupanija

SELECT *
FROM mjesto, zupanija
WHERE mjesto.sifZupanija = zupanija.sifZupanija;

SELECT radnik.*, zupanija:nazivZupanija
FROM radnik, mjesto, zupanija
WHERE radnik.pbrStan = mjesto.pbrMjesto
AND mjesto.sifZupanija = zupanija.sifZupanija;

SELECT klijent.*
FROM klijent, mjesto, zupanija
WHERE klijent.pbrKlijent = mjesto.pbrMjesto
AND mjesto.sifZupanija = zupanija.sifZupanija
AND zupanija.nazivZupanija = “Zagrebačka”;

SELECT radnik.*
FROM radnik, nalog, kvar
WHERE radnik.sifRadnik = nalog.sifRadnik
AND nalog.sifKvar = kvar.sifKvar
AND kvar.nazivKvar = “Zamjena klipa”;

SELECT DISTINCT klijent.*
FROM odjel, kvar, nalog, klijent
WHERE odjel.sifOdjel = kvar.sifOdjel
AND kvar.sifKvar = kvar.sifOdjel
AND nalog.sifKlijent = klijent.sifKlijent
AND odjel.nazivOdjel = “Dijagnostika”;

SELECT DISTINCT klijent.*
FROM odjel, kvar, nalog, klijent, mjesto, zupanija
WHERE odjel.sifOdjel = kvar.sifOdjel
AND kvar.sifKvar = nalog.sifKvar
AND nalog.sifKlijent = klijent.sifKlijent
AND klijent.pbrReg = mjesto.pbrMjesto
AND mjesto.sifZupanija = zupanija.sifZupanija
AND odjel.nazivOdjel = “Dijagnostika”
AND zupanija.nazivZupanija = “Grad Zagreb”;

SELECT DISTINCT klijent.*
FROM odjel, kvar, nalog, klijent, mjesto, zupanija
WHERE odjel.sifOdjel = kvar.sifOdjel
AND kvar.sifKvar = nalog.sifKvar
AND nalog.sifKlijent = klijent.sifKlijent
AND klijent.pbrReg = mjesto.pbrMjesto
AND mjesto.sifZupanija = zupanija.sifZupanija
AND (odjel.nazivOdjel = “Dijagnostika”
OR zupanija.nazivZupanija = “Grad Zagreb”);

SELECT DATE_FORMAT(datumOsnutka, “%d.%m.%Y.”)
FROM USTANOVE
SELECT STR_TO_DATE(jmbg, “%d%m9%y”) FROM nastavnici;

SELECT ADDDATE(datumOsnutka, INTERVAL -30 DAY) FROM ustanove;

SELECT SUBDATE(datumOsnutka, INTERVAL 30 DAY) FROM ustanove;

SELECT ADDDATE(datumOsnutka, INTERVAL 3 MONTH) FROM ustanove;

SELECT NOW();

SELECT DATEDIFF(CURDATE(), datumOsnutka), naziv FROM ustanove;

SELECT DAY(datumOsnutka), MONTH(datumOsnutka), YEAR(datumOsnutka) FROM ustanove;

SELECT * FROM ocjene
WHERE HOUR(vrijemePolaganja) = HOUR(CURTIME());

SELECT EXTRACT(HOUR FROM vrijemePolaganja) FROM ocjene

SELECT DATE_FORMAT(datumOsnutka, “%d.%m.%Y.”) FROM ustanove;

SELECT * FROM klijent
WHERE datUnosKlijent = SUBDATE(CURDATE(), INTERVAL 25 YEAR)
ORDER BY datUnosKlijent ASC;

SELECT AVG(ocjena) FROM ocjene
WHERE YEAR(datumPolaganja) = YEAR(CURDATE()) - 1;

SELECT mjesto.* FROM mjesto, zupanija
WHERE mjesto.sifZupanija = zupanija.sifZupanija
AND nazivZupanija IS NOT NULL;

SELECT ime, prezime FROM nastavnici
WHERE titulaIza IS NULL
ORDER BY ime ASC, prezime DESC;

SELECT radnik.*, prioritetNalog FROM radnik, nalog, kvar
WHERE radnik.sifRadnik = nalog.sifRadnik
AND kvar.sifKvar = nalog.sifKvar
AND kvar.nazivKvar = "Zamjena klipa";

SELECT ime, prezime, nazivMjesto, kolegiji.naziv, ulogaizvrsitelja.naziv FROM nastavnici, mjesta, kolegiji, izvrsitelji, ulogaizvrsitelja
WHERE mjesta.postbr = nastavnici.postBr
AND nastavnici.jmbg = izvrsitelji.jmbgNastavnik
AND ulogaizvrsitelja.id = izvrsitelji.idUlogaIzvrsitelja
AND kolegiji.id = izvrsitelji.idKolegij
ORDER BY kolegiji.naziv ASC, prezime ASC;

UPDATE radionica
SET kapacitetRadnika = 5
WHERE oznRadionica = "R10";¸

DELETE FROM ocjene
WHERE jmbagStudent LIKE "0035%";

SELECT CONCAT(jmbag,";", ime,";", prezime) FROM studenti
WHERE YEAR(datumUpisa) = YEAR(CURDATE()) - 3;

STR_TO_DATE(LEFT(jmbg, 6), "%d%m%Y");

SELECT DISTINCT kolegiji.* FROM nastavnici, kolegiji, izvrsitelji
WHERE nastavnici.jmbg = izvrsitelji.jmbgNastavnik
AND kolegiji.id = izvrsitelji.idKolegij
AND (YEAR(CURDATE()) - YEAR(STR_TO_DATE(LEFT(nastavnici.jmbg, 6), "%d%m%Y")) > 50)
ORDER BY kolegiji.naziv ASC;

SELECT kvar.* FROM kvar, nalog
WHERE kvar.sifKvar = nalog.sifKvar
AND (MONTH(datPrimitkaNalog) = 1 OR MONTH(datPrimitkaNalog) = 2 OR MONTH(datPrimitkaNalog) = 8);

SELECT studenti.*, ocjene.*  FROM studenti, ocjene, kolegiji
WHERE (studenti.jmbag = ocjene.jmbagStudent AND ocjene.idKolegij = kolegiji.id)
AND (DATE_FORMAT(studenti.datumUpisa, '%m-%d') BETWEEN '05-03' AND '10-22') AND kolegiji.naziv LIKE 'baze podataka'
SELECT pbrKlijent, nazivMjesto FROM klijent, mjesto
WHERE mjesto.pbrMjesto = klijent.pbrKlijent
AND MONTH(datUnosKlijent) <= 3 AND YEAR(datUnosKlijent) = 2019
ORDER BY nazivMjesto ASC;

SELECT ime, prezime, jmbag, ocjena  FROM studenti, ocjene, kolegiji
WHERE (studenti.jmbag = ocjene.jmbagStudent AND ocjene.idKolegij = kolegiji.id)
AND  kolegiji.naziv LIKE 'baze%';

SELECT nazivOdjel FROM odjel, radnik, mjesto
WHERE odjel.sifOdjel = radnik.sifOdjel
AND mjesto.pbrMjesto = radnik.pbrStan
AND nazivMjesto = "Dubrovnik"
ORDER BY nazivOdjel DESC;

DELETE FROM ocjene
WHERE YEAR(datumPolaganja) < 2008;

SELECT * FROM klijent
WHERE datUnosKlijent = SUBDATE(CURDATE(), INTERVAL 25 YEAR)
ORDER BY datUnosKlijent ASC;

SELECT AVG(ocjena) FROM ocjene
WHERE YEAR(datumPolaganja) = YEAR(CURDATE()) - 1;

SELECT mjesto.* FROM mjesto, zupanija
WHERE mjesto.sifZupanija = zupanija.sifZupanija
AND nazivZupanija IS NOT NULL;

SELECT ime, prezime FROM nastavnici
WHERE titulaIza IS NULL
ORDER BY ime ASC, prezime DESC;

SELECT radnik.*, prioritetNalog FROM radnik, nalog, kvar
WHERE radnik.sifRadnik = nalog.sifRadnik
AND kvar.sifKvar = nalog.sifKvar
AND kvar.nazivKvar = "Zamjena klipa";

SELECT ime, prezime, nazivMjesto, kolegiji.naziv, ulogaizvrsitelja.naziv FROM nastavnici, mjesta, kolegiji, izvrsitelji, ulogaizvrsitelja
WHERE mjesta.postbr = nastavnici.postBr
AND nastavnici.jmbg = izvrsitelji.jmbgNastavnik
AND ulogaizvrsitelja.id = izvrsitelji.idUlogaIzvrsitelja
AND kolegiji.id = izvrsitelji.idKolegij
ORDER BY kolegiji.naziv ASC, prezime ASC;

UPDATE radionica
SET kapacitetRadnika = 5
WHERE oznRadionica = "R10";

DELETE FROM ocjene
WHERE jmbagStudent LIKE "0035%";

SELECT CONCAT(jmbag,";", ime,";", prezime) FROM studenti
WHERE YEAR(datumUpisa) = YEAR(CURDATE()) - 3;

SELECT DISTINCT kolegiji.* FROM nastavnici, kolegiji, izvrsitelji
WHERE nastavnici.jmbg = izvrsitelji.jmbgNastavnik
AND kolegiji.id = izvrsitelji.idKolegij
AND (YEAR(CURDATE()) - YEAR(STR_TO_DATE(LEFT(nastavnici.jmbg, 6), "%d%m%Y")) > 50)
ORDER BY kolegiji.naziv ASC;

SELECT kvar.* FROM kvar, nalog
WHERE kvar.sifKvar = nalog.sifKvar
AND (MONTH(datPrimitkaNalog) = 1 OR MONTH(datPrimitkaNalog) = 2 OR MONTH(datPrimitkaNalog) = 8);

SELECT studenti.* FROM studenti
WHERE MONTH(datumUpisa) = 9 AND DAY(datumUpisa) = 25
ORDER BY prezime ASC, ime ASC;

SELECT studenti.*, ocjene.*  FROM studenti, ocjene, kolegiji
WHERE (studenti.jmbag = ocjene.jmbagStudent AND ocjene.idKolegij = kolegiji.id)
AND (DATE_FORMAT(studenti.datumUpisa, '%m-%d') BETWEEN '05-03' AND '10-22') AND kolegiji.naziv LIKE 'baze podataka'

SELECT pbrKlijent, nazivMjesto FROM klijent, mjesto
WHERE mjesto.pbrMjesto = klijent.pbrKlijent
AND MONTH(datUnosKlijent) <= 3 AND YEAR(datUnosKlijent) = 2019
ORDER BY nazivMjesto ASC;

SELECT ime, prezime, jmbag, ocjena  FROM studenti, ocjene, kolegiji
WHERE (studenti.jmbag = ocjene.jmbagStudent AND ocjene.idKolegij = kolegiji.id)
AND  kolegiji.naziv LIKE 'baze%';

SELECT nazivOdjel FROM odjel, radnik, mjesto
WHERE odjel.sifOdjel = radnik.sifOdjel
AND mjesto.pbrMjesto = radnik.pbrStan
AND nazivMjesto = "Dubrovnik"
ORDER BY nazivOdjel DESC;

DELETE FROM ocjene
WHERE YEAR(datumPolaganja) < 2008;

SELECT klijent.*, nazivKvar, nazivMjesto, nazivZupanija FROM klijent, nalog, kvar, mjesto, zupanija
WHERE klijent.sifKlijent = nalog.sifKlijent
AND kvar.sifKvar = nalog.sifKvar
AND mjesto.pbrMjesto = klijent.pbrReg
AND zupanija.sifZupanija = mjesto.sifZupanija;

DELETE FROM izvrsitelji
WHERE idUlogaIzvrsitelja = 1;

SELECT radnik.* FROM radnik, mjesto
WHERE radnik.pbrStan = mjesto.pbrMjesto
AND nazivMjesto IS NOT NULL
ORDER BY nazivMjesto ASC, prezimeRadnik DESC, imeRadnik ASC;

UPDATE nastavnici
SET titulaIza = NULL
WHERE titulaIza = "";

SELECT ime, prezime, nazivMjesto, kolegiji.naziv FROM nastavnici, izvrsitelji, kolegiji, mjesta
WHERE nastavnici.jmbg = izvrsitelji.jmbgNastavnik
AND kolegiji.id = izvrsitelji.idKolegij
AND mjesta.postbr = nastavnici.postBr;

SELECT studenti.*, ocjene.*  FROM studenti, ocjene, kolegiji
WHERE (studenti.jmbag = ocjene.jmbagStudent AND ocjene.idKolegij = kolegiji.id)
AND (DATE_FORMAT(studenti.datumUpisa, '%m-%d') BETWEEN '05-03' AND '10-22') 
AND kolegiji.naziv 
LIKE 'baze podataka'

SELECT klijent.* FROM klijent
WHERE DAYOFYEAR(datUnosKlijent)
BETWEEN DAYOFYEAR("0000-03-24") AND DAYOFYEAR("0000-05-26")
ORDER BY prezimeKlijent ASC;

SELECT radnik.*, prioritetNalog FROM radnik
INNER JOIN nalog ON radnik.sifRadnik = nalog.sifRadnik
INNER JOIN kvar ON nalog.sifKvar = kvar.sifKvar
WHERE kvar.nazivKvar = "Zamjena klipa";

SELECT kvar.* FROM kvar
INNER JOIN nalog ON kvar.sifKvar = nalog.sifKvar
INNER JOIN klijent ON nalog.sifKlijent = klijent.sifKlijent
INNER JOIN mjesto ON klijent.pbrReg = mjesto.pbrMjesto
INNER JOIN zupanija ON mjesto.sifZupanija = zupanija.sifZupanija
WHERE nazivZupanija = "Grad Zagreb";

SELECT mjesto.*, klijent.* FROM mjesto
LEFT JOIN zupanija ON mjesto.sifZupanija = zupanija.sifZupanija
LEFT JOIN klijent ON mjesto.pbrMjesto = klijent.pbrReg
WHERE zupanija.nazivZupanija = "Splitsko-dalmatinska";

SELECT nastavnici.* FROM nastavnici
INNER JOIN izvrsitelji ON nastavnici.jmbg = izvrsitelji.jmbgNastavnik
INNER JOIN kolegiji ON izvrsitelji.idKolegij = kolegiji.id
INNER JOIN smjerovi ON kolegiji.idSmjer = smjerovi.id
INNER JOIN ustanove ON smjerovi.oibUstanova = ustanove.oib
WHERE ustanove.naziv = "Tehničko Veleučilište u Zagrebu";

SELECT nastavnici.* FROM nastavnici
LEFT JOIN izvrsitelji ON nastavnici.jmbg = izvrsitelji.jmbgNastavnik
LEFT JOIN kolegiji ON izvrsitelji.idKolegij = kolegiji.id
WHERE kolegiji.naziv IS NULL;

SELECT AVG(ocjena) FROM ocjene
INNER JOIN kolegiji ON ocjene.idKolegij = kolegiji.id
INNER JOIN smjerovi ON kolegiji.idSmjer = smjerovi.id
INNER JOIN ustanove ON smjerovi.oibUstanova = ustanove.oib
WHERE ustanove.naziv = "Tehničko Veleučilište u Zagrebu";

SELECT studenti.* FROM studenti
LEFT JOIN ocjene ON ocjene.jmbagStudent = studenti.jmbag
INNER JOIN smjerovi ON studenti.idSmjer = smjerovi.id
INNER JOIN ustanove ON smjerovi.oibUstanova = ustanove.oib
WHERE ocjene.ocjena IS NULL AND ustanove.naziv = "Tehničko Veleučilište u Zagrebu";

SELECT smjerovi.* FROM smjerovi
INNER JOIN ustanove ON smjerovi.oibUstanova = ustanove.oib
INNER JOIN mjesta ON ustanove.postbr = mjesta.postbr
INNER JOIN zupanije ON mjesta.idZupanija = zupanije.id
WHERE nazivZupanija = "Grad Zagreb";

SELECT nazivMjesto FROM mjesta
LEFT JOIN ustanove ON mjesta.postbr = ustanove.postbr
WHERE ustanove.postbr IS NULL;

SELECT radnik.*, prioritetNalog FROM radnik
INNER JOIN nalog ON radnik.sifRadnik = nalog.sifRadnik
INNER JOIN kvar ON nalog.sifKvar = kvar.sifKvar
WHERE kvar.nazivKvar = "Zamjena klipa";

SELECT kvar.* FROM kvar
INNER JOIN nalog ON kvar.sifKvar = nalog.sifKvar
INNER JOIN klijent ON nalog.sifKlijent = klijent.sifKlijent
INNER JOIN mjesto ON klijent.pbrReg = mjesto.pbrMjesto
INNER JOIN zupanija ON mjesto.sifZupanija = zupanija.sifZupanija
WHERE nazivZupanija = "Grad Zagreb";

SELECT mjesto.*, klijent.* FROM mjesto
LEFT JOIN zupanija ON mjesto.sifZupanija = zupanija.sifZupanija
LEFT JOIN klijent ON mjesto.pbrMjesto = klijent.pbrReg
WHERE zupanija.nazivZupanija = "Splitsko-dalmatinska";

SELECT nastavnici.* FROM nastavnici
INNER JOIN izvrsitelji ON nastavnici.jmbg = izvrsitelji.jmbgNastavnik
INNER JOIN kolegiji ON izvrsitelji.idKolegij = kolegiji.id
INNER JOIN smjerovi ON kolegiji.idSmjer = smjerovi.id
INNER JOIN ustanove ON smjerovi.oibUstanova = ustanove.oib
WHERE ustanove.naziv = "Tehničko Veleučilište u Zagrebu";

SELECT nastavnici.* FROM nastavnici
LEFT JOIN izvrsitelji ON nastavnici.jmbg = izvrsitelji.jmbgNastavnik
LEFT JOIN kolegiji ON izvrsitelji.idKolegij = kolegiji.id
WHERE kolegiji.naziv IS NULL;

SELECT AVG(ocjena) FROM ocjene
INNER JOIN kolegiji ON ocjene.idKolegij = kolegiji.id
INNER JOIN smjerovi ON kolegiji.idSmjer = smjerovi.id
INNER JOIN ustanove ON smjerovi.oibUstanova = ustanove.oib
WHERE ustanove.naziv = "Tehničko Veleučilište u Zagrebu";

SELECT studenti.* FROM studenti
LEFT JOIN ocjene ON ocjene.jmbagStudent = studenti.jmbag
INNER JOIN smjerovi ON studenti.idSmjer = smjerovi.id
INNER JOIN ustanove ON smjerovi.oibUstanova = ustanove.oib
WHERE ocjene.ocjena IS NULL AND ustanove.naziv = "Tehničko Veleučilište u Zagrebu";

SELECT smjerovi.* FROM smjerovi
INNER JOIN ustanove ON smjerovi.oibUstanova = ustanove.oib
INNER JOIN mjesta ON ustanove.postbr = mjesta.postbr
INNER JOIN zupanije ON mjesta.idZupanija = zupanije.id
WHERE nazivZupanija = "Grad Zagreb";

SELECT nazivMjesto FROM mjesta
LEFT JOIN ustanove ON mjesta.postbr = ustanove.postbr
WHERE ustanove.postbr IS NULL;

SELECT nastavnici.*
FROM nastavnici
INNER JOIN izvrsitelji ON nastavnici.jmbg = izvrsitelji.jmbgNastavnik
INNER JOIN kolegiji ON izvrsitelji.idKolegij = kolegiji.id
INNER JOIN smjerovi ON kolegiji.idSmjer = smjerovi.id
INNER JOIN ustanove ON smjerovi.oibUstanova = ustanove.oib
INNER JOIN mjesta ON ustanove.postbr = mjesta.postbr
INNER JOIN zupanije ON mjesta.idZupanija = zupanije.id
WHERE zupanije.nazivZupanija = 'Vukovarsko-srijemska županija'
AND ustanove.datumOsnutka <= CURDATE() - INTERVAL 10 YEAR;

SELECT DISTINCT radnik.* FROM radnik
LEFT JOIN nalog ON radnik.sifRadnik = nalog.sifRadnik
WHERE nalog.sifKvar IS NULL
ORDER BY radnik.prezimeRadnik ASC, radnik.imeRadnik ASC;

SELECT AVG(ocjene.ocjena) AS prosjek FROM ocjene
INNER JOIN studenti ON ocjene.jmbagStudent = studenti.jmbag
INNER JOIN mjesta ON studenti.postBrPrebivanje = mjesta.postbr
INNER JOIN zupanije ON mjesta.idZupanija = zupanije.id
WHERE zupanije.nazivZupanija LIKE 'Splitsko-dalmatinska županija'
AND ocjene.datumPolaganja BETWEEN CURDATE() - INTERVAL 2 YEAR AND CURDATE();

SELECT nastavnici.* FROM nastavnici
INNER JOIN izvrsitelji ON nastavnici.jmbg = izvrsitelji.jmbgNastavnik
INNER JOIN kolegiji ON izvrsitelji.idKolegij = kolegiji.id
INNER JOIN smjerovi ON smjerovi.id = kolegiji.idSmjer
INNER JOIN ustanove ON smjerovi.oibUstanova = ustanove.oib
INNER JOIN mjesta ON nastavnici.postBr = mjesta.postbr
INNER JOIN zupanije ON mjesta.idZupanija = zupanije.id
WHERE ustanove.naziv = "Fakultet organizacije i informatike"
AND nazivZupanija != "Varaždinska županija";

SELECT DISTINCT radnik.* FROM radnik
INNER JOIN nalog ON radnik.sifRadnik = nalog.sifRadnik
INNER JOIN klijent ON nalog.sifKlijent = klijent.sifKlijent
INNER JOIN mjesto ON klijent.pbrReg = mjesto.pbrMjesto
INNER JOIN zupanija ON mjesto.sifZupanija = zupanija.sifZupanija
WHERE radnik.KoefPlaca > 1.2 AND zupanija.nazivZupanija = "Grad Zagreb";

SELECT mjesto.*, klijent.* FROM mjesto
INNER JOIN zupanija ON mjesto.sifZupanija = zupanija.sifZupanija
LEFT JOIN klijent ON mjesto.pbrMjesto = klijent.pbrKlijent
WHERE zupanija.nazivZupanija LIKE '%ska%';

SELECT nastavnici.* FROM nastavnici
LEFT OUTER JOIN izvrsitelji ON nastavnici.jmbg = izvrsitelji.jmbgNastavnik
WHERE izvrsitelji.idUlogaIzvrsitelja IS NULL;

SELECT ustanove.* FROM ustanove
INNER JOIN smjerovi ON ustanove.oib = smjerovi.oibUstanova
INNER JOIN kolegiji ON smjerovi.id = kolegiji.idSmjer
WHERE kolegiji.naziv = "Baze podataka";

SELECT imeRadnik, prezimeRadnik, nazivMjesto FROM radnik
INNER JOIN mjesto ON radnik.pbrStan = mjesto.pbrMjesto
UNION
SELECT imeKlijent, prezimeKlijent, nazivMjesto FROM klijent
INNER JOIN mjesto ON klijent.pbrKlijent = mjesto.pbrMjesto;

SELECT nastavnici.* FROM nastavnici
LEFT JOIN izvrsitelji ON nastavnici.jmbg = izvrsitelji.jmbgNastavnik
WHERE izvrsitelji.jmbgNastavnik IS NULL;

SELECT kMjesto.nazivMjesto, rMjesto.nazivMjesto FROM klijent
	JOIN mjesto AS kMjesto ON klijent.pbrKlijent = kMjesto.pbrMjesto
	JOIN zupanija AS kZupanija ON kMjesto.sifZupanija = kZupanija.sifZupanija
	JOIN nalog ON klijent.sifKlijent = nalog.sifKlijent
	JOIN radnik ON nalog.sifRadnik = radnik.sifRadnik
	JOIN mjesto AS rMjesto ON radnik.pbrStan = rMjesto.pbrMjesto
	JOIN zupanija AS rZupanija ON rMjesto.sifZupanija = rZupanija.sifZupanija
	WHERE kMjesto.pbrMjesto != rMjesto.pbrMjesto AND
	kZupanija.sifZupanija = rZupanija.sifZupanija;
	

SELECT kvar.* FROM kvar
	JOIN nalog ON kvar.sifKvar = nalog.sifKvar
	JOIN klijent ON nalog.sifKlijent = klijent.sifKlijent
	JOIN mjesto AS mjestoReg ON klijent.pbrReg = mjestoReg.pbrMjesto
	JOIN zupanija AS zupanijaReg ON mjestoReg.sifZupanija = zupanijaReg.sifZupanija
	JOIN mjesto AS mjestoStan ON klijent.pbrKlijent = mjestoStan.pbrMjesto
	JOIN zupanija AS zupanijaStan ON mjestoStan.sifZupanija = zupanijaStan.sifZupanija
	WHERE zupanijaReg.nazivZupanija = "Grad Zagreb" AND
	zupanijaStan.nazivZupanija = "Splitsko-dalmatinska";
	

SELECT studenti.* FROM studenti
	JOIN mjesta AS mjestoStan ON studenti.postBrStanovanja = mjestoStan.postbr
	JOIN zupanije AS zupanijaStan ON mjestoStan.idZupanija = zupanijaStan.id
	JOIN mjesta AS mjestoPreb ON studenti.postBrPrebivanje = mjestoPreb.postbr
	JOIN zupanije AS zupanijaPreb ON mjestoPreb.idZupanija = zupanijaPreb.id
	WHERE zupanijaStan.nazivZupanija = "Šibensko-kninska županija" AND
	zupanijaPreb.nazivZupanija = "Šibensko-kninska županija";
	

SELECT nastavnici.* FROM nastavnici
	JOIN mjesta AS mjestoStan ON nastavnici.postBr = mjestoStan.postbr
	JOIN zupanije AS zupStan ON mjestoStan.idZupanija = zupStan.id
	JOIN izvrsitelji ON nastavnici.jmbg = izvrsitelji.jmbgNastavnik
	JOIN kolegiji ON izvrsitelji.idKolegij = kolegiji.id
	JOIN smjerovi ON kolegiji.idSmjer = smjerovi.id
	JOIN ustanove ON smjerovi.oibUstanova = ustanove.oib
	JOIN mjesta AS mjestaUstanove ON ustanove.postbr = mjestaUstanove.postbr
	JOIN zupanije AS zupUstanove ON mjestaUstanove.idZupanija = zupUstanove.id
	WHERE zupStan.nazivZupanija = "Grad Zagreb" AND
	zupUstanove.nazivZupanija = "Varaždinska županija";
	

SELECT ime, prezime, nazivMjesto FROM nastavnici
	RIGHT JOIN mjesta ON nastavnici.postBr = mjesta.postbr
	JOIN zupanije ON mjesta.idZupanija = zupanije.id
	WHERE zupanije.nazivZupanija = "Splitsko-dalmatinska županija";
	

SELECT smjerovi.*, podsmjerovi.* FROM zupanije
	JOIN mjesta ON zupanije.id = mjesta.idZupanija
	JOIN ustanove ON mjesta.postbr = ustanove.postbr
	JOIN smjerovi ON smjerovi.oibUstanova = ustanove.oib
	LEFT JOIN smjerovi AS podsmjerovi ON smjerovi.id = podsmjerovi.idNadsmjer
	WHERE nazivZupanija = "Grad Zagreb"
	ORDER BY smjerovi.naziv ASC, podsmjerovi.naziv ASC;
	
	
SELECT ocjene.* FROM zupanije AS zupStan
	JOIN mjesta AS mjStan ON zupStan.id = mjStan.idZupanija
	JOIN studenti ON mjStan.postbr = studenti.postBrStanovanja
	
	JOIN mjesta AS mjPreb ON studenti.postBrPrebivanje = mjPreb.postbr
	JOIN zupanije AS zupPreb ON mjPreb.idZupanija = zupPreb.id
	
	JOIN ocjene ON studenti.jmbag = ocjene.jmbagStudent
	JOIN kolegiji ON ocjene.idKolegij = kolegiji.id
	JOIN izvrsitelji ON kolegiji.id =  izvrsitelji.idKolegij
	JOIN nastavnici ON izvrsitelji.jmbgNastavnik = nastavnici.jmbg
	JOIN mjesta AS mjNast ON nastavnici.postBr = mjNast.postBr
	JOIN zupanije AS zupNast ON mjNast.idZupanija = zupNast.id
	
	JOIN smjerovi ON kolegiji.idSmjer = smjerovi.id
	JOIN ustanove ON smjerovi.oibUstanova = ustanove.oib
	JOIN mjesta AS mjUstanove ON ustanove.postbr = mjUstanove.postbr
	JOIN zupanije AS zupUstanove ON mjUstanove.idZupanija = zupUstanove.id
	
	WHERE zupStan.nazivZupanija = "Osječko-baranjska županija"
	AND zupPreb.nazivZupanija = "Grad Zagreb"
	AND zupNast.nazivZupanija = "Varaždinska županija"
	AND zupUstanove.nazivZupanija = "Varaždinska županija";
	

SELECT ocjene.* FROM zupanije AS zupStan
	JOIN mjesta AS mjStan ON zupStan.id = mjStan.idZupanija
	JOIN studenti ON mjStan.postbr = studenti.postBrStanovanja
	
	JOIN mjesta AS mjPreb ON studenti.postBrPrebivanje = mjPreb.postbr
	JOIN zupanije AS zupPreb ON mjPreb.idZupanija = zupPreb.id
	
	JOIN ocjene ON studenti.jmbag = ocjene.jmbagStudent
	JOIN kolegiji ON ocjene.idKolegij = kolegiji.id
	JOIN izvrsitelji ON kolegiji.id =  izvrsitelji.idKolegij
	JOIN nastavnici ON izvrsitelji.jmbgNastavnik = nastavnici.jmbg
	JOIN mjesta AS mjNast ON nastavnici.postBr = mjNast.postBr
	JOIN zupanije AS zupNast ON mjNast.idZupanija = zupNast.id
	
	JOIN smjerovi ON kolegiji.idSmjer = smjerovi.id
	JOIN ustanove ON smjerovi.oibUstanova = ustanove.oib
	JOIN mjesta AS mjUstanove ON ustanove.postbr = mjUstanove.postbr
	JOIN zupanije AS zupUstanove ON mjUstanove.idZupanija = zupUstanove.id
	
	WHERE zupPreb.id != zupStan.id
	AND zupNast.id != zupPreb.id
	AND zupNast.id != zupStan.id
	AND zupUstanove.id != zupPreb.id
	AND zupUstanove.id != zupStan.id
	AND zupUstanove.id != zupNast.id;
