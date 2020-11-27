# Создаем простую таблицу
create table small(first int PRIMARY KEY AUTO_INCREMENT, second varchar(20));
# Получается
+--------+-------------+------+-----+---------+----------------+
| Field  | Type        | Null | Key | Default | Extra          |
+--------+-------------+------+-----+---------+----------------+
| first  | int         | NO   | PRI | NULL    | auto_increment |
| second | varchar(20) | YES  |     | NULL    |                |
+--------+-------------+------+-----+---------+----------------+

# Добавляем ручками, проверяя что всё работает
insert into small values(0, 'Archi');
# Получается
+-------+--------+
| first | second |
+-------+--------+
|     1 | Archi  |
+-------+--------+

# Создаем file1 следующего содержания
2 Mike
3 John
# Разделитель - табуляция. Нажимаем tab между значениями
# Это можно загрузить в БД командой
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/file1' into table small;

# Создаем file2 следующего содержания
4,Arkadiy
5,Viktor
# Разделитель - запятая.
# Это можно загрузить в БД командой
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/file2' into table small fields terminated by ',';

# Создаем file3 следующего содержания
6
7
# Тут только первая колонка (first)
# Это можно загрузить в БД командой
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/file3.tsv' into table small (first);

# Итого
first | second
------|-------
1 | Archi
2 | Mike
3 | John
4 | Arkadiy
5 | Viktor
6 | NULL
7 | NULL
