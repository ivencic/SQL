CREATE TABLE ARTIST
(
name VARCHAR(255) NOT NULL,
lastname VARCHAR(255) NOT NULL,
amplua CHAR(1) check (amplua in ('c', 'd')),
primary key (NAME, LASTNAME)
);
CREATE TABLE ARTIST_2
(
name VARCHAR(255) NOT NULL,
lastname VARCHAR(255) NOT NULL,
amplua CHAR(1) check (amplua in ('c', 'd')),
primary key (NAME, LASTNAME),
unique (lastname)
);
describe ARTIST;
SHOW CREATE TABLE ARTIST;



CREATE TABLE goods (
id integer primary key,
title varchar(30),
quantity integer check (quantity > 0),
in_stock char(1) check (in_stock in ('Y', 'N'))
);

insert into goods (id, title, quantity, in_stock) values (1, 'Велосипед', 2,
'Y');
insert into goods (id, title, quantity, in_stock) values (2, 'Скейт', 4, 'Y');
insert into goods (id, title, quantity, in_stock) values (3, 'Самокат', 2, 'Y');
insert into goods (id, title, quantity, in_stock) values (4, 'Сноуборд', 7, 'N');
insert into goods (id, title, quantity, in_stock) values (5, 'Санки', 1, 'Y');
insert into goods (id, title, quantity, in_stock) values (6, 'Коньки', 3, 'N');
insert into goods (id, title, quantity, in_stock) values (7, 'Ролики', 5, 'Y');

select * from goods;

describe goods;
SHOW CREATE TABLE goods;

ALTER TABLE goods
ADD CONSTRAINT PRIMARY KEY(id, title);
ALTER TABLE goods
drop PRIMARY KEY;

ALTER TABLE goods
ADD CONSTRAINT constraint_title CHECK (title != "");
ALTER TABLE goods
drop check constraint_title;

ALTER TABLE goods
drop check `goods_chk_1`;

ALTER TABLE goods
ADD CONSTRAINT unique(title);
ALTER TABLE goods
drop index title;

-- запросы ALTER с предыдущего занятия
ALTER TABLE goods
MODIFY price NUMERIC(8, 2) NOT NULL;

ALTER TABLE goods
MODIFY price NUMERIC(8, 2);

ALTER TABLE goods
MODIFY price INT;

ALTER TABLE goods
CHANGE price price_new INT;

ALTER TABLE goods
DROP price_new;
