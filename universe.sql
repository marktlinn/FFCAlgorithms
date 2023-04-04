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
    name character varying(40) NOT NULL,
    description text,
    known_to_be_inhabited boolean,
    age_in_millions_of_years integer,
    galaxy_id integer NOT NULL
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
    name character varying(40) NOT NULL,
    planet_id integer,
    made_of_cheese boolean,
    color character varying(30)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    distance_from_earth_tkm numeric,
    inhabited boolean,
    age_in_millions_of_years integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_earth_tkm numeric,
    galaxy_id integer,
    twinkle boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: superhero; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.superhero (
    name character varying(30),
    planet_id integer NOT NULL,
    superhero_id integer NOT NULL,
    nemesis character varying(30),
    franchise character varying(30)
);


ALTER TABLE public.superhero OWNER TO freecodecamp;

--
-- Name: superhero_home_planet_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.superhero_home_planet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.superhero_home_planet_seq OWNER TO freecodecamp;

--
-- Name: superhero_home_planet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.superhero_home_planet_seq OWNED BY public.superhero.planet_id;


--
-- Name: superhero_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.superhero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.superhero_id_seq OWNER TO freecodecamp;

--
-- Name: superhero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.superhero_id_seq OWNED BY public.superhero.superhero_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: superhero planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.superhero ALTER COLUMN planet_id SET DEFAULT nextval('public.superhero_home_planet_seq'::regclass);


--
-- Name: superhero superhero_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.superhero ALTER COLUMN superhero_id SET DEFAULT nextval('public.superhero_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('The Milkyway', 'A Spiral galaxy of gas and dust', true, 14, 1);
INSERT INTO public.galaxy VALUES ('Andromdea', NULL, NULL, NULL, 6);
INSERT INTO public.galaxy VALUES ('Canis Major Dwarf', NULL, NULL, NULL, 7);
INSERT INTO public.galaxy VALUES ('Virgo A', NULL, NULL, NULL, 8);
INSERT INTO public.galaxy VALUES ('Maffei I & II', NULL, NULL, NULL, 9);
INSERT INTO public.galaxy VALUES ('Magellanic Clouds', NULL, NULL, NULL, 10);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'europa', 4, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Ganymede', 4, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Callisto', 4, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Himalia', 4, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Pan', 4, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Atlas', 4, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Prometheus', 4, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Pandora', 4, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Janus', 4, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Epimetheus', 4, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Mimas', 4, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Moon', 5, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Phobos', 5, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Enceladus', 6, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Tethys', 6, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Dione', 6, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Rhea', 6, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Titan', 6, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Hyperion', 6, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Iapetus', 6, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Phoebe', 6, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Puck', 6, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Miranda', 6, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (4, 'Jupiter', 'Largest planet in Solar system', 883.22, false, 5, 1);
INSERT INTO public.planet VALUES (5, 'Earth', 'Home of Spindau Ballet', 0.0, false, 5, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, NULL, true, NULL, 6);
INSERT INTO public.planet VALUES (7, 'Venus', NULL, NULL, true, NULL, 7);
INSERT INTO public.planet VALUES (8, 'Mars', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES (9, 'Mercury', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (10, 'Uranus', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (11, 'Neptune', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (13, 'Pluto', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (14, 'Ceres', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (15, 'Eris', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (16, 'Haumea', NULL, NULL, NULL, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centaurus', 4.246, 1, NULL);
INSERT INTO public.star VALUES (6, 'Alpha Centauri', NULL, NULL, true);
INSERT INTO public.star VALUES (7, 'Aldebaran', NULL, NULL, true);
INSERT INTO public.star VALUES (8, 'Antares', NULL, NULL, NULL);
INSERT INTO public.star VALUES (9, 'Canopus', NULL, NULL, NULL);
INSERT INTO public.star VALUES (10, 'Sun', NULL, NULL, NULL);


--
-- Data for Name: superhero; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.superhero VALUES ('Superman', 5, 1, NULL, NULL);
INSERT INTO public.superhero VALUES ('Spiderman', 5, 2, NULL, NULL);
INSERT INTO public.superhero VALUES ('Wolverine', 5, 3, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 23, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 16, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 10, true);


--
-- Name: superhero_home_planet_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.superhero_home_planet_seq', 1, false);


--
-- Name: superhero_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.superhero_id_seq', 3, true);


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
-- Name: star star_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key1 UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: superhero superhero_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.superhero
    ADD CONSTRAINT superhero_name_key UNIQUE (name);


--
-- Name: superhero superhero_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.superhero
    ADD CONSTRAINT superhero_pkey PRIMARY KEY (superhero_id);


--
-- Name: moon moon_nearest_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_nearest_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_nearest_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_nearest_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: superhero superhero_home_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.superhero
    ADD CONSTRAINT superhero_home_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

