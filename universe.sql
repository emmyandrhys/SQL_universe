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
    name character varying(30) NOT NULL,
    distance numeric NOT NULL,
    type text,
    local_group boolean,
    iau_id integer
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
-- Name: iau; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.iau (
    iau_id integer NOT NULL,
    object_type text,
    name character varying(30) NOT NULL
);


ALTER TABLE public.iau OWNER TO freecodecamp;

--
-- Name: iau_names_iau_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.iau_names_iau_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iau_names_iau_id_seq OWNER TO freecodecamp;

--
-- Name: iau_names_iau_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.iau_names_iau_id_seq OWNED BY public.iau.iau_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius integer,
    planet_id integer,
    gm numeric,
    iau_id integer
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
    dwarf boolean,
    radius numeric,
    mass numeric,
    star_id integer,
    gm numeric,
    number_of_moons integer,
    iau_id integer
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
    type character varying(30),
    constellation text,
    galaxy_id integer,
    iau_id integer
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
-- Name: iau iau_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.iau ALTER COLUMN iau_id SET DEFAULT nextval('public.iau_names_iau_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0.0265, 'SBbc', true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 0.025, 'Irr', true, 15);
INSERT INTO public.galaxy VALUES (3, 'ESO 383-76', 654, 'BrCIG', false, 16);
INSERT INTO public.galaxy VALUES (4, 'Maffei 1', 11, 'E3', false, 17);
INSERT INTO public.galaxy VALUES (5, 'Hercules A', 210, 'NLRG', false, 18);
INSERT INTO public.galaxy VALUES (6, 'Andromeda', 2.538, 'SA(s)b', true, 19);
INSERT INTO public.galaxy VALUES (7, 'NGC 262', 287, 'Sy2', false, 20);
INSERT INTO public.galaxy VALUES (8, 'Draco Dwarf', 0.0701, 'E pec', true, 21);
INSERT INTO public.galaxy VALUES (9, 'CEERS-93316', 34684, NULL, false, 22);


--
-- Data for Name: iau; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.iau VALUES (1, 'moon', 'Moon');
INSERT INTO public.iau VALUES (2, 'planet', 'Mercury');
INSERT INTO public.iau VALUES (3, 'planet', 'Venus');
INSERT INTO public.iau VALUES (4, 'planet', 'Earth');
INSERT INTO public.iau VALUES (5, 'planet', 'Mars');
INSERT INTO public.iau VALUES (6, 'planet', 'Jupiter');
INSERT INTO public.iau VALUES (7, 'planet', 'Saturn');
INSERT INTO public.iau VALUES (8, 'planet', 'Uranus');
INSERT INTO public.iau VALUES (9, 'planet', 'Neptune');
INSERT INTO public.iau VALUES (10, 'planet', 'Pluto');
INSERT INTO public.iau VALUES (11, 'planet', 'Ceres');
INSERT INTO public.iau VALUES (12, 'planet', 'Eris');
INSERT INTO public.iau VALUES (13, 'planet', 'Makemake');
INSERT INTO public.iau VALUES (14, 'planet', 'Haumea');
INSERT INTO public.iau VALUES (15, 'galaxy', 'CMa Dwarf');
INSERT INTO public.iau VALUES (16, 'galaxy', 'ESO 383-76');
INSERT INTO public.iau VALUES (17, 'galaxy', 'PGC 9892');
INSERT INTO public.iau VALUES (18, 'galaxy', 'Herc A');
INSERT INTO public.iau VALUES (19, 'galaxy', 'M31');
INSERT INTO public.iau VALUES (20, 'galaxy', 'NGC 262');
INSERT INTO public.iau VALUES (21, 'galaxy', 'UGC 10822');
INSERT INTO public.iau VALUES (22, 'galaxy', 'CEERS-93316');
INSERT INTO public.iau VALUES (23, 'star', 'Alpha UMi');
INSERT INTO public.iau VALUES (24, 'star', 'Alph Cen A');
INSERT INTO public.iau VALUES (25, 'star', '58 Ori');
INSERT INTO public.iau VALUES (26, 'star', 'ADS 3823');
INSERT INTO public.iau VALUES (27, 'star', '3 Lyrae');
INSERT INTO public.iau VALUES (28, 'star', 'Cor Scorpii');
INSERT INTO public.iau VALUES (29, 'star', '9 CMa');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737, 3, 4902.8, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 11, 4, 0.00071, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 6, 4, 0.000096, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 1821, 5, 5959.9, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 1561, 5, 3232.7, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2631, 5, 9887.8, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410, 5, 7179.3, NULL);
INSERT INTO public.moon VALUES (8, 'Amalthea', 84, 5, 0.16456, NULL);
INSERT INTO public.moon VALUES (9, 'Himalia', 85, 5, 0.15155, NULL);
INSERT INTO public.moon VALUES (10, 'Thebe', 49, 5, 0.03015, NULL);
INSERT INTO public.moon VALUES (11, 'Adrastea', 8, 5, 0.00014, NULL);
INSERT INTO public.moon VALUES (12, 'Metis', 22, 5, 0.00250, NULL);
INSERT INTO public.moon VALUES (13, 'Mimas', 198, 6, 2.50349, NULL);
INSERT INTO public.moon VALUES (14, 'Enceladus', 252, 6, 7.21037, NULL);
INSERT INTO public.moon VALUES (15, 'Tethys', 531, 6, 41.21353, NULL);
INSERT INTO public.moon VALUES (16, 'Dione', 561, 6, 73.11607, NULL);
INSERT INTO public.moon VALUES (17, 'Rhea', 764, 6, 153.94175, NULL);
INSERT INTO public.moon VALUES (18, 'Titan', 2575, 6, 8978.137, NULL);
INSERT INTO public.moon VALUES (19, 'Hyperion', 135, 6, 0.37049, NULL);
INSERT INTO public.moon VALUES (20, 'Iapetus', 734, 6, 120.51511, NULL);
INSERT INTO public.moon VALUES (21, 'Ariel', 579, 7, 83.5, NULL);
INSERT INTO public.moon VALUES (22, 'Umbriel', 585, 7, 85.1, NULL);
INSERT INTO public.moon VALUES (23, 'Triton', 1353, 8, 1428.495, NULL);
INSERT INTO public.moon VALUES (24, 'Nereid', 170, 8, 0.00000, NULL);
INSERT INTO public.moon VALUES (25, 'Charon', 606, 10, 105.88, NULL);
INSERT INTO public.moon VALUES (26, 'Nix', 18, 10, 0.0030, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 2439.4, 0.330103, NULL, NULL, 0, 2);
INSERT INTO public.planet VALUES (2, 'Venus', false, 6051.8, 4.86731, NULL, NULL, 0, 3);
INSERT INTO public.planet VALUES (3, 'Earth', false, 6371.01, 5.97217, NULL, 398600.436, 1, 4);
INSERT INTO public.planet VALUES (4, 'Mars', false, 3389.5, 0.64169, NULL, 42828.37, 2, 5);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 69911, 1898.125, NULL, 126686531.9, 92, 6);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 58232, 568.317, NULL, 37931206.23, 83, 7);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 25362, 86.8099, NULL, 5793951.3, 27, 8);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 24622, 102.4092, NULL, 6835099.97, 14, 9);
INSERT INTO public.planet VALUES (10, 'Pluto', true, 1188.3, 13029, NULL, 869.61, 5, 10);
INSERT INTO public.planet VALUES (9, 'Ceres', true, 469.7, 938.416, NULL, NULL, 0, 11);
INSERT INTO public.planet VALUES (11, 'Eris', true, 1200, 16600, NULL, NULL, 0, 12);
INSERT INTO public.planet VALUES (12, 'Makemake', true, 714, 3100, NULL, NULL, 0, 13);
INSERT INTO public.planet VALUES (13, 'Haumea', true, 715, 4006, NULL, NULL, 0, 14);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sirius A', 'white main-sequence', 'Canis Major', 1, NULL);
INSERT INTO public.star VALUES (1, 'Sun', 'yellow dwarf', NULL, 1, NULL);
INSERT INTO public.star VALUES (3, 'Polaris', 'Cepheid variable star', 'Ursa Minor', 1, 24);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 'main sequence white dwarf', 'Centaurus', 1, 25);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'bright red supergiant', 'Orion', 1, 26);
INSERT INTO public.star VALUES (6, 'Rigel A', 'blue-white supergiant', 'Orion', 1, 27);
INSERT INTO public.star VALUES (7, 'Vega', 'white dwarf', 'Lyra', 1, 28);
INSERT INTO public.star VALUES (8, 'Antares', 'red supergiant', 'Scorpio', 1, 29);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: iau_names_iau_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.iau_names_iau_id_seq', 29, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: iau iau_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.iau
    ADD CONSTRAINT iau_id UNIQUE (iau_id);


--
-- Name: iau iau_names_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.iau
    ADD CONSTRAINT iau_names_pkey PRIMARY KEY (iau_id);


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
-- Name: star star_name_key2; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key2 UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_iau_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_iau_name_fkey FOREIGN KEY (iau_id) REFERENCES public.iau(iau_id);


--
-- Name: moon moon_iau_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_iau_name_fkey FOREIGN KEY (iau_id) REFERENCES public.iau(iau_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_iau_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_iau_name_fkey FOREIGN KEY (iau_id) REFERENCES public.iau(iau_id);


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
-- Name: star star_iau_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_iau_name_fkey FOREIGN KEY (iau_id) REFERENCES public.iau(iau_id);


--
-- PostgreSQL database dump complete
--

