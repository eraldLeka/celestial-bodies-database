--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    with_earth boolean,
    has_life boolean,
    size integer,
    apparent_magnitude numeric,
    radius integer,
    description text NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    has_atmosphere boolean,
    has_life boolean,
    orbital_speed integer,
    apparent_magnitude numeric,
    radius integer,
    description text NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: pair; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.pair (
    pair_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.pair OWNER TO freecodecamp;

--
-- Name: pair_pair_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.pair_pair_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pair_pair_id_seq OWNER TO freecodecamp;

--
-- Name: pair_pair_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.pair_pair_id_seq OWNED BY public.pair.pair_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    has_satellites boolean,
    has_life boolean,
    orbital_speed integer,
    apparent_magnitude numeric,
    radius integer,
    description text NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    with_earth boolean,
    has_life boolean,
    age integer,
    apparent_magnitude numeric,
    radius integer,
    description text NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: pair pair_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.pair ALTER COLUMN pair_id SET DEFAULT nextval('public.pair_pair_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky_Way', true, true, 185000, 11.2, 25000000, 'The Milky Way is the galaxy that includes our Solar System');
INSERT INTO public.galaxy VALUES (2, 'Antennae_Galaxies', false, false, 500000, 11.2, 45000000, 'The Antennae Galaxies are undergoing a galactic collision.');
INSERT INTO public.galaxy VALUES (3, 'Andromeda_Galaxy', false, false, 220000, 3.44, 24500000, 'The Andromeda Galaxy is a barred spiral galaxy.');
INSERT INTO public.galaxy VALUES (4, 'Triangulum_Galaxy', false, false, 60000, 5.72, 32000000, 'The Triangulum Galaxy is a spiral galaxy.');
INSERT INTO public.galaxy VALUES (5, 'Centaurus_A', false, false, 60000, 6.84, 10000000, 'Centaurus A is a galaxy in the constellation of Centaurus.');
INSERT INTO public.galaxy VALUES (6, 'Hoags_Object', false, false, 121000, 16.2, 12100000, 'Hoags Object is a non-typical galaxy of the type known as a ring galaxy.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', true, false, 1, 2.5, 1737, 'The olny satellite of Earth', 3);
INSERT INTO public.moon VALUES (2, 'Io', true, false, 17, 5, 1821, 'the innermost and third-largest of the four Galilean moons of the planet Jupiter', 5);
INSERT INTO public.moon VALUES (3, 'Europa', true, false, 13, 5, 1560, 'the smallest of the four Galilean moons orbiting Jupiter', 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', true, false, 10, 4.61, 2634, 'the largest and most massive moon in the Solar System', 5);
INSERT INTO public.moon VALUES (5, 'Callisto', true, false, 8, 5, 2410, 'the second-largest moon of Jupiter', 5);
INSERT INTO public.moon VALUES (6, 'Mimas', false, false, 1, 12.9, 198, 'a moon of Saturn which was discovered in 1789', 6);
INSERT INTO public.moon VALUES (7, 'Enceladus', true, false, 14, 11.7, 252, 'the sixth-largest moon of Saturn', 6);
INSERT INTO public.moon VALUES (8, 'Tethys', false, false, 11, 10.2, 1060, 'a mid-sized moon of Saturn', 6);
INSERT INTO public.moon VALUES (9, 'Dione', false, false, 10, 10.4, 561, 'a moon of Saturn.', 6);
INSERT INTO public.moon VALUES (10, 'Rhea', true, false, 8, 10, 763, 'the second-largest moon of Saturn', 6);
INSERT INTO public.moon VALUES (11, 'Titan', true, false, 5, 8, 2574, ' the largest moon of Saturn', 6);
INSERT INTO public.moon VALUES (12, 'Lapetus', false, false, 3, 10.2, 1469, 'the third-largest natural satellite of Saturn', 6);
INSERT INTO public.moon VALUES (13, 'Hyperion', false, false, 5, 14.1, 270, 'a moon of Saturn', 6);
INSERT INTO public.moon VALUES (14, 'Miranda', false, false, 6, 15.8, 235, 'the smallest satellites of Uranus', 7);
INSERT INTO public.moon VALUES (15, 'Ariel', false, false, 5, 14.4, 578, 'the fourth-largest of the 27 known moons of Uranus', 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', true, false, 4, 14.5, 584, 'a moon of Uranus', 7);
INSERT INTO public.moon VALUES (17, 'Titania', true, false, 3, 13.9, 788, 'the largest of the moons of Uranus', 7);
INSERT INTO public.moon VALUES (18, 'Oberon', false, false, 3, 14.1, 761, 'the outermost major moon of Uranus', 7);
INSERT INTO public.moon VALUES (19, 'Triton', true, false, 4, 13.47, 1353, 'the largest natural satellite of Neptun', 8);
INSERT INTO public.moon VALUES (20, 'Charon', false, false, 1, 16.8, 606, 'the largest satellites of Pluto', 9);


--
-- Data for Name: pair; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.pair VALUES (1, 'pair_earth', 1, 1, 3, 1);
INSERT INTO public.pair VALUES (2, 'pair_jupitor', 1, 1, 5, 2);
INSERT INTO public.pair VALUES (3, 'pair_neptune', 1, 1, 8, 19);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, false, 47, 7.25, 2439, 'the smallest planet in the Solar System.', 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, false, 35, 2.98, 6051, 'the second planet from the Sun', 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, true, 29, 0, 6371, 'the third planet from the Sun.', 1);
INSERT INTO public.planet VALUES (4, 'Mars', true, false, 24, 1.86, 3389, 'the fourth planet from the Sun.', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, false, 13, 1.66, 69911, 'the fifth planet from the Sun', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', true, false, 9, 1.17, 58232, 'the sixth planet from the Sun.', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', true, false, 6, 6.03, 25362, 'the seventh planet from the Sun.', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', true, false, 5, 7.67, 24662, 'the eighth planet from the Sun.', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', true, false, 4, 13.65, 1188, 'a dwarf planet in the Kuiper belt', 1);
INSERT INTO public.planet VALUES (10, 'makemake', true, false, 4, 17, 715, 'a dwarf planet and the second-largest Kuiper belt object.', 1);
INSERT INTO public.planet VALUES (11, 'Haumea', true, false, 4, 17.3, 780, 'a dwarf planet located beyond orbit of neptune', 1);
INSERT INTO public.planet VALUES (12, 'Quaoar', true, false, 4, 19.1, 555, 'a dwarf planet in the Kuiper belt', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', true, false, 4600, 4.83, 1, 'The Sun is the star at the center of the Solar System.', 1);
INSERT INTO public.star VALUES (2, 'Stephenson 2-18', false, false, 200, 15.2, 2150, 'Stephenson 2-18 is a red supergiant star.', 2);
INSERT INTO public.star VALUES (3, 'UY Scuti', false, false, 1000, 8.29, 1708, 'UY Scutiis an extreme red hypergiant star.', 3);
INSERT INTO public.star VALUES (4, 'VY Canis Majoris', false, false, 82, 12.01, 2069, 'VY Canis Majoris is a pulsating variable star.', 4);
INSERT INTO public.star VALUES (5, 'KY Cygni', false, false, 942, 11.14, 1033, 'KY Cygni is a red supergiant star.', 5);
INSERT INTO public.star VALUES (6, 'PZ Cassiopeiae', false, false, 8, 8.2, 1062, 'PZ Cassiopeiae is a red supergiant star.', 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: pair_pair_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.pair_pair_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: pair pair_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.pair
    ADD CONSTRAINT pair_name_key UNIQUE (name);


--
-- Name: pair pair_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.pair
    ADD CONSTRAINT pair_pkey PRIMARY KEY (pair_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: pair pair_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.pair
    ADD CONSTRAINT pair_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: pair pair_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.pair
    ADD CONSTRAINT pair_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: pair pair_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.pair
    ADD CONSTRAINT pair_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: pair pair_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.pair
    ADD CONSTRAINT pair_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

