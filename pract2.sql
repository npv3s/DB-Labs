# Вывести фамилии  заглавными буквами, переименовав поле fam в familio.
select ucase(surname) as familio from first;
# Вывести фамилии  строчными буквами, переименовав поле fam в familio.
select lcase(surname) as familio from first;
# Вывести фамилии  с 3 символа (вставить с 1 позиции 3 пробела).
select insert(surname, 1, 3, '   ') as familio from first;
# Вывести фамилия  и количество символов в ней.
select surname, length(surname) as len from first;
# Вывести фамилию  3 раза в одном поле.
select repeat(surname, 3) as surname from first;
# В названиях имен заменить  длинное имя на короткое(1 имя).
select replace(name, 'Аркадий', 'Аркаша') as name from first;
# Написать фамилии  в обратном порядке.
select reverse(surname) as surname from first;
# Определить позицию буквы «Е» в строке «ПРИВЕТ ВСЕМ»
select position('Е' in 'ПРИВЕТ ВСЕМ') as 'position';
# Найти  |-20|.
select abs(-20);
# Найти остаток от деления 8 на 3
select mod(8, 3);
# Вычислить ./169
select sqrt(169);
# сколько имеется разных букв, с которых начинаются фамилии в таблице
select count(distinct left(name, 1)) as letters from first;
# 10;ФАМИЛИЯ;ИМЯ;возраст!вес/рост
select concat(10,';',surname,';',name,';',age,'!',weight/height) as str from first;
# b.	Фамилия Имя имеет рост.
select concat(surname,' ',name,' имеет ',height) as str from first;
# Вывести фамилии, имена и возраст, при этом значения возраста должны быть увеличены в 100 раз.
select concat(surname,' ',name,' возраст: ',age*100) as str from first;
# Добавить поле телефон и заполнить его.
create table first_copy like first;
alter table first_copy add column tel varchar(11) default '79531234567';
insert into first_copy (surname, name, age, weight, height)
select surname, name, age, weight, height from first;
# Вывести имя, телефон и количество символов в них.
select concat(name, ' (', length(name), ')') as name, concat(tel, ' (', length(tel), ')') as tel from first_copy;
# Вывести номер телефона в обратном порядке.
select reverse(tel) as tel from first_copy;
# Перевести каждую возрастную группу
# от 17 до 30 лет    молодежь
# от 30 до 55 лет    зрелые
# от 55                   пожилые
select age, case
when age > 16 and age < 31 then 'молодежь'
when age > 30 and age < 56 then 'взрослые'
when age > 55 then 'пожилые'
end as 'group' from first_copy;
# Добавить поле пол
# И откорректировать вывод
# Женщины от 55     пожилые
# Мужчины от 60    пожилые
alter table first_copy add column sex enum('М','Ж') default 'М';
select age, case
when age < 17 then 'дети'
when age > 16 and age < 31 then 'молодежь'
when age > 30 and ((age < 61 and sex = 'М') or (age < 56 and sex = 'Ж')) then 'взрослые'
else 'пожилые'
end as 'group' from first_copy;
