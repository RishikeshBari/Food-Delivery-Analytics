-- ------------------------------------------------------- Creation of Database -------------------------------------------------------
CREATE DATABASE food_delivery_analytics;
use food_delivery_analytics;

-- ------------------------------------------------------- Creation of Tables -------------------------------------------------------
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    city VARCHAR(50) NOT NULL,
    signup_date DATE NOT NULL
);

CREATE TABLE restaurants (
    restaurant_id VARCHAR(10) PRIMARY KEY,
    cuisine VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    rating DECIMAL(2,1)
);

CREATE TABLE menu_items (
    item_id VARCHAR(10) PRIMARY KEY,
    restaurant_id VARCHAR(10) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (restaurant_id)
        REFERENCES restaurants(restaurant_id)
);

CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    restaurant_id VARCHAR(10) NOT NULL,
    order_time DATE NOT NULL,
    delivery_time DATETIME,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id)
        REFERENCES restaurants(restaurant_id)
);

CREATE TABLE order_items (
    order_id VARCHAR(10) NOT NULL,
    item_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (order_id, item_id),
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    FOREIGN KEY (item_id)
        REFERENCES menu_items(item_id)
);

-- ------------------------------------------------------- Description of the Tables -------------------------------------------------------
DESCRIBE customers;
DESCRIBE restaurants;
DESCRIBE menu_items;
DESCRIBE orders;
DESCRIBE order_items;

-- ========================================================================= End of File =========================================================================