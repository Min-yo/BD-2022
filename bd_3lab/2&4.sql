-- 2-nd task
CREATE TABLE customers (
    id INT primary key,
    full_name varchar(50) not null,
    timestamp_ timestamp not null,
    delivery_address text not null
);

CREATE TABLE orders (
    code int primary key,
    customer_id int foreign key REFERENCES customers(id),
    total_sum double precision not null CHECK (total_sum>0),
    is_paid boolean not null
);

CREATE TABLE products (
    id varchar primary key,
    name_ varchar not null unique,
    description_ text,
    price double precision not null CHECK (price>0)
);

CREATE TABLE order_items (
    order_code INT primary key foreign key REFERENCES orders(code),
    product_id varchar primary key foreign key REFERENCES products(id),
    quantity INT not null CHECK(quantity>0)
);

-- 4-th task

INSERT INTO products (id, name_, price)
VALUES (123, "Botle", 1455);

UPDATE orders
SET is_paid = true
WHERE code = 123;

DELETE FROM order_items WHERE order_code = 123;