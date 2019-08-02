DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS product_order;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS shopping_carts;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS users_roles;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS user_details;


create table categories
(
    id   varchar(255) not null primary key,
    name varchar(255) null,
    constraint UK_t8o6pivur7nn124jehx7cygw5 unique (name)
);

INSERT INTO shop.categories (id, name)
VALUES ('7b5b74dd-b3bf-4712-822d-deeec17994f8', 'Leptop'),
       ('1b349977-6240-4f02-a7d4-9085d9b2b195', 'PC'),
       ('7fce7f34-f510-4f72-902e-8501536461ce', 'Phone');

create table orders
(
    id       varchar(255) not null primary key,
    date     datetime(6)  null,
    status   varchar(255) null,
    owner_id varchar(255) null,
    constraint FKml4dss6fai1c8icav9hoq47o8
        foreign key (owner_id) references users (email)
);

INSERT INTO shop.orders (id, date, status, owner_id)
VALUES ('bf65e82e-06a3-4874-bba1-96b1d3326e3e', '2019-07-29 14:50:33.484408000', 'UNDELIVERED', null);

create table product_order
(
    id              varchar(255)   not null primary key,
    count           int            not null,
    name            varchar(255)   null,
    price           decimal(19, 2) null,
    product_id      varchar(255)   null,
    category_id     varchar(255)   null,
    order_id        varchar(255)   null,
    shoping_cart_id varchar(255)   null,
    constraint FKanm84fvvnojr4batohvdqhixw
        foreign key (shoping_cart_id) references shopping_carts (id),
    constraint FKjwsik4uvq2sdqtb7x6h1o5f0v
        foreign key (order_id) references orders (id),
    constraint FKo7dl8saqqnhuc1e5pkoabjr1a
        foreign key (category_id) references categories (id)
);

INSERT INTO shop.product_order (id, count, name, price, product_id, category_id, order_id, shoping_cart_id)
VALUES ('2a7d0552-dad4-4575-8745-0749eabb0b80', 2, 'Samsumg S10+', 3000.00, '87ccb4e0-15a4-4f73-a4a6-8765ff270def', '7fce7f34-f510-4f72-902e-8501536461ce', 'bf65e82e-06a3-4874-bba1-96b1d3326e3e', null),
       ('5567a51e-00bf-4ec0-a4eb-51fc66d498d5', 10, 'Lenovo x10', 6570.00, '130d7cc9-c5e9-4c1b-8caf-bc432aee4cc0', '7b5b74dd-b3bf-4712-822d-deeec17994f8', null, '80052bd5-449d-45c1-b6be-a75581de4212');

create table products
(
    id          varchar(255)   not null primary key,
    name        varchar(255)   null,
    price       decimal(19, 2) null,
    category_id varchar(255)   null,
    constraint FKog2rp4qthbtt2lfyhfo32lsw9
        foreign key (category_id) references categories (id)
);

INSERT INTO shop.products (id, name, price, category_id)
VALUES ('130d7cc9-c5e9-4c1b-8caf-bc432aee4cc0', 'Lenovo x10', 6570.00, '7b5b74dd-b3bf-4712-822d-deeec17994f8'),
       ('6bc33ec6-16bd-4c63-90d1-f33f905f5fae', 'iMac PRO', 18350.00, '1b349977-6240-4f02-a7d4-9085d9b2b195'),
       ('87ccb4e0-15a4-4f73-a4a6-8765ff270def', 'Samsumg S10+', 3000.00, '7fce7f34-f510-4f72-902e-8501536461ce'),
       ('87e4c2da-2077-4b44-8107-bdc525a4df4f', 'IPhone X', 3500.00, '7fce7f34-f510-4f72-902e-8501536461ce'),
       ('8e0ee067-0363-491c-906f-3d614b59ebbf', 'Xiaomi A3', 2700.00, '7fce7f34-f510-4f72-902e-8501536461ce'),
       ('d2b71ce3-4c70-4061-afc5-f7f3c95e660b', 'ABS Master-Pro Ryzen 5 2400G', 13670.00, '1b349977-6240-4f02-a7d4-9085d9b2b195'),
       ('f1654438-ebb7-4890-bdf4-71b272cd0f60', 'MacBook Pro i9', 8700.00, '7b5b74dd-b3bf-4712-822d-deeec17994f8');

create table roles
(
    role varchar(255) not null primary key
);

INSERT INTO shop.roles (role)
VALUES ('ROLE_ADMIN'),
       ('ROLE_USER');

create table shopping_carts
(
    id   varchar(255) not null primary key,
    date datetime(6)  null
);

INSERT INTO shop.shopping_carts (id, date)
VALUES ('80052bd5-449d-45c1-b6be-a75581de4212', '2019-07-26 18:08:01.302660000');

create table user_details
(
    email    varchar(255) not null primary key,
    password varchar(255) null
);

INSERT INTO shop.user_details (email, password)
VALUES ('petya@mail.com', '{bcrypt}$2a$10$9JDmwMe9oCGtE5QA8AlRfunlqN/zBVwkBrnng1rTjCUOj9r3PvY4S'),
       ('vasya@mail.com', '{bcrypt}$2a$10$XNA9jkWc.IrmJ1NJRsYg/uy9Dm46Gq2.LNxJfxosxl99BMz9L6kMS');

create table users
(
    email            varchar(255)   not null primary key,
    balance          decimal(10, 2) null,
    name             varchar(255)   null,
    phone            varchar(255)   null,
    shopping_cart_id varchar(255)   null,
    constraint UK_du5v5sr43g5bfnji4vb8hg5s3 unique (phone),
    constraint FKpit3woesw8x1062syim3kei69
        foreign key (shopping_cart_id) references shopping_carts (id)
);

INSERT INTO shop.users (email, balance, name, phone, shopping_cart_id)
VALUES ('petya@mail.com', 0.00, 'Petya', '0543215678', null),
       ('vasya@mail.com', 0.00, 'Vasya', '0545677889', '80052bd5-449d-45c1-b6be-a75581de4212');

create table users_roles
(
    user_email varchar(255) not null,
    user_role  varchar(255) not null,
    constraint FK8blj61sja4vp8e1m8ddx0guyu
        foreign key (user_email) references user_details (email),
    constraint FKdphtr6edh8xot9y8hr6227ldu
        foreign key (user_role) references roles (role)
);

INSERT INTO shop.users_roles (user_email, user_role)
VALUES ('vasya@mail.com', 'ROLE_USER'),
       ('petya@mail.com', 'ROLE_USER');