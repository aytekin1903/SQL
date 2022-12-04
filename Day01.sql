--DDl- DATA DEFINITION LANG.
--CREATE -TABLO OLUSTURMA
CREATE TABLE ogrenciler
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real, --ondalikli sayilari icin kullanilir
kayit_tarihi date	
);

--VAROLAN TABLODAN YENI BIR TABLO OLUSTURMA
CREATE TABLE ogrenci_notlari
AS -- Benzer tablodaki başlıklarla ve data tipleriyle yeni bir tablo oluşturmak için
--normal tablo oluştururken ki parantezler yerine AS kullanıp Select komutuyla almak istediğimiz verileri alırız
SELECT isim,soyisim,not_ort FROM ogrenciler;

--DML-DATA MANUPULATION LANG.
--INSERT 
INSERT INTO ogrenciler VALUES ('1234567','Sait','ILHAN',85.5,now());
INSERT INTO ogrenciler VALUES ('1234567','Sait','ILHAN',85.5,'2020-12-11');


--BIR TABLOYA PARCALI VERI EKLEMEK

INSERT INTO ogrenciler(isim,soyisim) VALUES ('Evren','Erol');

--DQL-DATA QUERY LANG.
--SELECT

SELECT * FROM ogrenciler;--burdaki * isareti her seyi ifade eder







