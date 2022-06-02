Схема БД состоит из четырех таблиц:
Product(maker, model, type)
PC(code, model, speed, ram, hd, cd, price)
Laptop(code, model, speed, ram, hd, price, screen)
Printer(code, model, color, type, price)
Таблица Product представляет производителя (maker), номер модели (model) и тип ('PC' - ПК, 'Laptop' - ПК-блокнот или 'Printer' - принтер). Предполагается, что номера моделей в таблице Product уникальны для всех производителей и типов продуктов. В таблице PC для каждого ПК, однозначно определяемого уникальным кодом – code, указаны модель – model (внешний ключ к таблице Product), скорость - speed (процессора в мегагерцах), объем памяти - ram (в мегабайтах), размер диска - hd (в гигабайтах), скорость считывающего устройства - cd (например, '4x') и цена - price (в долларах). Таблица Laptop аналогична таблице РС за исключением того, что вместо скорости CD содержит размер экрана -screen (в дюймах). В таблице Printer для каждой модели принтера указывается, является ли он цветным - color ('y', если цветной), тип принтера - type (лазерный – 'Laser', струйный – 'Jet' или матричный – 'Matrix') и цена - price.

Задание: 1 (Serge I: 2002-09-30)
Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
SELECT model, speed, hd
FROM PC 
WHERE price < 500

Задание: 2 (Serge I: 2002-09-21)
Найдите производителей принтеров. Вывести: maker
SELECT maker
FROM Product
WHERE type = 'Printer'
GROUP BY maker

Задание: 3 (Serge I: 2002-09-30)
Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
SELECT model, ram, screen
FROM Laptop
WHERE price > 1000

Задание: 4 (Serge I: 2002-09-21)
Найдите все записи таблицы Printer для цветных принтеров.
SELECT*FROM printer
WHERE color = 'y'

Задание: 5 (Serge I: 2002-09-30)
Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
SELECT model, speed, hd 
FROM PC
WHERE cd = '24x' and price < 600 or cd = '12x' and price < 600

Задание: 8 (Serge I: 2003-02-03)
Найдите производителя, выпускающего ПК, но не ПК-блокноты.
SELECT maker
FROM product
where type IN ('Laptop', 'PC')
EXCEPT
SELECT maker
FROM product
where type IN ('Laptop')

Задание: 9 (Serge I: 2002-11-02)
Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
SELECT DISTINCT maker
FROM Product 
JOIN pc ON product.Model = pc.Model
WHERE pc.Speed >= 450 AND type = 'PC'

Задание: 10 (Serge I: 2002-09-23)
Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
SELECT model, price
FROM printer
WHERE price IN (SELECT max(price) FROM printer)

Задание: 11 (Serge I: 2002-11-02)
Найдите среднюю скорость ПК.
SELECT sum(speed)/COUNT(speed) as avgSpeedPC
FROM PC

Задание: 12 (Serge I: 2002-11-02)
Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
SELECT sum(speed)/COUNT(speed) as avgSpeedLaptop
FROM laptop
WHERE price > 1000

Задание: 13 (Serge I: 2002-11-02)
Найдите среднюю скорость ПК, выпущенных производителем A.
SELECT sum(speed)/COUNT(speed) as avgSpeedPc
FROM PC
JOIN product ON pc.model = product.model
WHERE maker = 'A'

Рассматривается БД кораблей, участвовавших во второй мировой войне. Имеются следующие отношения:
Classes (class, type, COUNTry, numGuns, bore, displacement)
Ships (name, class, launched)
Battles (name, date)
Outcomes (ship, battle, result)
Корабли в «классах» построены по одному и тому же проекту, и классу присваивается либо имя первого корабля, построенного по данному проекту, либо названию класса дается имя проекта, которое не совпадает ни с одним из кораблей в БД. Корабль, давший название классу, называется головным.
Отношение Classes содержит имя класса, тип (bb для боевого (линейного) корабля или bc для боевого крейсера), страну, в которой построен корабль, число главных орудий, калибр орудий (диаметр ствола орудия в дюймах) и водоизмещение ( вес в тоннах). В отношении Ships записаны название корабля, имя его класса и год спуска на воду. В отношение Battles включены название и дата битвы, в которой участвовали корабли, а в отношении Outcomes – результат участия данного корабля в битве (потоплен-sunk, поврежден - damaged или невредим - OK).
Замечания. 1) В отношение Outcomes могут входить корабли, отсутствующие в отношении Ships. 2) Потопленный корабль в последующих битвах участия не принимает.

Задание: 14 (Serge I: 2002-11-05)
Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
SELECT ships.class, name, COUNTry
FROM ships
JOIN classes ON ships.class = classes.class
WHERE numGuns >= 10

Задание: 15 (Serge I: 2003-02-03)
Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
SELECT hd 
FROM pc
GROUP BY hd
HAVING COUNT(hd) >= 2

Задание: 16 (Serge I: 2003-02-03)
Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
SELECT DISTINCT 
pc1.Model,
pc2.Model,
pc1.Speed,
pc1.Ram
FROM pc as pc1, pc as pc2
WHERE pc1.Speed = pc2.Speed and pc1.Ram = pc2.Ram and pc1.Model>pc2.Model

Задание: 17 (Serge I: 2003-02-03)
Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed
SELECT DISTINCT 
type, 
product.model, 
speed
FROM laptop 
JOIN product ON laptop.model = product.model
WHERE speed < (SELECT MIN(speed) FROM PC)

Задание: 18 (Serge I: 2003-02-03)
Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
SELECT DISTINCT 
maker, 
price
FROM printer 
JOIN product ON printer.model = product.model
WHERE color = 'y' AND price IN 
(SELECT MIN(price) 
FROM printer 
WHERE color = 'y')

Задание: 19 (Serge I: 2003-02-13)
Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
Вывести: maker, средний размер экрана.
SELECT 
maker,
(SUM(screen) / COUNT(maker)) AS avgScreen
FROM laptop 
JOIN product ON laptop.model = product.model
GROUP BY maker

Задание: 20 (Serge I: 2003-02-13)
Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.
SELECT 
maker,
COUNT(Model) AS countModel
FROM Product 
WHERE type = 'PC'
GROUP BY maker
HAVING COUNT(Model) >=3

Задание: 21 (Serge I: 2003-02-13)
Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
Вывести: maker, максимальная цена.
SELECT
maker,
MAX(price) maxPrice
FROM Product
RIGHT JOIN PC on product.Model=pc.Model
GROUP BY maker

Задание: 22 (Serge I: 2003-02-13)
Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.
SELECT
speed, 
AVG(price) avgPrice
FROM PC
WHERE speed > 600
GROUP BY speed

Задание: 23 (Serge I: 2003-02-14)
Найдите производителей, которые производили бы как ПК
со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
Вывести: Maker
SELECT 
maker
FROM Product
JOIN PC ON product.Model = PC.Model
WHERE speed >= 750 and maker IN 
(SELECT 
maker
FROM Product
JOIN Laptop ON product.Model = Laptop.Model
WHERE speed >= 750)
GROUP BY maker

Задание: 24 (Serge I: 2003-02-03)
Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.
SELECT model 
FROM 
(SELECT model, price FROM PC
UNION 
SELECT model, price FROM Laptop
UNION
SELECT model, price FROM Printer) newTable
WHERE price =(
SELECT MAX(price) 
FROM 
(SELECT model, price FROM PC
UNION 
SELECT model, price FROM Laptop
UNION
SELECT model, price FROM Printer) newTable2
)

Задание: 25 (Serge I: 2003-02-14)
Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker
SELECT DISTINCT maker 
FROM PC
JOIN product ON pc.model=product.model
WHERE maker IN
(SELECT DISTINCT maker
FROM Product
WHERE type = 'printer')
AND speed = (
SELECT MAX(speed)
FROM PC
WHERE ram = (
SELECT MIN(ram)
FROM PC))
AND ram = (
SELECT MIN(ram)
FROM PC)

Задание: 26 (Serge I: 2003-02-14)
Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.
SELECT SUM(price)/SUM(models) AS avgPrice
FROM (
SELECT 
COUNT(pc.Model) models, 
SUM(price) price 
FROM PC
JOIN product ON product.Model=PC.model
WHERE maker= 'A'
UNION
SELECT 
COUNT(laptop.Model) models, 
SUM(price) price 
FROM laptop
JOIN product ON product.Model=laptop.model
WHERE maker= 'A'
) newTable

Задание: 27 (Serge I: 2003-02-03)
Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.
SELECT 
maker,
AVG(hd) as avgHd
FROM PC
JOIN product ON product.model=PC.model
WHERE maker IN (
SELECT maker 
FROM product
WHERE type = 'printer'
)GROUP BY maker

Задание: 28 (Serge I: 2012-05-04)
Используя таблицу Product, определить количество производителей, выпускающих по одной модели.
SELECT
COUNT(maker) countMaker
FROM(
SELECT maker
FROM product
GROUP by maker
HAVING COUNT(maker)=1)  newTable

Фирма имеет несколько пунктов приема вторсырья. Каждый пункт получает деньги для их выдачи сдатчикам вторсырья. Сведения о получении денег на пунктах приема записываются в таблицу:
Income_o(point, date, inc)
Первичным ключом является (point, date). При этом в столбец date записывается только дата (без времени), т.е. прием денег (inc) на каждом пункте производится не чаще одного раза в день. Сведения о выдаче денег сдатчикам вторсырья записываются в таблицу:
Outcome_o(point, date, out)
В этой таблице также первичный ключ (point, date) гарантирует отчетность каждого пункта о выданных деньгах (out) не чаще одного раза в день.
В случае, когда приход и расход денег может фиксироваться несколько раз в день, используется другая схема с таблицами, имеющими первичный ключ code:
Income(code, point, date, inc)
Outcome(code, point, date, out)
Здесь также значения столбца date не содержат времени.

Задание: 29 (Serge I: 2003-02-14)
В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день [т.е. первичный ключ (пункт, дата)], написать запрос с выходными данными (пункт, дата, приход, расход). Использовать таблицы Income_o и Outcome_o.
SELECT
Income_o.point,
Income_o.[date],
inc,
out
FROM Income_o
LEFT JOIN Outcome_o ON Outcome_o.point=Income_o.point
AND Outcome_o.[date]=Income_o.[date]
UNION
SELECT
Outcome_o.point,
Outcome_o.[date],
inc,
out
FROM Income_o
RIGHT JOIN Outcome_o ON Outcome_o.point=Income_o.point
AND Outcome_o.[date]=Income_o.[date]

Задание: 30 (Serge I: 2003-02-14)
В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз (первичным ключом в таблицах является столбец code), требуется получить таблицу, в которой каждому пункту за каждую дату выполнения операций будет соответствовать одна строка.
Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc). Отсутствующие значения считать неопределенными (NULL).
SELECT point, [date], SUM(outs), SUM(incs)
FROM (
SELECT point, [date], SUM(out) outs, null incs
FROM outcome
GROUP BY point, [date]
UNION
SELECT point, [date], null, SUM(inc) FROM income
GROUP BY point, [date]
) newTable
GROUP BY point, [date]
