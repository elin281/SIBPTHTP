MariaDB [dbtoko]> create table member(
    -> id int primary key auto_increment,
    -> fullname varchar(30) not null,
    -> username varchar(30) not null unique,
    -> password varchar(30) not null,
    -> role enum('admin','manager','staff') not null,
    -> foto varchar(30));
Query OK, 0 rows affected (0.047 sec)

MariaDB [dbtoko]> desc member;
+----------+---------------------------------+------+-----+---------+----------------+
| Field    | Type                            | Null | Key | Default | Extra          |
+----------+---------------------------------+------+-----+---------+----------------+
| id       | int(11)                         | NO   | PRI | NULL    | auto_increment |
| fullname | varchar(30)                     | NO   |     | NULL    |                |
| username | varchar(30)                     | NO   | UNI | NULL    |                |
| password | varchar(30)                     | NO   |     | NULL    |                |
| role     | enum('admin','manager','staff') | NO   |     | NULL    |                |
| foto     | varchar(30)                     | YES  |     | NULL    |                |
+----------+---------------------------------+------+-----+---------+----------------+
6 rows in set (0.026 sec)

MariaDB [dbtoko]> insert into member(fullname, username, password, role, foto) values
    -> ('Admin','admin',SHA1(MD5('mimin')),'admin','admin.jpg'),
    -> ('Elin','elin',SHA1(MD5('elin')),'manager','manager.jpg'),
    -> ('Staff','staff',SHA1(MD5('staff')),'staff','staff.jpg');
Query OK, 3 rows affected, 3 warnings (0.005 sec)
Records: 3  Duplicates: 0  Warnings: 3

MariaDB [dbtoko]> select * from member;
+----+----------+----------+--------------------------------+---------+-------------+
| id | fullname | username | password                       | role    | foto        |
+----+----------+----------+--------------------------------+---------+-------------+
|  1 | Admin    | admin    | 67771da7cef164702710b6803ea0b0 | admin   | admin.jpg   |
|  2 | Elin     | elin     | 4969a05ae61e7f089031f6e0711102 | manager | manager.jpg |
|  3 | Staff    | staff    | 6a91eb6ae9cc8e3a67d32b286c56c3 | staff   | staff.jpg   |
+----+----------+----------+--------------------------------+---------+-------------+
3 rows in set (0.001 sec)

MariaDB [dbtoko]> insert into member (fullname, username, password, role) values
    -> ('Admin1','admin1',SHA1(MD5(SHA1('mimin1'))),'admin'),
    -> ('Manager','manager',SHA1(MD5(SHA1('manager'))),'manager'),
    -> ('Staff1','staff1',SHA1(MD5(SHA1('staff1'))),'staff');
Query OK, 3 rows affected (0.004 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> select * from member;
+----+----------+----------+------------------------------------------+---------+-------------+
| id | fullname | username | password                                 | role    | foto        |
+----+----------+----------+------------------------------------------+---------+-------------+
|  1 | Admin    | admin    | 67771da7cef164702710b6803ea0b0           | admin   | admin.jpg   |
|  2 | Elin     | elin     | 4969a05ae61e7f089031f6e0711102           | manager | manager.jpg |
|  3 | Staff    | staff    | 6a91eb6ae9cc8e3a67d32b286c56c3           | staff   | staff.jpg   |
|  4 | Admin1   | admin1   | d7b7b98c883dda0f9e721a8acc2ee94eb4fe9bec | admin   | NULL        |
|  5 | Manager  | manager  | 54dd75eddaa72e610b060ae82548b2430a4dfbdc | manager | NULL        |
|  6 | Staff1   | staff1   | d86efee451440c627f73c3b8b14f51a0cddae144 | staff   | NULL        |
+----+----------+----------+------------------------------------------+---------+-------------+
6 rows in set (0.001 sec)