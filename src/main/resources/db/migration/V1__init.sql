CREATE TABLE species
(
    id          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    latin_name  VARCHAR(150) NOT NULL UNIQUE
);

CREATE INDEX idx_species_common_name ON species (common_name);

CREATE TABLE locations
(
    id     BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name   VARCHAR(150) NOT NULL,
    region VARCHAR(100)
);

CREATE TABLE tags
(
    id   BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE observations
(
    id          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    species_id  BIGINT      NOT NULL REFERENCES species (id) ON DELETE RESTRICT,
    location_id BIGINT      NOT NULL REFERENCES locations (id) ON DELETE RESTRICT,
    observed_at TIMESTAMPTZ NOT NULL,
    quantity    INT         NOT NULL DEFAULT 1,
    notes       TEXT,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_observations_species_id ON observations (species_id);
CREATE INDEX idx_observations_location_id ON observations (location_id);
CREATE INDEX idx_observations_observed_at ON observations (observed_at);

CREATE TABLE observation_tags
(
    observation_id BIGINT NOT NULL REFERENCES observations (id) ON DELETE CASCADE,
    tag_id         BIGINT NOT NULL REFERENCES tags (id) ON DELETE CASCADE,
    PRIMARY KEY (observation_id, tag_id)
);

CREATE INDEX idx_observation_tags_tag_id ON observation_tags (tag_id);