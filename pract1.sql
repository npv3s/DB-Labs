create database pract;
use pract;
# 1 Задание
create table first(
user_id int primary key auto_increment,
surname varchar(20),
name varchar(20),
age int,
weight real(4, 1),
height int);
# 2 Задание
insert into first (surname, name, age, weight, height) values
('Шахов',  'Олег',    28, 70.5, 184),
('Иванов', 'Олег',    32, 55.5, 180),
('Шахов',  'Аркадий', 27, 75.6, 192),
('Иванов', 'Аркадий', 19, 72.0, 154),
('Шахов',  'Иван',    22, 63.6, 184),
('Иванов', 'Иван',    33, 83.1, 165);
# 3 Задание
create table second like first;
insert into second select * from first where (age > 20) and (height > 180);
# 4 Задание
create table third like first;
alter table third drop column name;
insert into third (surname, age, weight, height)
select surname, age, weight, height from second;
# 5 Задание
update third set weight = round(weight/0.4, 1), height = floor(height/2.54);
# 6 Задание
delete from third where age < 20;
# 7 Задание
alter table third modify column surname varchar(20) default 'Синебрюхов';
# 8 Задание
insert into third (age) values(25), (30);
# 9 Задание
create table another_third like third;
insert into another_third select * from third;
# Итоговые таблицы
select * from first;
select * from second;
select * from third;
select * from another_third;
