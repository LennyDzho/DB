CREATE TABLE IF NOT EXISTS genres (
    id_genres SERIAL PRIMARY KEY,
    name text NOT NULL
);

CREATE TABLE IF NOT EXISTS executor (
    id_executor SERIAL PRIMARY KEY,
    name text NOT NULL
);

CREATE TABLE IF NOT EXISTS genres_executor (
    id SERIAL PRIMARY KEY,
    id_genres integer REFERENCES genres(id_genres),
    id_executor integer REFERENCES executor(id_executor)
);

CREATE TABLE IF NOT EXISTS albums (
    id_albums SERIAL PRIMARY KEY,
    id_executor integer REFERENCES executor(id_executor),
    name_albums text NOT NULL,
    release_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS executor_albums (
    id SERIAL PRIMARY KEY,
    id_executor integer REFERENCES executor(id_executor),
    id_albums integer REFERENCES albums(id_albums)
);

CREATE TABLE IF NOT EXISTS track (
    id_track SERIAL PRIMARY KEY,
    id_albums integer REFERENCES albums(id_albums),
    name_track text NOT NULL,
    duration time NOT NULL
);

CREATE TABLE IF NOT EXISTS collections (
    id_collection SERIAL PRIMARY KEY,
    name_collection text NOT NULL,
    date_collection DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS collection_track (
    id_collection_track SERIAL PRIMARY KEY,
    id_collection integer NOT NULL REFERENCES collections(id_collection),
    id_track integer NOT NULL REFERENCES track(id_track)
);
