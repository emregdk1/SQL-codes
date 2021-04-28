
/* ============================== UPDATE SET ============================    
    
 �lk olarak a�a��daki gibi tedarikciler ad�nda bir tablo olu�turunu ve 
   vergi_no sutununu primary key yap�n�z.Ay�ra a���daki verileri tabloya giriniz.
    vergi_no NUMBER(3),
    firma_ismi VARCHAR2(50),
    irtibat_ismi VARCHAR2(50),
        
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
    INSERT INTO tedarikciler VALUES (102, 'Huawei', '�in Li');
    INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
        
    Sonras�nda a�a��daki gibi urunler ad�nda bir ba�ka tablo olu�turunuz ve bu
    tablonun ted_vergino sutunu ile tedarikciler tablosunun vergi_no sutunu
    ile ili�kilendiriniz kurunuz. Verileri giriniz.
    ted_vergino NUMBER(3), 
    urun_id NUMBER(11), 
    urun_isim VARCHAR2(50), 
    musteri_isim VARCHAR2(50),
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ay�e Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan �z');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Y�lmaz');
    
========================================================================*/

    CREATE TABLE  tedarikciler 
    (
    vergi_no NUMBER(3),
    firma_ismi VARCHAR2(50),
    irtibat_ismi VARCHAR2(50),
    CONSTRAINT pk_ted PRIMARY KEY (vergi_no)
);
    
    INSERT INTO tedarikciler VALUES (101, 'IBM','Kim Yon');
    INSERT INTO tedarikciler VALUES (102, 'Huawei','�in Li');
    INSERT INTO tedarikciler VALUES (103, 'Erikson','Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple','Adam Eve');
    
    SELECT * FROM tedar�kc�ler;
    
    
    CREATE TABLE urunler 
    (
    ted_vergino NUMBER(3), 
    urun_id NUMBER(11), 
    urun_isim VARCHAR2(50), 
    musteri_isim VARCHAR2(50),
    CONSTRAINT fk_urunler  FOREIGN KEY (ted_vergino) REFERENCES tedarikciler(vergi_no)
);

    INSERT INTO urunler VALUES(101, 1001,'Laptop','Ay�e Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone','Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV','Ramazan �z');
    INSERT INTO urunler VALUES(102, 1004,'Laptop','Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone','Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV','Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone','Aslan Y�lmaz');
    
    SELECT * FROM tedar�kc�ler;
    SELECT * FROM urunler;
    
    -- SYNTAX
    ----------------
    -- UPDATE tablo_adi
    -- SET sutun_adi = yeni_deger
    -- WHERE sutun adi ;
    
    -----------------------------------------------------------------------------
  -- ORNEK1: vergi_no�su 101 olan tedarikcinin ismini �LG� olarak g�ncelleyiniz

    -----------------------------------------------------------------------------
    
    UPDATE tedarikciler
    SET firma_ismi = 'LG'
    WHERE verg�_no = 101;
    
    SELECT * FROM tedar�kc�ler;
    SELECT * FROM urunler;
    
    -- ornek 2: tedarikciler tablosundaki t�m firma isimlerini
    -- 'SAMSUNG' olarak g�ncelle
    
    UPDATE tedarikciler
    SET firma_ismi = 'SAMSUNG';
    
    DELETE FROM tedarikciler; -- DROP TABLE tabloyu siler
    
    --ORNEK2: ismi huawai olan tedarikcinin irtibat_ismini
    -- 'Ali Veli' olarak g�ncelleyiniz
    
    UPDATE tedarikciler
    SET firma_ismi = 'Samsung', irtibat_ismi = 'Ali Veli'
    WHERE vergi_no= 102;
    
    --ORNEK3: firma ismi samsung olan tedarikcinin irtibat_ismini
    -- 'Ay�e Y�lmaz' olarak g�ncelleyiniz
    
    UPDATE tedarikciler
    SET irtibat_�sm� = 'Ayse Yilmaz'
    WHERE f�rma_�sm� = 'Samsung';
    
    --ORNEK4: urunler tablosundaki �Phone� de�erlerini Telefon olarak g�ncelleyiniz.
    
    UPDATE urunler
    SET urun_�s�m = 'Telefon'
    WHERE urun_�s�m = 'Phone';
    
    --ORNEK5: urunler tablosundaki urun_id degeri 1004'ten b�y�k  olanlarin
    -- urun_id degerlerini bir artt�r�n�z
    
    UPDATE urunler
    SET urun_id = urun_id+1
    WHERE urun_�d>1004;
    
    --ORNEK: urun tablosundaki t�m �r�nlerin urun_id degerini ted_vergino
    -- surun degerleri ile toplayarak g�ncelleyiniz
    
    UPDATE urunler
    SET urun_id = urun_id + ted_vergino;
    
   SELECT * FROM urunler;
   SELECT * FROM tedarikciler;
   
   -- ORNEK6: urunler tablosundan Ali Bak�in aldigi urunun ismini, tedarikci
   -- tablosunda irtibat_ismi �Adam Eve� olan firman�n ismi (firma_ismi) ile
   -- degistiriniz
   
   UPDATE urunler
   SET urun_isim = (SELECT firma_ismi FROM tedarikciler
                             WHERE irtibat_ismi = 'Adam Eve')
   WHERE musteri_isim = 'Ali Bak';
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    