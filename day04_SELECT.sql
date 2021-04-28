
     CREATE TABLE ogrenciler
(
       id NUMBER(9),
       isim VARCHAR2(50),
       adres VARCHAR2(100),
       sinav_notu NUMBER(3) 
);

     INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Ankara',75);
     INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ankara',85);
     INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Istanbul',85);
     
     SELECT * FROM ogrencýler;
     --NOTU 80'DEN BUYUK OLANLAR
     SELECT * FROM ogrenciler
     WHERE sinav_notu>80;
     
     --notu 80'den buyuk olanlarin sadece isim ve not bilgileri
     SELECT isim,sýnav_notu
     FROM ogrenciler
     WHERE sinav_notu>80;
     
     SELECT * FROM ogrenciler
     WHERE adres = 'Ankara';
     
     SELECT * FROM ogrenciler
     WHERE ýd = 124;
     
     
     ------------------------------------------------------------------------------------------
     
     CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR2(50),
        maas NUMBER(5)
    );
    
    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES( '10002', 'Mehmet Yýlmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem ', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ayþe Can', 4000);
?
    SELECT * FROM personel;
   
   ------------------------------------------BETWEEN-------------------------------------------------
   
    -- id'si 10002 ile 10005 arasinda olan personel bilgilerini isteyelim
    
    SELECT * FROM personel
    WHERE id>='10002' AND id <='10005';
    
    SELECT id,isim,maas
    FROM personel
    WHERE id BETWEEN '10002' AND '10005'; --ALT VE ÜST LÝMÝTLER DAHÝLDÝR
    
    -- mehmet yýlmaz ile veli han arasýndaki personel bilgilerini listeleyelin
    
    SELECT * FROM personel
    WHERE isim BETWEEN 'Mehmet Yýlmaz' AND 'Veli Han';
    
    -- id'si 10002 ile 10004 arasinda olmayanlari listeyelim
    
    SELECT * FROM personel
    WHERE id NOT BETWEEN '10002' AND '10004';
    
    --------------------------------------- IN ------------------------------------------------------
    
    
    -- id'si 10001, 10002 VE 10004 olanlari listeyelim
    
    SELECT * FROM personel  
    WHERE id =  '10001' OR id= '10002' OR id= '10004';
    
    -- IN yöntemi ile
    SELECT * FROM personel
    WHERE id IN ('10001', '10002', '10004');
    
    --maasi 
    SELECT * FROM personel
    WHERE maas IN('7000','12000');
    
    
    ----------------------------------------------LIKE-------------------------------------------------
    
    SELECT * FROM personel
    WHERE isim LIKE 'M%';
    
    -- 2.harfi e olanlari listele
    SELECT * FROM personel
    WHERE isim LIKE '_e%';
    -- maas'inin son iki  hanesi 00 olan
    SELECT * FROM personel
    WHERE maas LIKE '%00';
    
    SELECT * FROM personel
    WHERE maas NOT LIKE '____';
    
   --  Daha karmaþýk pattern ile sorgulama iþlemi için REGEXP_LIKE kullanýlabilir. 
    --Syntax:
    --------
    --REGEXP_LIKE(sutun_adý, ‘pattern[] ’, ‘c’ ] )
    
    ------------------------------------------------------------------------------------------------------
    
    CREATE TABLE kelimeler
    (
        id NUMBER(10) UNIQUE,
        kelime VARCHAR2(50) NOT NULL,
        harf_sayisi NUMBER(6)
    );
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    
    SELECT * FROM kelimeler;
    
    -- icerinde 'hi' harfleri gecen kelimeleri sorgulayiniz
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'hi');
    
    -- icerisinde herhangi bir yerde 'h' veya 'i' bulunan kelimeler icin => []
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[hi]');
    
    -- icerisinde ot veya at harfleri olan kelimeleri sorgulayiniz
    -- veya islemi | karakteri ile yapilir.
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at', 'i');
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at');
    
    -- icerisinde hi veya ho harfleri olan kelimeleri sorgulayiniz
    -- veya islemi | karakteri ile yapilir.
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '^hi|^ho', 'i');
    
    -- t veya m ile biten kelimeleri Büyük - Kücük harf duyarsiz bir sekilde listeleyiniz
    -- bitis icin => $ isareti kullanilir
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 't$|m$', 'i');
    
    -- h ile baþlayýp t ile biten 3 harfli kelimeleri büyük-küçük harfe
    -- dikkat etmeksizin listeleyeniz
    -- - (tire) karakteti bir  aralik verir
    -- köseli parantez tek bir karakter gösterir
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'h[a-z0-9]t', 'i');
    
    --Ýlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli
    -- kelimelerin tüm bilgilerini sorgulayalým.
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'h[ai]t', 'i');
    
    -- icinde m, i veya e olan kelimelerin tüm bilgilerini listeleyiniz
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'h[mie](*)', 'i');
    
    -- içerisinde en az 2 adet oo barýdýran kelimelerin tüm bilgilerini listeleyiniz
    
    -- {2}
     
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'[a]{2}', 'i');
    

    
    
    
     
     
     
     
     
     
     
     
     
     
     