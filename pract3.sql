# Выдать полную информацию о поставщиках.
select * from s;
# Выдать таблицу S в следующем порядке: фамилия, город, рейтинг, номер поставщика.
select snam, ci, st, snum from s;
# Выдать номера всех поставляемых деталей.(использовать таблицу spj)
select pnum from spj;
# Выдать номера всех поставляемых деталей, исключая дублирование.
select distinct pnum from spj;
# Выдать номера всех поставщиков, находящихся в Париже с рейтингом >20.
select * from s where ci = 'Paris' and st > 20;
# Выдать номера поставщиков, находящихся в Париже в порядке убывания рейтинга.
select * from s where ci = 'Paris' order by st desc;
# Выдать список поставщиков, упорядоченных по городу, в пределах города - по рейтингу.
select * from s order by ci, st;
# Выдать детали, вес которых равен 12, 16 или 17.
select * from p where we in (12, 16, 17);
# Выбрать список деталей, начинающихся с буквы "Б"
select * from p where pnam like 'b%';
# Выдать общее количество поставщиков.
select count(*) from s;
# Выдать общее количество поставщиков, поставляющих в настоящее время детали.
select count(distinct snum) from spj;
# Выдать количество поставок для детали P2.
select count(*) from spj where pnum = 2;
# Выдать общее количество поставляемых деталей 'P2'.
select sum(qt) from spj where pnum = 2;
# Выдать средний, минимальный и максимальный объем поставок для поставщика S1 с соответствующим заголовком.
select min(qt) as min, avg(qt) as avg, max(qt) as max from spj where snum = 1;
