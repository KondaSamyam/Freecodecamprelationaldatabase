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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions numeric(6,2),
    type character varying(30),
    is_active boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_description; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_description (
    galaxy_description_id integer NOT NULL,
    description text NOT NULL,
    galaxy_id integer,
    name character varying(30)
);


ALTER TABLE public.galaxy_description OWNER TO freecodecamp;

--
-- Name: galaxy_description_desc_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_description_desc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_description_desc_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_description_desc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_description_desc_id_seq OWNED BY public.galaxy_description.galaxy_description_id;


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
    name character varying(30) NOT NULL,
    age_in_millions numeric(6,2),
    is_habitable boolean,
    has_ice_water boolean,
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions numeric(6,2),
    no_of_moon integer,
    has_life boolean NOT NULL,
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
    name character varying(30) NOT NULL,
    age_in_millions numeric(6,2),
    no_of_planets integer,
    is_supernova boolean,
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
-- Name: galaxy_description galaxy_description_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_description ALTER COLUMN galaxy_description_id SET DEFAULT nextval('public.galaxy_description_desc_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 1000.00, 'Spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 1300.00, 'Spiral', true);
INSERT INTO public.galaxy VALUES (4, 'Triangulum Galaxy', 1200.00, 'Spiral', true);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 1400.00, 'Spiral', true);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 1300.00, 'Elliptical', false);
INSERT INTO public.galaxy VALUES (5, 'Sombrereo Galaxy', 1300.00, 'Spiral', false);


--
-- Data for Name: galaxy_description; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_description VALUES (1, 'A large spiral galaxy, known for its central bulge and prominent spiral arms.', 1, 'Milky Way Galaxy');
INSERT INTO public.galaxy_description VALUES (2, 'An elliptical galaxy, mostly composed of older stars, with little star formation.', 2, 'Andromeda Galaxy');
INSERT INTO public.galaxy_description VALUES (3, 'A barred spiral galaxy, known for its distinct bar-shaped structure.', 3, 'Messier 81 Galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4500.00, true, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 4500.00, false, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 4500.00, false, false, 2);
INSERT INTO public.moon VALUES (4, 'Io', 4600.00, false, false, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 4600.00, true, true, 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4600.00, true, true, 4);
INSERT INTO public.moon VALUES (7, 'Callisto', 4600.00, false, false, 4);
INSERT INTO public.moon VALUES (8, 'Titan', 4500.00, false, true, 5);
INSERT INTO public.moon VALUES (9, 'Encleladus', 4500.00, true, true, 5);
INSERT INTO public.moon VALUES (10, 'Rhea', 4500.00, false, false, 5);
INSERT INTO public.moon VALUES (11, 'Triton', 4600.00, true, true, 6);
INSERT INTO public.moon VALUES (12, 'Miranda', 4600.00, false, false, 6);
INSERT INTO public.moon VALUES (13, 'Ariel', 4600.00, false, false, 6);
INSERT INTO public.moon VALUES (14, 'Oberon', 4600.00, false, false, 6);
INSERT INTO public.moon VALUES (15, 'Mimas', 4600.00, false, false, 5);
INSERT INTO public.moon VALUES (16, 'Charon', 4600.00, false, false, 10);
INSERT INTO public.moon VALUES (17, 'Titan II', 5000.00, false, true, 7);
INSERT INTO public.moon VALUES (18, 'Enceladus II', 5000.00, false, true, 7);
INSERT INTO public.moon VALUES (19, 'Ganymede II', 5000.00, false, true, 7);
INSERT INTO public.moon VALUES (20, 'Europa II', 5000.00, false, true, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4500.00, 1, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 4500.00, 2, false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 4600.00, 0, false, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 4600.00, 79, false, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 4500.00, 82, false, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', 4600.00, 14, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 4600.00, 27, false, 1);
INSERT INTO public.planet VALUES (8, 'Proxima b', 4.50, 0, false, 2);
INSERT INTO public.planet VALUES (9, 'Alpha Centauri Bb', 4.60, 0, false, 2);
INSERT INTO public.planet VALUES (10, 'Kelper-22b', 4.50, 0, false, 3);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 3.50, 0, false, 4);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 5.00, 0, false, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600.00, 8, false, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 5200.00, 2, false, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 8000.00, 0, true, 3);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 4500.00, 2, false, 1);
INSERT INTO public.star VALUES (5, 'Sirus A', 2000.00, 2, false, 1);
INSERT INTO public.star VALUES (6, 'Andromeda A', 1000.00, 0, true, 4);


--
-- Name: galaxy_description_desc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_description_desc_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_description galaxy_description_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_description
    ADD CONSTRAINT galaxy_description_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy_description galaxy_description_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_description
    ADD CONSTRAINT galaxy_description_pkey PRIMARY KEY (galaxy_description_id);


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
-- Name: galaxy_description galaxy_description_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_description
    ADD CONSTRAINT galaxy_description_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

