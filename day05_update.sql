
/* ============================== UPDATE SET ============================    
    
 Ýlk olarak aþaðýdaki gibi tedarikciler adýnda bir tablo oluþturunu ve 
   vergi_no sutununu primary key yapýnýz.Ayýra aþðýdaki verileri tabloya giriniz.
    vergi_no NUMBER(3),
    firma_ismi VARCHAR2(50),
    irtibat_ismi VARCHAR2(50),
        
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
    INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
    INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
        
    Sonrasýnda aþaðýdaki gibi urunler adýnda bir baþka tablo oluþturunuz ve bu
    tablonun ted_vergino sutunu ile tedarikciler tablosunun vergi_no sutunu
    ile iliþkilendiriniz kurunuz. Verileri giriniz.
    ted_vergino NUMBER(3), 
    urun_id NUMBER(11), 
    urun_isim VARCHAR2(50), 
    musteri_isim VARCHAR2(50),
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayþe Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yýlmaz');
    
========================================================================*/

    CREATE TABLE  tedarikciler 
    (
    vergi_no NUMBER(3),
    firma_ismi VARCHAR2(50),
    irtibat_ismi VARCHAR2(50),
    CONSTRAINT pk_ted PRIMARY KEY (vergi_no)
);
    
    INSERT INTO tedarikciler VALUES (101, 'IBM','Kim Yon');
    INSERT INTO tedarikciler VALUES (102, 'Huawei','Çin Li');
    INSERT INTO tedarikciler VALUES (103, 'Erikson','Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple','Adam Eve');
    
    SELECT * FROM tedarýkcýler;
    
    
    CREATE TABLE urunler 
    (
    ted_vergino NUMBER(3), 
    urun_id NUMBER(11), 
    urun_isim VARCHAR2(50), 
    musteri_isim VARCHAR2(50),
    CONSTRAINT fk_urunler  FOREIGN KEY (ted_vergino) REFERENCES tedarikciler(vergi_no)
);

    INSERT INTO urunler VALUES(101, 1001,'Laptop','Ayþe Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone','Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV','Ramazan Öz');
    INSERT INTO urunler VALUES(102, 1004,'Laptop','Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone','Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV','Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone','Aslan Yýlmaz');
    
    SELECT * FROM tedarýkcýler;
    SELECT * FROM urunler;
    
    -- SYNTAX
    ----------------
    -- UPDATE tablo_adi
    -- SET sutun_adi = yeni_deger
    -- WHERE sutun adi ;
    
    -----------------------------------------------------------------------------
  -- ORNEK1: vergi_no’su 101 olan tedarikcinin ismini ‘LG’ olarak güncelleyiniz

    -----------------------------------------------------------------------------
    
    UPDATE tedarikciler
    SET firma_ismi = 'LG'
    WHERE vergý_no = 101;
    
    SELECT * FROM tedarýkcýler;
    SELECT * FROM urunler;
    
    -- ornek 2: tedarikciler tablosundaki tüm firma isimlerini
    -- 'SAMSUNG' olarak güncelle
    
    UPDATE tedarikciler
    SET firma_ismi = 'SAMSUNG';
    
    DELETE FROM tedarikciler; -- DROP TABLE tabloyu siler
    
    --ORNEK2: ismi huawai olan tedarikcinin irtibat_ismini
    -- 'Ali Veli' olarak güncelleyiniz
    
    UPDATE tedarikciler
    SET firma_ismi = 'Samsung', irtibat_ismi = 'Ali Veli'
    WHERE vergi_no= 102;
    
    --ORNEK3: firma ismi samsung olan tedarikcinin irtibat_ismini
    -- 'Ayþe Yýlmaz' olarak güncelleyiniz
    
    UPDATE tedarikciler
    SET irtibat_ýsmý = 'Ayse Yilmaz'
    WHERE fýrma_ýsmý = 'Samsung';
    
    --ORNEK4: urunler tablosundaki ‘Phone’ deðerlerini Telefon olarak güncelleyiniz.
    
    UPDATE urunler
    SET urun_ýsým = 'Telefon'
    WHERE urun_ýsým = 'Phone';
    
    --ORNEK5: urunler tablosundaki urun_id degeri 1004'ten büyük  olanlarin
    -- urun_id degerlerini bir arttýrýnýz
    
    UPDATE urunler
    SET urun_id = urun_id+1
    WHERE urun_ýd>1004;
    
    --ORNEK: urun tablosundaki tüm ürünlerin urun_id degerini ted_vergino
    -- surun degerleri ile toplayarak güncelleyiniz
    
    UPDATE urunler
    SET urun_id = urun_id + ted_vergino;
    
   SELECT * FROM urunler;
   SELECT * FROM tedarikciler;
   
   -- ORNEK6: urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci
   -- tablosunda irtibat_ismi ‘Adam Eve’ olan firmanýn ismi (firma_ismi) ile
   -- degistiriniz
   
   UPDATE urunler
   SET urun_isim = (SELECT firma_ismi FROM tedarikciler
                             WHERE irtibat_ismi = 'Adam Eve')
   WHERE musteri_isim = 'Ali Bak';
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    