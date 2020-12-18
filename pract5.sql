# Выдать полную информацию о детали, имеющей максимальный вес
select * from p where pnum = (select max(pnum) from p);

# Выдать номера деталей, поставляемых каким-либо поставщиком из Лондона,
# для изделия, изготавливаемого также в Лондоне.
select pnum from spj
where snum in (select snum from s where ci like 'London%') and
      jnum in (select jnum from j where ci like 'London%');

# Выдать номера деталей, поставляемых для всех изделий из Лондона.
select distinct pnum from spj
where jnum in (select jnum from j where ci like 'London%');

# Выдать номера и фамилии поставщиков, поставляющих одну
# и ту же деталь для всех изделий.


# Используя оконные функции, провести сортировку по полю дата
# и подсчитать количество поставленных деталей.
