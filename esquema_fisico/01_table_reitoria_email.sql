CREATE TABLE IF NOT EXISTS reitoria_email(
    id INTEGER SERIAL NOT NULL,
    reitoria_id INT NOT NULL, /* Foreign key */
    Email VARCHAR(30),
    PRIMARY KEY (id)
);