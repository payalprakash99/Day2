CREATE TABLE customers (
  customer_id int NOT NULL,
  first_name varchar(45) NOT NULL,
  last_name varchar(45) NOT NULL,
  phone varchar(12),
  email varchar(45) NOT NULL,
  street varchar(45),
  city varchar(45),
  state varchar(45) ,
  zipcode varchar(45) ,
  PRIMARY KEY (customer_id)
) 
INSERT INTO customers(customer_id,first_name,last_name,phone,email,street,city,state,zipcode)
VALUES
(1,'Payal','Shah','9076842109','ram@gmail.com','Thomas Street','Syndey','Aus','47346'),
(2,'Madhu','shri','9076842109','kunal@gmail.com','Chruch Street','Syndey','Aus','47346'),
(3,'Pavithra','selvaraj','9876674210','ramya@gmail.com','Naidu Street','Trichy','TN','97546'),
(4,'Lavanya','Umapathy','9076856789','rudhra@gmail.com','Kutch Street','Ladak','Ladak','00004'),
(5,'Monisha','chandrasekhar','9875562210','vishnu@gmail.com','Gandhi Street','Trichy','TN','86544')

select * from customers
CREATE TABLE stores (
  store_id int NOT NULL,
  store_name varchar(45) NOT NULL,
  phone varchar(12),
  email varchar(45),
  street varchar(45),
  city varchar(45) ,
  state varchar(45) ,
  zipcode varchar(45) ,
  PRIMARY KEY (store_id)
)
INSERT INTO stores(store_id,store_name,phone,email,street,city,state,zipcode)
VALUES
(1,'Store1','99975657777','s1@gmail.com','ss Street','Zambia','Africa','898987'),
(2,'Store2','99977777565','s2@gmail.com','bs Street','Blore','KA','124687'),
(3,'Store3','56893777565','s3@gmail.com','ms Street','Cbe','TN','634528'),
(4,'Store4','99975657777','s4@gmail.com','ss Street','Zambia','Africa','898987'),
(5,'Store5','99977777565','s5@gmail.com','bs Street','Blore','KA','124687');


CREATE TABLE staffs (
  staff_id int NOT NULL,
  first_name varchar(45) ,
  last_name varchar(45) ,
  email varchar(45) ,
  phone varchar(45) ,
  active int ,
  store_id int ,
  manager_id int ,
  PRIMARY KEY (staff_id),
  FOREIGN KEY (manager_id) REFERENCES staffs (staff_id),
  FOREIGN KEY (store_id) REFERENCES stores (store_id) 
)
INSERT INTO staffs(staff_id,first_name,last_name,email,phone,active,store_id,manager_id)
VALUES
(1,'Akash','S','as@gmail.com','9875673452','0',1,1),
(2,'Mathivanan','K','mk@gmail.com','7345200756','1',2,2),
(3,'Aakash','S','aaks@gmail.com','9875673452','0',1,3),
(4,'Mythili','K','mythilik@gmail.com','7345200756','1',2,4),
(5,'Agas','S','agass@gmail.com','9875673452','0',1,5),
(6,'Monica','K','monicak@gmail.com','7345200756','1',2,5)

CREATE TABLE orders (
  orders_id int NOT NULL,
  customer_id int NOT NULL,
  order_status varchar(45) NOT NULL,
  order_date datetime,
  required_date datetime,
  shipped_date datetime,
  store_id int NOT NULL,
  staff_id int NOT NULL,
  PRIMARY KEY (orders_id),
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
  FOREIGN KEY (staff_id) REFERENCES staffs (staff_id),
  FOREIGN KEY (store_id) REFERENCES stores (store_id)
)
INSERT INTO orders(orders_id,customer_id,order_status,order_date,required_date,shipped_date,store_id,staff_id)
VALUES
(1,1,'Shipped','2020/03/20','2020/03/30','2020/03/25',2,2),
(2,2,'Not Shipped','2019/03/15','2019/03/20','2020/03/18',2,2),
(3,3,'Shipped','2000/03/20','2000/03/30','2020/03/25',2,2),
(4,4,'Not Shipped','2015/03/15','2020/03/20','2020/03/18',2,2),
(5,5,'Deliverd','2011/03/20','2020/03/30','2020/03/25',2,2)
DELETE from orders
drop table brands
CREATE TABLE brands (
  brand_id int NOT NULL,
  brand_name varchar(45) NOT NULL,
  PRIMARY KEY (brand_id)
)

INSERT INTO brands(brand_id,brand_name)
VALUES 
(1, 'HandM'),
(2,'attire'),
(3,'mascot'),
(4,'benniton'),
(5,'Gap');

CREATE TABLE categories (
  category_id int NOT NULL,
  category_name varchar(45) NOT NULL,
  PRIMARY KEY (category_id)
)
INSERT INTO categories(category_id,category_name)
VALUES
(1,'Fashion'),
(2,'Food'),
(3,'Electronics'),
(4,'kids'),
(5,'Health');


CREATE TABLE products (
  product_id int NOT NULL,
  product_name varchar(45) NOT NULL,
  brand_id int NOT NULL,
  category_id int NOT NULL,
  model_year int NOT NULL,
  list_price decimal NOT NULL,
  PRIMARY KEY (product_id),
  FOREIGN KEY (brand_id) REFERENCES brands (brand_id) ,
  FOREIGN KEY (category_id) REFERENCES categories (category_id) 
)
INSERT INTO products(product_id,product_name,brand_id,category_id,model_year,list_price)
VALUES
(1,'Hoodie',1,2,99,100),
(2,'Tshirt',4,4,78,120),
(3,'Washing machine',5,5,99,100),
(4,'Nightwear',4,4,78,120),
(5,'Fitbit',5,5,99,100);

CREATE TABLE order_items (
  order_id int NOT NULL,
  item_id varchar(45) NOT NULL,
  product_id int NOT NULL,
  quantity int NOT NULL,
  list_price decimal NOT NULL,
  discount decimal NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY (order_id) REFERENCES orders (orders_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id) 
  );
  
INSERT INTO order_items(order_id,item_id,product_id,quantity,list_price,discount)
VALUES
(1,2,2,1,75,5),
(2,3,3,5,85,10),
(3,2,2,10,75,5),
(4,3,3,12,85,10),
(5,2,2,10,75,5);

  CREATE TABLE stocks (
  store_id int NOT NULL,
  product_id int,
  quantity int,
  PRIMARY KEY (store_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id),
  FOREIGN KEY (store_id) REFERENCES stores (store_id) 
)
INSERT INTO stocks(store_id,product_id,quantity)
VALUES
(1,1,5),
(2,2,10),
(3,3,15),
(4,4,20),
(5,5,25);
select * from stocks


SELECT orders.orders_id,
      customers.customer_id,
	  customers.first_name,
	  customers.city,
	  orders.order_status,
	  orders.order_date,
	  order_items.quantity,
	  order_items.quantity*order_items.list_price as order_total,
	  stores.store_id,
	  stores.store_name,
	  staffs.staff_id,
	  staffs.first_name,
	  staffs.manager_id,
	  staffs.first_name as manager_name
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id 
LEFT JOIN order_items ON  orders.orders_id = order_items.order_id
LEFT JOIN stores ON  orders.store_id= stores.store_id
LEFT JOIN staffs on orders.staff_id=staffs.staff_id and staffs.staff_id= staffs.manager_id
order by customers.customer_id


