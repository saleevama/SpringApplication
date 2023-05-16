create table category
(
    id   serial
        primary key,
    name varchar(255)
);

alter table category
    owner to postgres;

create table person
(
    id       serial
        primary key,
    login    varchar(100),
    password varchar(255),
    role     varchar(255)
);

alter table person
    owner to postgres;

create table product
(
    id              serial
        primary key,
    description     text         not null,
    local_date_time timestamp(6),
    price           real         not null
        constraint product_price_check
            check (price >= (1)::double precision),
    seller          varchar(255) not null,
    title           text         not null
        constraint uk_qka6vxqdy1dprtqnx9trdd47c
            unique,
    warehouse       varchar(255) not null,
    category_id     integer      not null
        constraint fk1mtsbur82frn64de7balymq9s
            references category
);

alter table product
    owner to postgres;

create table image
(
    id         serial
        primary key,
    file_name  varchar(255),
    product_id integer not null
        constraint fkgpextbyee3uk9u6o2381m7ft1
            references product
);

alter table image
    owner to postgres;

