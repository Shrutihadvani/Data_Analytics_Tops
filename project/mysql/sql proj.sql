
create table orders(
    o_id int primary key,
    i_id int,
    quantity int,
    order_date date,
    total_amount int
);

insert into orders (o_id, i_id, quantity, order_date, total_amount)
values 
(1, 201, 2, '2025-03-01', 600),
(2, 202, 1, '2025-03-02', 150),
(3, 203, 4, '2025-03-03', 800),
(4, 204, 3, '2025-03-04', 450),
(5, 205, 2, '2025-03-05', 400),
(6, 206, 5, '2025-03-06', 1250),
(7, 207, 3, '2025-03-07', 750),
(8, 208, 1, '2025-03-08', 200),
(9, 209, 6, '2025-03-09', 1200),
(10, 210, 7, '2025-03-10', 1750);

create table items(
    i_id int primary key,
    item_name varchar(50),
    category varchar(25),
    price int
);

insert into items (i_id, item_name, category, price)
values 
(201, 'Printer', 'Electronics', 300),
(202, 'Scanner', 'Electronics', 150),
(203, 'Router', 'Electronics', 200),
(204, 'Desk Lamp', 'Home Decor', 150),
(205, 'Wall Clock', 'Home Decor', 200),
(206, 'Office Chair', 'Furniture', 250),
(207, 'Study Table', 'Furniture', 250),
(208, 'Notebook', 'Stationery', 200),
(209, 'Pen Set', 'Stationery', 200),
(210, 'Backpack', 'Accessories', 250);

-- Ans :1  
select * from orders;

-- Ans :2
select item_name, price from items;

-- Ans :3  
select quantity, total_amount from orders where total_amount > 500;

-- Ans :4  
select * from items where category = 'Electronics';

-- Ans :5 
select sum(total_amount) as total_revenue from orders;

-- Ans :6  
select sum(quantity) as total_quantity_ordered from orders;

-- Ans :7 
select order_date, COUNT(o_id) as orders_count from orders group by order_date;

-- Ans :8 
select item_name, price from items order by price desc;

-- Ans :9  
select o_id, i_id, total_amount from orders where quantity > 2;

-- Ans :10 
select sum(o.total_amount) as electronics_revenue
from orders o
join items i on o.i_id = i.i_id
where i.category = 'Electronics';

-- Ans :11  
select item_name, price from items where price between 150 and 300;

-- Ans :12  
select sum(o.quantity) as total_quantity_electronics
from orders o
join items i on o.i_id = i.i_id
where i.category = 'Electronics';
