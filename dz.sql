use pract;
create table s(id integer primary key auto_increment,
	       name varchar(20), status int, city_s varchar(20));
create table p(id integer primary key auto_increment,
	       title varchar(20), type varchar(20), weight int, city_p varchar(20));
create table sp(s_id integer, p_id integer, amount int);

insert into s values(1, 'Сергей', 20, 'Москва'),
								    (2, 'Иван', 10, 'Киев'),
								    (3, 'Борис', 30, 'Киев'),
								    (4, 'Николай', 20, 'Москва'),
								    (5, 'Андрей', 30, 'Минск');

insert into p values(1, 'гайка', 'каленый', 12, 'Москва'),
								    (2, 'болт', 'мягкий', 17, 'Киев'),
								    (3, 'винт', 'твердый', 17, 'Ростов'),
								    (4, 'винт', 'каленый', 14, 'Москва'),
								    (5, 'палец', 'твердый', 12, 'Киев'),
								    (6, 'шпилька', 'каленый', 19, 'Москва');

insert into sp values(1, 1, 300),
								     (1, 2, 200),
								     (1, 3, 400),
								     (1, 4, 200),
								     (1, 5, 100),
								     (1, 6, 100),
								     (2, 1, 300),
								     (2, 2, 400),
								     (3, 2, 200),
								     (4, 2, 200),
								     (4, 4, 300);

select * from s join p where city_s > city_p;
select s.id, name, status, city_s as city, p.id, type, weight from s join p on city_p = city_s;
