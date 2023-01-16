create table if not exists cores (
    core_name varchar(255) not null primary key,
    core_description text null,
    constraint cores_core_name_uindex unique (core_name)
);

create table if not exists houses (
    house_name varchar(255) not null primary key,
    house_description text not null,
    house_img_name varchar(255) null,
    constraint houses_house_name_uindex unique (house_name)
);

create table if not exists roles (
    role_id int not null primary key,
    role_name varchar(255) not null,
    role_description text null,
    constraint roles_role_id_uindex unique (role_id),
    constraint roles_role_name_uindex unique (role_name)
);

create table if not exists spells (
    spell_id int auto_increment primary key,
    spell_name varchar(255) not null,
    spell_description text not null,
    constraint spells_spell_name_uindex unique (spell_name)
) auto_increment = 79;

create table if not exists woods (
    wood_name varchar(255) not null primary key,
    wood_description text null,
    constraint woods_wood_name_uindex unique (wood_name)
);

create table if not exists wands (
    wand_id int auto_increment primary key,
    wand_name varchar(255) not null,
    wand_core varchar(255) not null,
    wand_wood varchar(255) not null,
    wand_length int not null,
    constraint wands_cores_core_name_fk foreign key (wand_core) references cores (core_name),
    constraint wands_woods_wood_name_fk foreign key (wand_wood) references woods (wood_name)
) auto_increment = 28;

create table if not exists users (
    user_id int auto_increment primary key,
    user_firstname varchar(255) not null,
    user_lastname varchar(255) not null,
    user_email varchar(255) not null,
    user_password varchar(255) not null,
    fk_wand_id int null,
    fk_role_id int default 2 not null,
    user_house varchar(255) null,
    constraint users_houses_house_name_fk foreign key (user_house) references houses (house_name),
    constraint users_roles_role_id_fk foreign key (fk_role_id) references roles (role_id),
    constraint users_wands_wand_id_fk foreign key (fk_wand_id) references wands (wand_id) on update cascade
) auto_increment = 73;

create table if not exists users_spells (
    fk_user_id int not null,
    fk_spell_id int not null,
    constraint unique_users_spells unique (fk_user_id, fk_spell_id),
    constraint users_spells_spells_spell_id_fk foreign key (fk_spell_id) references spells (spell_id),
    constraint users_spells_users_user_id_fk foreign key (fk_user_id) references users (user_id) on update cascade on delete cascade
);