--1
create database lab4;

--2
create table Warehouses(
    code int primary key,
    location varchar,
    capacity int
);

create table Boxes(
    code char(4) primary key,
    contents varchar,
    value int,
    warehouses int,
    foreign key(warehouses) references Warehouses(code)
);

--4
select * from warehouses;

--5
select * from boxes where value > 150;

--6
select distinct on (contents) * from boxes;

--7
select warehouses, count(warehouses) cnt from boxes
group by warehouses;

--8
select warehouses, count(warehouses) from boxes
group by warehouses
having count(warehouses) > 2;

--9
insert into Warehouses(code, location, capacity) VALUES(6, 'New York', 3);

--10
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('H5RT', 'Papers', 200, 2);

--11
update boxes
set value = value*0.85
where value = (select value from boxes order by value desc offset 2 limit 1);

--12
delete from boxes
where value < 150;

--13
select code from warehouses where location = 'New York';
delete from boxes where warehouses in (select code from warehouses where location = 'New York');