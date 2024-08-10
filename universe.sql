--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    messier_objects integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellations_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellations_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellations_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_to_earth_in_mly integer,
    type text,
    diameter_in_mly numeric(4,1)
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
    name character varying(30),
    absolute_magnitude numeric(3,1),
    planet_id integer NOT NULL,
    eccentricity numeric(6,4)
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    is_geophysical boolean,
    is_an_exoplanet boolean,
    star_id integer NOT NULL
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
    name character varying(30),
    lifetime_stage text,
    temperature integer,
    galaxy_id integer NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellations_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 3);
INSERT INTO public.constellation VALUES (2, 'Cassiopeia', 2);
INSERT INTO public.constellation VALUES (3, 'Perseus', 2);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', 2, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 53, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 31, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'Milky Way', 0, NULL, NULL);
INSERT INTO public.galaxy VALUES (8, 'Triangulum Galaxy', 3, NULL, NULL);
INSERT INTO public.galaxy VALUES (9, 'Sombrero Galaxy', 31, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 0.2, 2, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.3, 3, NULL);
INSERT INTO public.moon VALUES (3, 'Ganymede', 4.6, 4, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 5.8, 4, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 5.2, 4, NULL);
INSERT INTO public.moon VALUES (6, 'Callisto', 6.0, 4, NULL);
INSERT INTO public.moon VALUES (7, 'Amalthea', 12.0, 4, NULL);
INSERT INTO public.moon VALUES (8, 'Himalia', 13.2, 4, NULL);
INSERT INTO public.moon VALUES (9, 'Elara', 14.1, 4, NULL);
INSERT INTO public.moon VALUES (10, 'Carme', 14.0, 4, NULL);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 14.7, 4, NULL);
INSERT INTO public.moon VALUES (12, 'Titan', 8.4, 12, NULL);
INSERT INTO public.moon VALUES (13, 'Rhea', 9.0, 12, NULL);
INSERT INTO public.moon VALUES (14, 'Iapetus', 10.0, 12, NULL);
INSERT INTO public.moon VALUES (15, 'Dione', 9.4, 12, NULL);
INSERT INTO public.moon VALUES (16, 'Tethys', 10.2, 12, NULL);
INSERT INTO public.moon VALUES (17, 'Enceladus', 10.3, 12, NULL);
INSERT INTO public.moon VALUES (18, 'Miranda', 13.6, 13, NULL);
INSERT INTO public.moon VALUES (19, 'Ariel', 13.3, 13, NULL);
INSERT INTO public.moon VALUES (20, 'Umbriel', 13.7, 13, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Earth', true, false, 4);
INSERT INTO public.planet VALUES (3, 'Mars', true, false, 4);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, false, 4);
INSERT INTO public.planet VALUES (5, 'Mercury', true, false, 4);
INSERT INTO public.planet VALUES (6, 'Venus', true, false, 4);
INSERT INTO public.planet VALUES (7, 'Proxima Centauri b', false, true, 5);
INSERT INTO public.planet VALUES (8, 'Kepler-7b', false, true, 1);
INSERT INTO public.planet VALUES (9, 'WASP-12b', false, true, 2);
INSERT INTO public.planet VALUES (10, 'Kepler-70b', false, true, 3);
INSERT INTO public.planet VALUES (11, 'Kepler-56b', false, true, 6);
INSERT INTO public.planet VALUES (12, 'Saturn', false, false, 4);
INSERT INTO public.planet VALUES (13, 'Uranus', false, false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'M31-V1', 'Cepheid Variable Star', 5000, 4);
INSERT INTO public.star VALUES (2, 'V1', 'Cepheid Variable Star', 5000, 5);
INSERT INTO public.star VALUES (3, 'SN 1994I', 'Supernova (Type Ic)', 10000, 6);
INSERT INTO public.star VALUES (4, 'Sun', 'Main Sequence', 5500, 7);
INSERT INTO public.star VALUES (5, 'M33-V19', 'Eclipsing Binary System mainly in Main Sequence or Giant phases', 3000, 8);
INSERT INTO public.star VALUES (6, 'SN 2003B', 'Supernova (Type Ia)', 10000, 9);


--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellations_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellations_pkey PRIMARY KEY (constellation_id);


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

