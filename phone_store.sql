
create database if not exists phone store;


create table if not exists MobilePhones (
	Name Varchar(100),
	Brand Varchar(100),
	Price Decimal(10, 2)
);

insert into MobilePhones (Name, Brand, Price)
values ('Phone 1', 'Samsung', 500),
	   ('Phone 2', 'Apple', 1000),
	   ('Phone 3', 'Samsung', 700),
	   ('Phone 4', 'Xiaomi', 300),
	   ('Phone 5', 'Samsung', 600),
	   ('Phone 6', 'Sony', 400);
	  
	  


select Name, Brand, Price
from MobilePhones
group by Name, Brand, Price
having count(*) > 2;

select Name, Brand, Price
from MobilePhones
where Brand = 'Samsung';



/*---------------------------------------------------------------
 * Урок 2. SQL – создание объектов, простые запросы выборки
 * */



use `phone store`;

/* Создание таблицы "sales" и заполнение ее данными: */

create table if not exists sales (
	id int auto_increment,
	product_name varchar(50),
	quantity int,
	price decimal(10, 2),
	primary key (id)
);

insert into sales (product_name, quantity, price)
values 
	('Product A', 50, 10.00),
	('Product B', 150, 15.50),
	('Product C', 250, 20.25),
	('Product D', 350, 25.75);


/* Группировка значений количества в 3 сегмента: */

select 
	case 	
		when quantity < 100 then 'Меньше 100'
		when quantity between 100 and 300 then '100-300'
		else 'Больше 300'
	end as quantity_segment,
	count(*) count
	
from sales
group by 
	case 
		when quantity < 100 then 'Меньше 100'
		when quantity between 100 and 300 then '100-300'
		else 'Больше 300'
	end;
	
/* Создание таблицы "orders" и показ "полного" статуса заказа с использованием оператора CASE: */

create table if not exists orders (
	id int primary key,
	order_status int
);

insert into orders (id, order_status)
values 
	(1, 0),
    (2, 1),
    (3, 2),
    (4, 3),
    (5, NULL);	

select 
	id,
	case 
		when order_status = 0 then 'Новый'
		when order_status = 1 then 'В обработке'
		when order_status = 2 then 'Выполнен'
		when order_status = 3 then 'Отменен'
		else 'Неизвестный статус'
	end as order_status_full
from orders;


/* Различия между NULL и 0:
- NULL и 0 - это различные значения в контексте баз данных.
- NULL представляет отсутствие значения или неопределенное значение. Он используется, когда значение неизвестно или не применимо.
  0 - это конкретное значение и обозначает ноль или отсутствие каких-либо единиц, количества или размера. */

 




