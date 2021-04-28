/*
NOT NULL - Bir Sütunun  NULL içermemesini garanti eder.
    UNIQUE - Bir sütundaki tüm deðerlerin BENZERSÝZ olmasýný garanti eder.
    PRIMARY KEY - Bir sütünün NULL içermemesini ve sütundaki verilerin
                  BENZERSÝZ olmasýný garanti eder.(NOT NULL ve UNIQUE birleþimi gibi)
    FOREIGN KEY - Baþka bir tablodaki Primary Key’i referans göstermek için kullanýlýr.
                  Böylelikle, tablolar arasýnda iliþki kurulmuþ olur.
    CHECK - Bir sutundaki tüm verilerin belirlenen özel bir þartý saðlamasýný garanti eder.
    DEFAULT - Herhangi bir deðer atanamadýðýnda Baþlangýç deðerinin atanmasýný saðlar.
    */
    
         CREATE TABLE calisanlar
(
          id CHAR(5) PRIMARY KEY,
          isim  VARCHAR2(50),
          maas NUMBER(5) NOT NULL,
          ise_baslama DATE
 );
 
          INSERT INTO calisanlar VALUES('10001','Ahmet Aslan',7000,'13-04-18');
          INSERT INTO calisanlar VALUES('10002','Mehmet    Yýlmaz',7000,'13-04-18');
          INSERT INTO calisanlar VALUES('10003',' ',7000,'13-04-18');
          INSERT INTO calisanlar VALUES('10004','Veli Han',7000,'13-04-18');
          INSERT INTO calisanlar VALUES('10005','Mustafa Ali',7000,'13-04-18');
          
          
          SELECT * FROM calisanlar;
          
          DROP TABLE calisanlar;
          DELETE calisanlar
          WHERE id = '10001';
          
          
          -------------------------------------------------------------------------------------
          
          
    CREATE TABLE calisanlar
(
          id CHAR(5),
          isim  VARCHAR2(50) UNIQUE,
          maas NUMBER(5) NOT NULL,
          ise_baslama DATE,
          CONSTRAINT id_pk PRIMARY KEY(id) 
 ); 
 
          INSERT INTO calisanlar VALUES('10001','Ahmet Aslan',7000,'13-04-18');
          INSERT INTO calisanlar VALUES('10002','Mehmet Yýlmaz',12000,'13-04-18');
          INSERT INTO calisanlar VALUES('10003','Can',5000,'13-04-18');
          
          
          
         CREATE TABLE adresler
          (
                adres_id CHAR(5),       --REFERENCES calisanlar(id),
                sokak VARCHAR2(50),
                cadde VARCHAR2(30),
                sehir VARCHAR2(15),
                CONSTRAINT id_fk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
          );
          
          INSERT INTO adresler VALUES ('10001','Mutlu Sok', '40.Cad.', 'IST');
          INSERT INTO adresler VALUES ('10002','Can Sok', '40.Cad.', 'Ankara');
          INSERT INTO adresler VALUES ('10003','Aga Sok', '30.Cad.', 'Antep');
          INSERT INTO adresler VALUES ('','Aga Sok', '30.Cad.', 'Antep');
          INSERT INTO adresler VALUES ('','Aga Sok', '30.Cad.', 'Antep');
          
          --Parent'ta olmayan bir id'ye child da ekleme yapilamaz
          --INSERT INTO adresler VALUES('10004', 'Gel Sok', '60.Cad.', 'Van');
          
          SELECT * FROM adresler;
          SELECT * FROM calisanlar;
          
          SELECT * FROM calisanlar, adresler
          WHERE id = '10001';
          
          DROP TABLE calisanlar;
          DROP TABLE adresler;
          
          CREATE TABLE sehirler(
                  alan_kodu NUMBER(3)DEFAULT 00,
                  isim VARCHAR2(20) DEFAULT 'noname',
                  nufus NUMBER(8) CHECK(nufus>0)
               );
               
          INSERT INTO sehirler VALUES(54, 'sakarya',1250000);
          INSERT INTO sehirler VALUES('', '',1250000);
          
          ---Parcali veri girisi
          INSERT INTO sehýrler(nufus) VALUES(5000000);
          INSERT INTO sehýrler(nufus) VALUES(-2000000);
          
          SELECT * FROM sehirler;
          
          DROP TABLE sehirler;
          
          
          
          
          
          
          
          
          
          
          