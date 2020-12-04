use pract;
# Создание таблиц
create table tab1(
   p1 varchar(1),
   p2 varchar(1),
   p3 int);

create table tab2(
   p2 varchar(1),
   p4 varchar(1));

insert into tab1 values('a', 'x', 400),
                       ('b', 'x', 200),
                       ('c', 'y', 500),
                       ('d', null, null);

insert into tab2 values('x', 1),
                       ('y', 2),
                       ('z', 2),
                       (null, null);

# JOIN
select tab1.p1, tab1.p2, tab1.p3, tab2.p4 from tab1
left join tab2 on tab1.p2 = tab2.p2;

select tab1.p1, tab1.p2, tab1.p3, tab2.p4 from tab1
left join tab2 on tab1.p2 = tab2.p2
where tab2.p2 is null;

select tab1.p1, tab1.p2, tab1.p3, tab2.p4 from tab1
right join tab2 on tab1.p2 = tab2.p2;

select tab1.p1, tab1.p2, tab1.p3, tab2.p4 from tab1
right join tab2 on tab1.p2 = tab2.p2
where tab1.p2 is null;

select tab1.p1, tab1.p2, tab1.p3, tab2.p4 from tab1
inner join tab2 on tab1.p2 = tab2.p2;

# UNION
select p2 from tab1
union
select p2 from tab2;

select p2 from tab1
union all
select p2 from tab2;

select p2 from tab1
where p2 is not null
union
select p2 from tab2
where p2 is not null;
