create database QuanLyBanHang;
use QuanLyBanHang;
drop database QuanLyBanHang;
create table Customer(
                         cID int auto_increment primary key ,
                         cName varchar(50),
                         cAge int
);

create table Oder(
                     oID int auto_increment primary key ,
                     cID int,
                     oDate date,
                     oTotalPrice double,
                     foreign key (cID) references customer(cID)
);

create table Product(
                        pID int auto_increment primary key ,
                        pName varchar(50),
                        pPrice int
);

create table OrderDetail(
                            oID int,
                            pID int auto_increment,
                            odQTY int,
                            primary key (oID,pID),
                            foreign key(oID)references oder(oID),
                            foreign key (pID)references product(pID)
);

insert into Customer values (1,'Minh Quan',10);
insert into Customer values (2,'Ngoc Oanh',20);
insert into Customer values (3,'Hong Ha',50);

insert into Oder values (1,1,'2006/3/21',null);
insert into Oder values (2,2,'2006/3/23',null);
insert into Oder values (3,1,'2006/3/16',null);


insert into Product values (1,'May Giat',3);
insert into Product values (2,'Tu Lanh',5);
insert into Product values (3,'Dieu Hoa',7);
insert into Product values (4,'Quat',1);
insert into Product values (5,'Bep Dien',2);


insert into OrderDetail values (1,1,3), (1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);
#hien thi cac thong tin oID,oDate,oTotalPrice
select oID,oDate,oTotalPrice from Oder;
#hien thi ds khach hang da mua hang,ds san pham duoc mua boi khach hang
select cID,cName from Customer;
select pID,pName from Product where pID=1 or pID=3 or pID=4 or pID=5;
#ds khach hang khong mua san pham nao
select cName,cID from Customer where cID=3;
#hien thi ma hoa don,ngay ban,gia tien cua tung hoa don
select oID,oDate from Oder;
select Oder.oID,oDate from Oder join OrderDetail o on Oder.oID = o.oID join product p on o.pID = p.pID;
select * from Oder join OrderDetail o on Oder.oID = o.oID join product p on o.pID = p.pID;
select Oder.oID,pName,pPrice*odQTY from Oder join OrderDetail o on Oder.oID = o.oID join product p on o.pID = p.pID;
select Oder.oID,oDate,sum(pPrice*odQTY) from Oder join OrderDetail o on Oder.oID = o.oID join product p on o.pID = p.pID group by Oder.oID;

