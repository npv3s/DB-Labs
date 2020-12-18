# Первая часть
# 1. Выдать общее количество деталей P1, поставляемых поставщиком S3
select sum(qt) from spj
where snum = 3 and pnum = 1;
# 2. Выдать общий объем поставок деталей для изделия с максимальным объемом поставок.
select max(qt) from (select sum(qt) as qt from spj group by pnum) as sums;
# 3. Вывести информацию о поставщиках, которые осуществляли поставки деталей в указанный период.
select * from s where s.snum in
(select snum from spj where date between '2013-02-15' AND '2020-02-17');
# 4. Вывести информацию обо всех деталях, поставляемых для указанного изделия более чем одним поставщиком.
select * from p
where (select sum(distinct snum) from spj where spj.pnum = p.pnum and jnum = 1) > 1;
# 5. Выдать номера и названия изделий, для которых город является первым в алфавитном списке городов.
select jnum, jnam from j
where ci = min(select ci from j);
# 6. Выдать номера и названия изделий, для которых поставщик S1 поставляет несколько деталей.
select jnum, jnam from j
where ci = (select min(ci) from j);
# 7. Выдать номера и фамилии поставщиков, поставляющих детали для J3 изделия с деталью P1 в количестве, большем,
# чем средний объем поставок детали P1 для этого изделия.
select snum, snam from s
where snum in (select snum from spj
  where spj.pnum = 1
  and spj.jnum = 3
  and spj.qt > (select avg(qt) from spj where pnum = 1));
# 8. Выдать номера изделий, для которых средний объем поставки некоторой детали больше
# максимального объема поставки любой детали для указанного изделия (параметры - номер детали (P1), номер изделия (J1)).
select distinct pnum from spj
where (select avg(qt) from spj as spj2 where spj.pnum = spj2.pnum) > (select max(qt) from spj as spj3 where spj3.jnum = 1);

# Вторая часть
# 1. В таблице деталей сменить город, где изготавливается самая легкая деталь, на Париж.
update p set ci = 'Paris' where we = (select * from (select min(we) from p) as we);
# 2. В таблице деталей сменить название детали "Винт" на название детали с максимальным весом.
update p
set pnam = (select * from (select p2.pnam from p as p2 where p2.we = (select max(p3.we) from p as p3) limit 1) as pnam)
where pnam = 'screw';
# 3. Вставить в таблицу S нового поставщика с номером S10 с фамилией Уайт из города Нью-Йорк с неизвестным рейтингом.
insert into s (snum, snam, ci) values(10, 'White', 'New-York');
# 4. Изменить цвет красных деталей с весом менее 15 фунтов на желтый.
update p
set co = 'yellow'
where we < 15;
# 5. Перевести поставщика с минимальным рейтингом в город, где изготавливается самая тяжелая деталь.
update s
set ci = (select ci from (select ci, we from p order by we desc limit 1) as ci)
where st = (select * from (select min(st) from s) as st);
# 6. Увеличить на 10 рейтинг всех поставщиков, рейтинг которых в настоящее время меньше, чем рейтинг поставщика S3
update s
set st = `st` + 10
where st < (select * from (select st from s where snum = 3) as st);
# 7. Удалить все изделия, для которых нет поставок деталей
delete from j
where jnum not in (select distinct jnum from spj);
# 8. Удалить поставщика, выполнившего меньше всего поставок.
delete from j
where jnum = (select jnum from (select jnum, sum(qt) as qt from spj group by jnum order by qt limit 1) as jnum);
# 9. Удалить самую легкую деталь.
delete from p
where pnum = (select pnum from (select pnum, we from p order by we limit 1) as pnum);
