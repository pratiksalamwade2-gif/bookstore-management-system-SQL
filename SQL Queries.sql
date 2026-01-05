use Bookstore;
select * from Books;
select * from Customers;
select * from Orders;

select * from Books where price > (select avg(price) from Books);

select * from Customers where customer_id in (select customer_id from Orders);

select * from Books b where price > (select avg(price) from Books where genre = b.genre);

select * from Books where genre = 'Thriller';

select * from Books where published_year >= 2020;

select * from Customers where city = 'Mumbai';

select * from Orders where order_date between '2024-11-01' and '2024-11-30';

select sum(stock) as total_stocks from Books;

 (select max(price) as expensive_book from Books);
 select * from Books order by price desc limit 1;
 -- ## 
 select c.name,c.phone,c.city,o.order_date,o.quantity from Customers as c join Orders as o  on c.customer_id = o.customer_id 
 where o.quantity between 2 and 3;
 
 select  distinct genre from Books;
 
 select b.title,b.genre,b.price,o.total_amount,o.quantity from Books as b join Orders as o on b.book_id = o.book_id
 where o.total_amount > 60.00 order by o.total_amount asc;
 
 select * from Books order by stock asc;
 
 select sum(total_amount) as Revenue from Orders;
 
 -- Advanced query 
 select b.genre, sum(o.quantity) as total_books_sold
 from Books b join Orders o on b.book_id = o.order_id
 group by b.genre;
 
 select avg(price) as Average_price
 from Books where genre = 'Romance';
 
 select c.name,c.city,c.phone,o.customer_id,count(o.order_id)as order_count
 from Customers c join orders o on c.customer_id = o.customer_id
 group by o.customer_id
 having count(o.order_id) >= 2;
-- working  
 select b.title,o.book_id,count(o.order_id) as order_count
 from Orders o 
 join Books b on o.book_id = b.book_id
 group by o.book_id,b.title
 order by order_count desc limit 2;
 
 select * from Books 
 where genre = 'Romance'
 order by price desc limit 5;
 
 select b.author,sum(o.quantity) as total_quantity
 from Books b join Orders o 
 on o.book_id = b.book_id
 group by b.author;
 
 select c.city,o.total_amount
 from Customers c join Orders o on c.customer_id = o.customer_id
 where o.total_amount >= 100;
 
 select c.customer_id,c.name,c.city,sum(o.total_amount) as total_spent
 from customers c join orders o on
 c.customer_id = o.customer_id
 group by c.customer_id,c.name 
 order by total_spent desc limit 5;
 
 select b.book_id,b.title,b.stock,coalesce(sum(quantity),0) as order_quantity,
 b.stock - coalesce(sum(quantity),0) as remaining_quantity
 from Books b left join Orders o on b.book_id = o.book_id
 group by b.book_id
 order by b.book_id desc;
 
 
	
 




