-- Active: 1713581148598@@localhost@5432@redservicios@public


CREATE TABLE tbl_departamentos (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);
CREATE TABLE tbl_cities (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    id_state INT,
    FOREIGN KEY (id_state) REFERENCES tbl_departamentos(id)
);

CREATE TABLE tbl_pointservices (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    address TEXT, 
    location POINT,
    monday_opening_time TIME,
    monday_closing_time TIME,
    tuesday_opening_time TIME,
    tuesday_closing_time TIME,
    wednesday_opening_time TIME,
    wednesday_closing_time TIME,
    thursday_opening_time TIME,
    thursday_closing_time TIME,
    friday_opening_time TIME,
    friday_closing_time TIME,
    saturday_opening_time TIME,
    saturday_closing_time TIME,
    sunday_opening_time TIME,
    sunday_closing_time TIME,
    state_id INT,
    city_id INT,
    type_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP    
);

CREATE TABLE tbl_typePoint (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP    
);

INSERT INTO tbl_pointservices (name, location, address, 
    monday_opening_time, monday_closing_time,
    tuesday_opening_time, tuesday_closing_time,
    wednesday_opening_time, wednesday_closing_time,
    thursday_opening_time, thursday_closing_time,
    friday_opening_time, friday_closing_time,
    saturday_opening_time, saturday_closing_time,
    sunday_opening_time, sunday_closing_time) 
VALUES ('Mi lugar', POINT(-73.935242, 40.730610), '123 Calle Principal, Ciudad, País', 
    '09:00:00', '18:00:00',  -- Lunes
    '09:00:00', '18:00:00',  -- Martes
    '09:00:00', '18:00:00',  -- Miércoles
    '09:00:00', '18:00:00',  -- Jueves
    '09:00:00', '18:00:00',  -- Viernes
    '10:00:00', '16:00:00',  -- Sábado
    '10:00:00', '14:00:00'); -- Domingo

SELECT
    d.id AS departamento_id,
    d.name AS departamento_name,
    c.id AS municipio_id,
    c.name AS municipio_name
FROM
    tbl_departamentos d
LEFT JOIN
    tbl_cities c
ON
    d.id = c.id_state;

    SELECT * FROM tbl_departamentos WHERE id = 1;