
CREATE TABLE Kasir (
                kasir_id INT NOT NULL,
                kasir_name VARCHAR(255) NOT NULL,
                password VARCHAR(100) NOT NULL,
                PRIMARY KEY (kasir_id)
);


CREATE TABLE Kategori (
                kotegori_id INT NOT NULL,
                kategori_name VARCHAR(255) NOT NULL,
                PRIMARY KEY (kotegori_id)
);


CREATE TABLE Produk (
                produke_kode INT NOT NULL,
                produke_name VARCHAR(255) NOT NULL,
                harga INT NOT NULL,
                kotegori_id INT NOT NULL,
                PRIMARY KEY (produke_kode)
);


CREATE TABLE Member (
                member_id INT NOT NULL,
                member_name VARCHAR(255) NOT NULL,
                PRIMARY KEY (member_id)
);


CREATE TABLE Penjualan (
                penjualan_id INT AUTO_INCREMENT NOT NULL,
                nota INT NOT NULL,
                tanggal DATE NOT NULL,
                kasir_id INT NOT NULL,
                member_id INT NOT NULL,
                PRIMARY KEY (penjualan_id)
);


CREATE TABLE Detail_penjualan (
                detail_penjualan_id INT AUTO_INCREMENT NOT NULL,
                total INT NOT NULL,
                penjualan_id INT NOT NULL,
                total_1 INT NOT NULL,
                produke_kode INT NOT NULL,
                PRIMARY KEY (detail_penjualan_id)
);


ALTER TABLE Penjualan ADD CONSTRAINT kasir_penjualan_fk
FOREIGN KEY (kasir_id)
REFERENCES Kasir (kasir_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Produk ADD CONSTRAINT kategori_produk_fk
FOREIGN KEY (kotegori_id)
REFERENCES Kategori (kotegori_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Detail_penjualan ADD CONSTRAINT produk_detail_penjualan_fk
FOREIGN KEY (produke_kode)
REFERENCES Produk (produke_kode)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Penjualan ADD CONSTRAINT member_penjualan_fk
FOREIGN KEY (member_id)
REFERENCES Member (member_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Detail_penjualan ADD CONSTRAINT penjualan_detail_penjualan_fk
FOREIGN KEY (penjualan_id)
REFERENCES Penjualan (penjualan_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
