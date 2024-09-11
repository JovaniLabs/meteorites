--create a temp table to import the csv data
CREATE TABLE IF NOT EXISTS meteorites_temp(
    name TEXT,
    id INT,
    nametype TEXT,
    class TEXT,
    mass TEXT,
    discovery TEXT,
    year DATE,
    lat TEXT,
    long TEXT
);

--final table is created with desired specifications

CREATE TABLE IF NOT EXISTS meteorites(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    class TEXT NOT NULL,
    mass DECIMAL(8,2),
    discovery TEXT CHECK(discovery IN ('Fell', 'Found')),
    year INT,
    lat DECIMAL(8,2),
    long DECIMAL(8,2)

);

--import csv data into temp table
.import --csv meteorites.csv meteorites_temp

--insert cleaned data to final table
INSERT INTO meteorites(name, class, mass, discovery, year, lat, long)
SELECT
    name,
    class,
    --mass:convert empty string to NULL else we round to 2 decimal places.
    CASE
        WHEN mass = '' THEN NULL
        ELSE ROUND(CAST(mass AS DECIMAL(8,2)), 2)
    END,
    discovery,
    --year:convert empty string to NULL else cast year as an integer
    CASE
        WHEN year = '' THEN NULL
        ELSE CAST(year AS INT)
    END,
    --lat:convert empty string to NULL else we round to 2 decimal places.
    CASE
        WHEN lat = '' THEN NULL
        ELSE ROUND(CAST(lat AS DECIMAL(8,2)), 2)
    END,
    --long:convert empty string to NULL else we round to 2 decimal places.
    CASE
        WHEN long = '' THEN NULL
        ELSE ROUND(CAST(long AS DECIMAL(8,2)),2 )
    END
FROM meteorites_temp
WHERE nametype != 'Relict'
AND (discovery = 'Fell' OR discovery = 'Found')
AND name IS NOT NULL
ORDER BY CAST(year AS INT), name;

--clean the temp table
DROP TABLE IF EXISTS meteorites_temp;
