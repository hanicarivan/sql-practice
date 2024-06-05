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

LABOS 7
SELECT odjel.nazivOdjel, kvar.sifOdjel, SUM(kvar.satiKvar) AS brojSati, SUM(kvar.brojRadnika) AS brojRadnik
FROM kvar
INNER JOIN odjel ON kvar.sifOdjel = odjel.sifOdjel
GROUP BY odjel.nazivOdjel, kvar.sifOdjel
HAVING brojSati > 1
ORDER BY brojRadnik ASC LIMIT 5;

SELECT mjesto.pbrMjesto, mjesto.nazivMjesto, SUM(radnik.IznosOsnovice * radnik.KoefPlaca) AS placaRadnik
FROM radnik
INNER JOIN mjesto ON radnik.pbrStan = mjesto.pbrMjesto
GROUP BY mjesto.pbrMjesto, mjesto.nazivMjesto
LIMIT 5;

SELECT odjel.sifOdjel, odjel.nazivOdjel, COUNT(kvar.sifKvar) AS brojKvar
FROM odjel
LEFT JOIN kvar ON odjel.sifOdjel = kvar.sifOdjel
GROUP BY odjel.sifOdjel, odjel.nazivOdjel
ORDER BY brojKvar ASC;

SELECT mjesta.postbr, mjesta.nazivMjesto, COUNT(studenti.jmbag) AS brojStudent
FROM mjesta
LEFT JOIN studenti ON mjesta.postbr = studenti.postBrStanovanja
GROUP BY mjesta.postbr, mjesta.nazivMjesto
HAVING brojStudent < 10
LIMIT 20;

SELECT zupanije.id, zupanije.nazivZupanija, AVG(ocjene.ocjena) AS prosjekOcjena
FROM zupanije
INNER JOIN mjesta ON zupanije.id = mjesta.idZupanija
INNER JOIN studenti ON mjesta.postbr = studenti.postBrStanovanja
INNER JOIN ocjene ON studenti.jmbag = ocjene.jmbagStudent
GROUP BY zupanije.id, zupanije.nazivZupanija
ORDER BY prosjekOcjena DESC
LIMIT 10;

SELECT ustanove.oib, ustanove.naziv, COUNT(nastavnici.jmbg) AS brojNastavnik
FROM ustanove 
INNER JOIN smjerovi ON ustanove.oib = smjerovi.oibUstanova
INNER JOIN kolegiji ON smjerovi.id = kolegiji.idSmjer
INNER JOIN izvrsitelji ON kolegiji.id = izvrsitelji.idKolegij
INNER JOIN ulogaizvrsitelja ON izvrsitelji.idUlogaIzvrsitelja = ulogaizvrsitelja.id
INNER JOIN nastavnici ON izvrsitelji.jmbgNastavnik = nastavnici.jmbg
WHERE ulogaIzvrsitelja.naziv = 'asistent'
GROUP BY ustanove.naziv, ustanove.oib
ORDER BY brojNastavnik ASC;

SELECT ustanove.oib, ustanove.naziv, smjerovi.id, smjerovi.naziv, COUNT(kolegiji.id) AS brojKolegij
FROM ustanove
JOIN mjesta ON mjesta.postbr = ustanove.postbr
LEFT JOIN smjerovi ON ustanove.oib = smjerovi.oibUstanova
LEFT JOIN kolegiji ON smjerovi.id = kolegiji.idSmjer
WHERE mjesta.nazivMjesto = "Zagreb"
GROUP BY ustanove.oib, ustanove.naziv, smjerovi.id, smjerovi.naziv
ORDER BY  ustanove.naziv ASC, smjerovi.naziv ASC;

SELECT zupanija.sifZupanija, zupanija.nazivZupanija, COUNT(klijent.pbrReg) AS brojReg
FROM zupanija
LEFT JOIN mjesto ON zupanija.sifZupanija = mjesto.sifZupanija
LEFT JOIN klijent ON mjesto.pbrMjesto = klijent.pbrReg
GROUP BY zupanija.sifZupanija, zupanija.nazivZupanija
ORDER BY brojReg DESC;
SELECT zupanije.id, zupanije.nazivZupanija, COUNT(nastavnici.jmbg) AS brojNast
FROM zupanije
LEFT JOIN mjesta ON zupanije.id = mjesta.idZupanija
LEFT JOIN nastavnici ON mjesta.postbr = nastavnici.postBr
WHERE zupanije.nazivZupanija LIKE "D%"
GROUP BY zupanije.id, zupanije.nazivZupanija
ORDER BY brojNast;

SELECT zupanije.id, zupanije.nazivZupanija, COUNT(nastavnici.jmbg) AS brojAsistent
FROM zupanije
INNER JOIN mjesta ON zupanije.id = mjesta.idZupanija
INNER JOIN nastavnici ON mjesta.postbr = nastavnici.postBr
INNER JOIN izvrsitelji ON izvrsitelji.jmbgNastavnik = nastavnici.jmbg
INNER JOIN ulogaizvrsitelja ON izvrsitelji.idUlogaIzvrsitelja = ulogaizvrsitelja.id
WHERE ulogaizvrsitelja.naziv = "asistent"
GROUP BY zupanije.id, zupanije.nazivZupanija
HAVING brojAsistent > 3
ORDER BY brojAsistent DESC;

SELECT mjesta.postbr, mjesta.nazivMjesto, AVG(ocjene.ocjena) AS prosjekOcjena
FROM mjesta
INNER JOIN ustanove ON ustanove.postbr = mjesta.postbr
INNER JOIN smjerovi ON ustanove.oib = smjerovi.oibUstanova
INNER JOIN kolegiji ON kolegiji.idSmjer = smjerovi.id
INNER JOIN ocjene ON kolegiji.id = ocjene.idKolegij
WHERE ocjena != 1 AND ocjena != 5
GROUP BY mjesta.postbr, mjesta.nazivMjesto
HAVING prosjekOcjena > 3
ORDER BY prosjekOcjena DESC;

SELECT zupanija.sifZupanija, zupanija.nazivZupanija, IFNULL(AVG(radnik.IznosOsnovice * radnik.KoefPlaca), 0) AS ProsjecnaPlaca
FROM zupanija
LEFT JOIN mjesto ON zupanija.sifZupanija = mjesto.sifZupanija
LEFT JOIN radnik ON mjesto.pbrMjesto = radnik.pbrStan
WHERE zupanija.nazivZupanija LIKE '%d%'
GROUP BY zupanija.sifZupanija, zupanija.nazivZupanija
ORDER BY ProsjecnaPlaca DESC;

SELECT radionica.oznRadionica, SUM(nalog.OstvareniSatiRada) AS utroseniSati FROM nalog
LEFT JOIN kvar ON kvar.sifKvar = nalog.sifKvar
LEFT JOIN rezervacija ON rezervacija.sifKvar = kvar.sifKvar
LEFT JOIN radionica ON radionica.oznRadionica = rezervacija.oznRadionica
GROUP BY radionica.oznRadionica
ORDER BY utroseniSati DESC
LIMIT 5;

SELECT mjesta.postbr, mjesta.nazivMjesto, AVG(ocjene.ocjena) AS prosjekOcjena
FROM mjesta
INNER JOIN studenti ON mjesta.postbr = studenti.postBrStanovanja
INNER JOIN ocjene ON studenti.jmbag = ocjene.jmbagStudent
WHERE MONTH(ocjene.datumPolaganja) = 6
AND YEAR(ocjene.datumPolaganja) = YEAR(CURDATE()) - 2
GROUP BY mjesta.postbr, mjesta.nazivMjesto
ORDER BY mjesta.nazivMjesto ASC
LIMIT 10;

SELECT COUNT(radnik.sifRadnik) AS brojRadnika, zupanija.nazivZupanija
FROM radnik
RIGHT JOIN mjesto ON radnik.pbrStan = mjesto.pbrMjesto
RIGHT JOIN zupanija ON mjesto.sifZupanija = zupanija.sifZupanija
WHERE LENGTH(mjesto.nazivMjesto) < 12
GROUP BY zupanija.sifZupanija, zupanija.nazivZupanija
HAVING brojRadnika < 5
ORDER BY brojRadnika ASC
LIMIT 10;
 
 
SELECT COUNT(klijent.sifKlijent) AS brojKlijenata, zupanija.nazivZupanija
FROM klijent
RIGHT JOIN mjesto ON klijent.pbrKlijent = mjesto.pbrMjesto
RIGHT JOIN zupanija ON mjesto.sifZupanija = zupanija.sifZupanija
WHERE SUBSTRING(mjesto.nazivMjesto, 3, 1) = 'i'
GROUP BY zupanija.sifZupanija, zupanija.nazivZupanija
HAVING brojKlijenata < 5
ORDER BY brojKlijenata DESC
LIMIT 5;

SELECT studenti.jmbag, studenti.ime, studenti.prezime, AVG(ocjene.ocjena) AS prosjekOcj
FROM studenti
JOIN mjesta ON mjesta.postbr = studenti.postBrPrebivanje
JOIN ocjene ON studenti.jmbag = jmbagStudent
WHERE mjesta.nazivMjesto = "Zagreb"
GROUP BY studenti.jmbag
LIMIT 5;

SELECT kolegiji.id, kolegiji.naziv, MIN(ocjene.ocjena) AS minOcjena
FROM kolegiji
JOIN ocjene ON ocjene.idKolegij = kolegiji.id
GROUP BY kolegiji.id, kolegiji.naziv
ORDER BY minOcjena ASC;

SELECT studenti.jmbag, studenti.ime, studenti.prezime, AVG(ocjene.ocjena) AS prosjekOcj
FROM studenti
JOIN ocjene ON ocjene.jmbagStudent = studenti.jmbag
JOIN kolegiji ON ocjene.idKolegij = kolegiji.id
JOIN smjerovi ON kolegiji.idSmjer = smjerovi.id
JOIN ustanove ON smjerovi.oibUstanova = ustanove.oib
WHERE ustanove.naziv = "Međimursko veleučilište u Čakovcu"
GROUP BY studenti.jmbag
ORDER BY prosjekOcj DESC
LIMIT 10;

SELECT kolegiji.id, kolegiji.naziv, MIN(ocjene.ocjena) AS minOcjena
FROM kolegiji
JOIN ocjene ON ocjene.idKolegij = kolegiji.id
GROUP BY kolegiji.id, kolegiji.naziv
ORDER BY kolegiji.naziv ASC;

SELECT zupanije.id, zupanije.nazivZupanija, COUNT(mjesta.postBr) AS brojGrad
FROM zupanije
JOIN mjesta ON mjesta.idZupanija = zupanije.id
GROUP BY zupanije.id, zupanije.nazivZupanija
ORDER BY zupanije.nazivZupanija ASC;

SELECT zupanija.sifZupanija, zupanija.nazivZupanija, SUM(nalog.OstvareniSatiRada) AS satiRada
FROM zupanija
JOIN mjesto ON zupanija.sifZupanija = mjesto.pbrMjesto
JOIN radnik ON mjesto.pbrMjesto = radnik.pbrStan
JOIN nalog ON radnik.sifRadnik = nalog.sifRadnik
GROUP BY zupanija.sifZupanija, zupanija.nazivZupanija
LIMIT 5;

SELECT odjel.sifOdjel, odjel.nazivOdjel, COUNT(sifRadnik)
FROM odjel
INNER JOIN radnik ON odjel.sifOdjel = radnik.sifOdjel
GROUP BY odjel.sifOdjel, odjel.nazivOdjel
ORDER BY odjel.nazivOdjel ASC LIMIT 10;

SELECT studenti.jmbag, studenti.ime, studenti.prezime, AVG(ocjene.ocjena) AS prosjekOcj
FROM studenti
JOIN ocjene ON ocjene.jmbagStudent = studenti.jmbag
GROUP BY studenti.jmbag
HAVING prosjekOcj >= 3.00 AND prosjekOcj <= 4.5
ORDER BY prosjekOcj ASC;

SELECT mjesto.* FROM mjesto
WHERE mjesto.pbrMjesto NOT IN (SELECT radnik.pbrStan FROM radnik);

SELECT studenti.* FROM studenti
JOIN ocjene ON studenti.jmbag = ocjene.jmbagStudent
WHERE ocjene.ocjena > (SELECT AVG(ocjene.ocjena) FROM ocjene);

SELECT radionica.* FROM radionica
WHERE kapacitetRadnika > 4 * (SELECT MAX(rezervacija.satServis) FROM rezervacija);

DELETE FROM nalog
WHERE sifKlijent IN (
    SELECT klijent.sifKlijent
    FROM klijent
    JOIN mjesto ON klijent.pbrKlijent = mjesto.pbrMjesto
    WHERE mjesto.nazivMjesto = 'Zagreb'
);

DELETE FROM izvrsitelji
WHERE jmbgNastavnik IN (
	SELECT nastavnici.jmbg FROM nastavnici
	WHERE nastavnici.ime LIKE "D%");
	
UPDATE nastavnici.titulaIspred
SET nastavnici.titulaIspred = "pred."
WHERE nastavnici.jmbg IN (
	SELECT nastavnici.jmbg FROM nastavnici
	JOIN izvrsitelji ON nastavnici.jmbg = izvrsitelji.jmbgNastavnik
	JOIN kolegiji ON izvrsitelji.idKolegij = kolegiji.id
	JOIN smjerovi ON kolegiji.idSmjer = smjerovi.id
	JOIN ustanove ON smjerovi.oibUstanova = ustanove.oib
	WHERE ustanove.naziv = "Tehničko Veleučilište u Zagrebu");
	
SELECT DISTINCT studenti.* FROM studenti
JOIN ocjene ON ocjene.jmbagStudent = studenti.jmbag
WHERE ocjene.ocjena = (
	SELECT MIN(ocjena) FROM ocjene);
	
SELECT studenti.* FROM studenti
JOIN ocjene ON ocjene.jmbagStudent = studenti.jmbag
WHERE ocjene.datumPolaganja = (
	SELECT MAX(datumPolaganja) FROM ocjene);
	
SELECT * FROM kvar
JOIN nalog ON kvar.sifKvar = nalog.sifKvar
WHERE datPrimitkaNalog = (
	SELECT MAX(datPrimitkaNalog) FROM nalog);

SELECT radnik.sifRadnik, radnik.imeRadnik, radnik.prezimeRadnik FROM radnik
JOIN nalog ON radnik.sifRadnik = nalog.sifRadnik
GROUP BY radnik.sifRadnik, radnik.imeRadnik, radnik.prezimeRadnik
HAVING AVG(OstvareniSatiRada) > (
	SELECT AVG(OstvareniSatiRada) FROM nalog);
	

SELECT * FROM studenti
WHERE jmbag IN (
    SELECT DISTINCT jmbagStudent
    FROM ocjene
    WHERE YEAR(datumPolaganja) = YEAR(CURDATE()) - 1
    GROUP BY jmbagStudent
    HAVING AVG(ocjena) BETWEEN (SELECT AVG(ocjena) * 0.8 FROM ocjene WHERE YEAR(datumPolaganja) = YEAR(CURDATE()) - 1) 
    AND (SELECT AVG(ocjena) * 1.2 FROM ocjene WHERE YEAR(datumPolaganja) = YEAR(CURDATE()) - 1)
);

SELECT *
FROM kolegiji
WHERE id IN (
    SELECT DISTINCT idKolegij FROM ocjene
    WHERE jmbagStudent IN (
        SELECT jmbag
        FROM studenti
        WHERE datumUpisa = (SELECT MIN(datumUpisa) FROM studenti)));

UPDATE studenti
SET idSmjer = 1
WHERE idSmjer IN (
    SELECT id
    FROM smjerovi
    JOIN ustanove ON smjerovi.oibUstanova = ustanove.oib
    WHERE ustanove.naziv = 'Tehničko Veleučilište u Zagrebu');

SELECT nazivKvar, satiKvar FROM kvar
WHERE satiKvar > ANY (SELECT satServis FROM rezervacija);

DELETE FROM nalog
WHERE sifKlijent IN (
SELECT sifKlijent FROM klijent
JOIN mjesto ON klijent.pbrKlijent = mjesto.pbrMjesto
WHERE nazivMjesto = 'Zagreb');

UPDATE studenti
SET ime = 'Ivana'
WHERE postBrStanovanja IN (
    SELECT postbr FROM mjesta
    JOIN zupanije ON mjesta.idZupanija = zupanije.id
    WHERE zupanije.nazivZupanija = 'Grad Zagreb');
    
UPDATE studenti
SET ime = 'Ivana'
WHERE postBrStanovanja IN (
    SELECT postbr
    FROM mjesta
    WHERE idZupanija IN (
        SELECT id
        FROM zupanije
        WHERE nazivZupanija = 'Grad Zagreb'
    )
);

SELECT * FROM radionica
WHERE kapacitetRadnika > 4 * (SELECT  MAX(satServis) FROM rezervacija);

SELECT * FROM studenti
WHERE jmbag IN (
    SELECT jmbagStudent
    FROM ocjene
    GROUP BY jmbagStudent
    HAVING AVG(ocjena) > (
        SELECT AVG(ocjena) FROM ocjene));

SELECT * FROM nastavnici
WHERE jmbg NOT IN (
SELECT jmbgNastavnik FROM izvrsitelji);

SELECT mjesta.*, 
    (SELECT COUNT(*) FROM studenti WHERE postBrStanovanja = mjesta.postbr) AS broj_studenata_stanuje,
    (SELECT COUNT(*) FROM studenti WHERE postBrPrebivanje = mjesta.postbr) AS broj_studenata_prebiva
FROM mjesta;

CREATE TABLE komentari(
	sifKomentar INT PRIMARY KEY AUTO_INCREMENT,
	naslovKomentar VARCHAR(100),
	komentar TEXT,
	sifKlijent INT,
	INDEX (naslovKomentar) USING BTREE,
	FOREIGN KEY (sifKlijent) REFERENCES klijent(sifKlijent)
);
DROP TABLE komentari;

CREATE TABLE podsmjerovi (
	idPodsmjer INT PRIMARY KEY AUTO_INCREMENT,
	naziv VARCHAR(100),
	opis TEXT,
	idSmjer INT,
	INDEX(naziv) USING BTREE,
	FOREIGN KEY(idSmjer) REFERENCES smjerovi(id)
);
DROP TABLE podsmjerovi;

CREATE TABLE osoblje (
	idOsoba INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	ime VARCHAR(100) NOT NULL,
	prezime VARCHAR(100) NOT NULL,
	opisPoslova TEXT NOT NULL,
	oibUstanova CHAR(11) CHARSET cp1250 COLLATE cp1250_croatian_ci NOT NULL,
	INDEX(ime, prezime) USING BTREE,
	FOREIGN KEY(oibUstanova) REFERENCES ustanove(oib)
);
DROP TABLE osoblje;

CREATE INDEX ix_ime_prezime ON radnik(imeRadnik, prezimeRadnik) USING BTREE;
DROP INDEX ix_ime_prezime ON radnik;

CREATE INDEX ix_prezime ON studenti(prezime) USING BTREE;
DROP INDEX ix_prezime ON studenti;

CREATE INDEX ix_naziv ON kolegiji(naziv) USING BTREE;
DROP INDEX ix_naziv ON kolegiji;

CREATE FULLTEXT INDEX ix_nazivKvar ON kvar(nazivKvar);
SELECT * FROM kvar WHERE MATCH(nazivKvar) AGAINST ('Zamjena' IN NATURAL LANGUAGE MODE);

CREATE FULLTEXT INDEX ix_opis ON kolegiji(opis);
SELECT kolegiji.*, MATCH(opis) AGAINST ('savladati' IN NATURAL LANGUAGE MODE) AS rang FROM kolegiji
HAVING rang > 0 ORDER BY rang DESC;

CREATE FULLTEXT INDEX ix_adresa ON nastavnici(adresa);
SELECT nastavnici.*, MATCH(adresa) AGAINST ('ulica' IN NATURAL LANGUAGE MODE) AS rang FROM nastavnici
HAVING rang > 0  ORDER BY rang DESC;

CREATE FULLTEXT INDEX ix_nastavnici_adresa ON nastavnici(adresa);
SELECT nastavnici.*, MATCH(adresa) 
AGAINST('ulica' IN NATURAL LANGUAGE MODE) AS rang
FROM nastavnici
HAVING rang>0
ORDER BY rang DESC;

CREATE TABLE knjige (
    id INT AUTO_INCREMENT PRIMARY KEY,
    isbn CHAR(13) NOT NULL,
    naziv VARCHAR(100),
    opis TEXT,
    brojStranica INT,
    koautori VARCHAR(100),
    jmbgNastavnik CHAR(13) CHARSET cp1250 COLLATE cp1250_croatian_ci,
    oibUstanovaIzdavanja CHAR(11)  CHARSET cp1250 COLLATE cp1250_croatian_ci,
    UNIQUE INDEX (isbn) USING BTREE,
    FOREIGN KEY (jmbgNastavnik) REFERENCES nastavnici(jmbg),
    FOREIGN KEY (oibUstanovaIzdavanja) REFERENCES ustanove(oib)
);

INSERT INTO knjige (isbn, naziv, opis, brojStranica, koautori, jmbgNastavnik, oibUstanovaIzdavanja)
VALUES ('9781234567897', 'Uvod u Baze Podataka', 'Minus bodovi za koristenje chatgpta u predmetu baze podataka', 350, 'Tin Kramberger, Davor Cafuta', '1234567890123', '23456789011');

SELECT * FROM knjige
WHERE MATCH(opis) AGAINST ('Cafuta i 7 obroka' IN NATURAL LANGUAGE MODE);

SELECT *, MATCH(opis) AGAINST ('Kako raditi što manje by Ivica Dodig' IN NATURAL LANGUAGE MODE) AS rang
FROM knjige
WHERE MATCH(opis) AGAINST ('Kako raditi što manje by Ivica Dodig' IN NATURAL LANGUAGE MODE)
ORDER BY rang DESC;

CREATE TABLE automobil (
    brSasije VARCHAR(17) PRIMARY KEY,
    marka VARCHAR(200),
    model VARCHAR(250),
    biljeske TEXT,
    godinaProizvodnje INT,
    registarskaOznaka VARCHAR(12),
    sifKlijent INT,
    FOREIGN KEY (sifKlijent) REFERENCES klijent(sifKlijent)
);
CREATE UNIQUE INDEX idx_registarskaOznaka ON automobil (registarskaOznaka);

CREATE TABLE ishodiUcenja (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ishod VARCHAR(250),
    idKolegij INT,
    razina INT,
    INDEX idx_ishod (ishod) USING BTREE,
    FOREIGN KEY (idKolegij) REFERENCES kolegiji(id)
) COLLATE=cp1250_croatian_ci;

CREATE FULLTEXT INDEX ftix_06 ON smjerovi(naziv);
SELECT * FROM smjerovi WHERE MATCH (naziv) AGAINST ('smjer' IN NATURAL LANGUAGE MODE);

CREATE TABLE vozilo (
    sifVozilo INT AUTO_INCREMENT PRIMARY KEY,
    brSasije CHAR(17),
    registracija VARCHAR(10),
    sifKlijent INT,
    UNIQUE INDEX ix_brSasije (brSasije),
    UNIQUE INDEX ix_registracija (registracija),
    FOREIGN KEY (sifKlijent) REFERENCES klijent(sifKlijent)
) COLLATE=cp1250_croatian_ci;

CREATE INDEX ix_10 ON smjerovi (naziv, oibUstanova) USING BTREE;

CREATE FULLTEXT INDEX ftix_03 ON klijent (imeKlijent, prezimeKlijent);
SELECT * FROM klijent WHERE MATCH(imeKlijent, prezimeKlijent) AGAINST('Horvat' IN NATURAL LANGUAGE MODE);

CREATE TABLE diplomirali (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ime VARCHAR(100),
    prezime VARCHAR(100),
    titula VARCHAR(10),
    posPriz VARCHAR(50),
    oibUstanove VARCHAR(11),
    INDEX idx_posPriz (posPriz) USING BTREE,
    FOREIGN KEY (oibUstanove) REFERENCES ustanove(oib)
) COLLATE=cp1250_croatian_ci;
DROP TABLE vozilo;

CREATE TABLE vozilo (
    sifVozilo INT AUTO_INCREMENT PRIMARY KEY,
    brSasije CHAR(17),
    registracija VARCHAR(10),
    sifKlijent INT,
    UNIQUE INDEX idx_brSasije (brSasije) USING BTREE,
    UNIQUE INDEX idx_registracija (registracija) USING BTREE,
    FOREIGN KEY (sifKlijent) REFERENCES klijent(sifKlijent)
) COLLATE=cp1250_croatian_ci;

CREATE FULLTEXT INDEX ftix_10 ON mjesta (nazivMjesto);
SELECT * FROM mjesta WHERE MATCH(nazivMjesto) AGAINST ('Sisak' IN NATURAL LANGUAGE MODE);
