CREATE DATABASE QuanLyDiemThi;
USE QuanLyDiemThi;
CREATE TABLE HocSinh(
                        MaHS VARCHAR(20) PRIMARY KEY,
                        TenHS VARCHAR(50),
                        NgaySinh DATETIME,
                        Lop VARCHAR(20),
                        GT VARCHAR(20)
);
select * from HocSinh;