CREATE TABLE IF NOT EXISTS vets (
    id          int,
    first_name  varchar(15),
    last_name   varchar(15)
);

CREATE TABLE IF NOT EXISTS specialties (
    spec_id     int,
    spec        varchar(15)
);

CREATE TABLE IF NOT EXISTS vet_specialties (
    id          int,
    spec_id     int
);

CREATE TABLE IF NOT EXISTS types (
    type_id       int,
    animal_type   varchar(15)
);

CREATE TABLE IF NOT EXISTS owners (
    owner_id        int,
    first_name      varchar(15),
    last_name       varchar(15),
    adress          varchar(255),
    city            varchar(31),
    phone           varchar(15)
);

CREATE TABLE IF NOT EXISTS pets (
    id         int,
    name       varchar(15),
    birth_date varchar(10),
    type_id    int,
    owner_id   int
);

CREATE TABLE IF NOT EXISTS visits (
    id              int,
    pet_id          int,
    visit_date      varchar(10),
    description     varchar(255)
);
