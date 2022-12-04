CREATE TABLE ogrenciler3
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO ogrenciler3 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler3 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler3 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler3 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Ali', 99);
select * from ogrenciler3
-- İsmi Mustafa Bak ve Nesibe Yılmaz olan kayıtları silelim
DELETE FROM ogrenciler3 WHERE isim='Mustafa Bak' or isim = 'Nesibe Yilmaz';
-- Veli ismi Hasan datayi silelim
DELETE FROM ogrenciler3 WHERE veli_isim='Hasan';
-- TRUNCATE --
-- Bir tablodaki tüm verileri geri alamayacağımız şekilde siler. Şartlı silme yapmaz
TRUNCATE ogrenciler3
-- ON DELETE CASCADE
DROP TABLE if exists adresler -- Eğer tablo varsa tabloyu siler
INSERT INTO talebe VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebe VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO not1 VALUES ('123','kimya',75);
INSERT INTO not1 VALUES ('124', 'fizik',65);
INSERT INTO not1 VALUES ('125', 'tarih',90);
INSERT INTO not1 VALUES ('126', 'Matematik',90);
select * from talebeler2;
select * from notlar2;
-- Notlar tablosundan talebe_id'si 123 olan datayı silelim
DELETE FROM notlar WHERE talebe_id='123';
-- Talebeler tablosundan id'si 126 olan datayı silelim
DELETE FROM talebeler2 WHERE id='126';
CREATE TABLE talebe
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
CREATE TABLE not1(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebe(id)
on delete cascade
);
INSERT INTO talebe VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebe VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO not1 VALUES ('123','kimya',75);
INSERT INTO not1 VALUES ('124', 'fizik',65);
INSERT INTO not1 VALUES ('125', 'tarih',90);
INSERT INTO not1 VALUES ('126', 'Matematik',90);

select * from talebe
select * from not1

-- Talebeler tablosundan id'si 126 olan datayı silelim
DELETE FROM talebe WHERE id='126'

/*
    Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE silme özelliği ile
parent tablo dan da veri silebiliriz. Yanlız ON DELETE CASCADE komutu kullanımında parent tablodan sildiğimiz
data child tablo dan da silinir
*/



--IN CONDITION

DROP TABLE if exists musteriler

CREATE TABLE musteriler (
urun_id int,
musteri_isim varchar(50), urun_isim varchar(50)
);

INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');  
INSERT INTO musteriler VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler VALUES (40, 'John', 'Apricot'); 
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

SELECT * FROM musteriler


--MUSTERILER TABLOSUNDAN URUN ISMI 'ORANGE APPLE VEYA APRICOT' OLAN TUM VERILERI LISTELEYINIZ

SELECT * FROM musteriler WHERE URUN_ISIM= 'Orange' OR URUN_ISIM= 'Apple' OR URUN_ISIM= 'Apricot';


SELECT * FROM musteriler WHERE URUN_ISIM IN('Orange','Apple','Apricot'); --IN CONDITION


--NOT IN YAZDIGIMIZ VERILERIN DISINDAKILERI GETIRIR.

SELECT * FROM musteriler WHERE URUN_ISIM NOT IN ('Orange','Apple','Apricot');  --NOT IN



--BETWEEN CONDITION

--MUSTERILER TABLOSUNDAN ID SI 20 ILE 40 OLAN VERILERI LISTELEYINIZ

SELECT * FROM musteriler WHERE urun_id>=20 AND urun_id<=40; --BETWEEN olmadan


SELECT * FROM musteriler WHERE urun_id between 20 and 40;   --BETWEEN

SELECT * FROM musteriler WHERE urun_id not between 20 and 40; --not between




--SUBQUERIES

CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', null, 'Vakko');



CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

SELECT * FROM calisanlar2
SELECT * FROM markalar

-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve 
--bu markada calisanlarin isimlerini ve maaşlarini listeleyin.

SELECT isim,maas,isyeri FROM calisanlar2

 WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE calisan_sayisi>15000 );
 
 --SORU Çalisan sayisi 15.000’den cok olan markalarin isimlerini
--ve bu markada calisanlarin isimlerini ve maaşlarini listeleyin.

SELECT isim,maas,isyeri FROM calisanlar2
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE calisan_sayisi>15000)


--SORU marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.

SELECT isim,maas,sehir FROM calisanlar2
WHERE isyeri IN (SELECT marka_isim FROM markalar Where marka_id>101);



-- AGGREGATE METHOD
-- Calisanlar toplasundan maksimum maası listeleyelim
SELECT max(maas) AS maksimum_maas FROM calisanlar2;
SELECT max(maas) FROM calisanlar2;

/*
    Eğer bir sutuna geçici olarak bir isim vermek istersek AS komutunu yazdıktan sonra
vermek istediğimiz ismi yazarız
*/

-- calisanlar tablosundaki minumum maasi listeleyelim

SELECT min(maas) AS maksimum_maas FROM calisanlar2;
SELECT min(maas)  FROM calisanlar2;

---- calisanlar tablosundaki  maasilarin toplamini listeleyelim
SELECT sum(maas)  FROM calisanlar2;


---- calisanlar tablosundaki  maasilarin ortalamasini listeleyelim

SELECT avg(maas)  FROM calisanlar2;

SELECT round(avg(maas) ) FROM calisanlar2;

SELECT round(avg(maas),2 ) FROM calisanlar2;

---- calisanlar tablosundaki  maasilarin ortalamasini listeleyelim

SELECT count(maas)  FROM calisanlar2;--14
SELECT count(*)  FROM calisanlar2;--15(null oldugu icin)

SELECT * FROM calisanlar2

/*
Eğer count(*) kullanırsak tablodaki tüm satırların sayısını verir
Sutun adı kullanırsak o sutundaki sayıları verir
*/

-- AGGREGATE METHODLARINDA SUNQUERY
-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz

select marka_id,marka_isim,
(select count(sehir)as sehir_sayisi from calisanlar2 where marka_isim=isyeri ) 
from markalar; 

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz

select marka_isim,calisan_sayisi,
(select sum(maas) from calisanlar2 where isyeri=marka_isim)as toplam_maas
from markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
-- maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
select marka_isim,calisan_sayisi,
(select max(maas)from calisanlar2 where isyeri=marka_isim)as enyuksekmaas,
(select min(maas)from calisanlar2 where isyeri=marka_isim)as endusukmaas
from markalar

--VIEW kullanimi : Yaptigimiz sorgulari hafizaya alir. 
--Ve tekrar bizden istenen sorgulama yerine 'view' atadigimiz ismi 'select' komutuyla cagiririz

CREATE view maxminmaas
as
select marka_isim,calisan_sayisi,
(select max(maas)from calisanlar2 where isyeri=marka_isim)as enyuksekmaas,
(select min(maas)from calisanlar2 where isyeri=marka_isim)as endusukmaas
from markalar

Select * from maxminmaas;


CREATE view summaas
as
select marka_isim,calisan_sayisi,
(select sum(maas) from calisanlar2 where isyeri=marka_isim)as toplam_maas
from markalar;

Select * from summaas;


-- 							EXISTS CONDITION
/*
EXISTS Condition subquery’ler ile kullanilir. IN ifadesinin kullanımına benzer
olarak, EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen değerlerin içerisinde
bir değerin olması veya olmaması durumunda işlem yapılmasını sağlar
*/


CREATE TABLE mart
(   
urun_id int,    
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');



CREATE TABLE nisan 
(   
urun_id int ,
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

Select * from mart
Select * from nisan 

/*
	MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
	URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
	MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
 */
 
 Select urun_id,musteri_isim from mart
where exists (select urun_id from nisan where mart.urun_id=nisan.urun_id)

/*
Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
*/

Select urun_isim,musteri_isim from nisan
where exists (select urun_isim from mart where mart.urun_isim=nisan.urun_isim);


/* odev
Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve  bu ürünleri
 NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
*/



--              (UPDATESET)  DML
--        Tablodaki Data Nasil Update Edilir 
CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

CREATE TABLE urunler1 -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
on delete cascade
);    
INSERT INTO urunler1 VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler1 VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler1 VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler1 VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler1 VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler1 VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler1 VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

Select * from tedarikciler
Select * from urunler1

--  vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.

/*
update tablo_adi
set sutun_ismi = 'istenen veri' where  sutun_ismi= 'istenen veri'

*/
update tedarikciler
set firma_ismi ='Vestel' where vergi_no=102;


-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.

update tedarikciler
set firma_ismi='Cesper',irtibat_ismi='Ali Veli' where vergi_no=101;


-- urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.

update urunler1
set urun_isim ='Telefon ' where urun_isim='Phone'


-- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.

update urunler1
set urun_id = urun_id+1 where urun_id>1004;

-- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
UPDATE urunler1
SET urun_id = urun_id+1 WHERE urun_id>1004;


-- urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino 
--sutun değerleri ile toplayarak güncelleyiniz.
UPDATE urunler 
SET urun_id = urun_id + ted_vergino;

delete from urunler1
delete from tedarikciler

Select * from tedarikciler
Select * from urunler1

-- urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi
-- 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.

UPDATE urunler1
SET urun_isim = (select firma_ismi from tedarikciler WHERE irtibat_ismi = 'Adam Eve')
WHERE musteri_isim='Ali Bak';

-- Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin.
UPDATE urunler1
SET musteri_isim = (select irtibat_ismi from tedarikciler WHERE firma_ismi = 'Apple')
WHERE urun_isim = 'Laptop';








