CREATE TABLE mygap_certification (
    id SERIAL PRIMARY KEY,
    certification_name VARCHAR(255) NOT NULL,
    date_issued DATE NOT NULL,
    valid_until DATE NOT NULL,
    farm_id INTEGER NOT NULL,
    FOREIGN KEY (farm_id) REFERENCES farms(id)
);