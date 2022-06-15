--SQL_DDL
--Первая часть.
--Таблица employees
--1) Создать таблицу employees
-- id. serial,  primary key,
-- employee_name. Varchar(50), not null
create table employees (
id serial primary key,
employee_name Varchar(50) not null
);

--2) Наполнить таблицу employee 70 строками.
insert into employees (employee_name)
values
('Dylan Ashton Perry'),
('Patrick Isaac Robinson'),
('Joseph Brian Martin'),
('Sean Evan Richardson'),
('Owen Wyatt Bailey'),
('Mason Sean Griffin'),
('Jesus Devin Powell'),
('Adrian Jose Morris'),
('Angel Connor Rivera'),
('Seth Carter Coleman'),
('Elijah Kyle Diaz'),
('Aiden Aiden Howard'),
('Owen Nathaniel Smith'),
('David Brian Washington'),
('Owen Logan Brooks'),
('Antonio Hunter Long'),
('Zachary Cole Ward'),
('Chase Diego Wilson'),
('Eric Evan Martin'),
('Thomas Jeremiah Lewis'),
('Isaac David Jackson'),
('Kyle Samuel Ross'),
('Aidan Benjamin Brooks'),
('Sean Jeremiah Stewart'),
('Miguel Jacob Flores'),
('Colin Noah Cooper'),
('Jordan Alejandro Hernandez'),
('Adrian Adam Wright'),
('Jonathan Ashton Adams'),
('David Mason Hughes'),
('Jayden Luis Wilson'),
('Evan Joshua Lopez'),
('Christopher Wyatt Edwards'),
('Joseph Adam Butler'),
('Hayden Austin Young'),
('Kyle Alexander Richardson'),
('Jason Alex Roberts'),
('David Patrick Hernandez'),
('Gabriel Ian Murphy'),
('Isaac David Sanchez'),
('Joseph Dylan Patterson'),
('Nathan James Murphy'),
('Sebastian Patrick Long'),
('Logan Jesus Clark'),
('Aiden Carter Murphy'),
('Alejandro Elijah Johnson'),
('Hunter Carter Parker'),
('Richard Wyatt Reed'),
('Evan Miguel Sanders'),
('Matthew Logan Thompson'),
('John Hunter Morgan'),
('Joseph Alejandro Baker'),
('Seth Sean Parker'),
('Alexander Alex Baker'),
('Julian Samuel Flores'),
('Owen Sebastian Martinez'),
('Devin Owen Hernandez'),
('Seth Bryan Alexander'),
('Dylan Carlos Bennett'),
('John Jake Lopez'),
('Jordan Ashton Allen'),
('Jeremiah Landon Walker'),
('Elijah Cameron Bryant'),
('Richard Zachary Simmons'),
('Austin Gavin Campbell'),
('Sebastian Dominic Phillips'),
('Anthony Hayden Bryant'),
('Ethan Samuel Davis'),
('Jonathan Daniel Martin'),
('Matthew Ethan Bell');

--Таблица salary
--3) Создать таблицу salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null
create table salary (
id serial primary key,
monthly_salary int not null
);

--Наполнить таблицу salary 15 строками:
insert into salary (monthly_salary)
values 
(1000),
(1100),
(1200),
(1300),
(1400),
(1500),
(1600),
(1700),
(1800),
(1900),
(2000),
(2100),
(2200),
(2300),
(2400),
(2500);

--Таблица employee_salary
--5) Создать таблицу employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique
-- salary_id. Int, not null
create table employee_salary (
id serial primary key,
employee_id int not null unique,
salary_id int not null
);

--6) Наполнить таблицу employee_salary 40 строками:
-- в 10 строк из 40 вставить несуществующие employee_id
insert into employee_salary (employee_id, salary_id)
values
(1,1),
(2,2),
(3,10),
(4,15),
(7,10),
(10,12),
(11,1),
(12,7),
(14,3),
(17,2),
(18,11),
(25,5),
(27,13),
(33,8),
(34,9),
(39,7),
(42,15),
(46,14),
(47,13),
(51,12),
(52,11),
(55,10),
(56,9),
(60,6),
(61,4),
(62,3),
(64,2),
(66,3),
(68,1),
(70,12),
(93,8),
(92,13),
(71,15),
(100,2),
(90,8),
(85,1),
(73,2),
(77,4),
(88,11),
(98,10);

--Таблица roles
--7)Создать таблицу roles
-- id. Serial  primary key,
-- role_name. int, not null, unique
create  table roles (
id serial primary key,
role_name INT not null unique
);

--8) Поменять тип столба role_name с int на varchar(30)
alter table roles 
alter column role_name 
type varchar(30);

--9) Наполнить таблицу roles 20 строками:
insert into roles (role_name)
values
('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');

--Таблица roles_employee
--10) Создать таблицу roles_employee
-- id. Serial  primary key,
-- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
create table roles_employee (
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (employee_id)
	references employees(id),
foreign key (role_id)
	references roles(id)
);

--11) Наполнить таблицу roles_employee 40 строками:
insert into roles_employee (employee_id, role_id)
values
(1,10),
(5,15),
(6,20),
(9,14),
(11,13),
(13,13),
(14,18),
(17,2),
(22,4),
(23,1),
(25,2),
(26,10),
(27,2),
(28,19),
(29,18),
(30,2),
(31,12),
(33,16),
(37,1),
(38,3),
(40,5),
(42,6),
(44,7),
(48,8),
(50,9),
(51,11),
(55,15),
(57,16),
(58,17),
(59,18),
(60,19),
(61,20),
(62,5),
(63,4),
(65,12),
(66,13),
(67,17),
(68,1),
(69,2),
(70,6);