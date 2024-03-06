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
    description text,
    is_spherical boolean,
    has_life boolean,
    stars_in_billions integer,
    diameter_in_light_years integer,
    light_years_from_earth numeric
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
    name character varying(30) NOT NULL,
    planet_id integer,
    is_spherical boolean,
    has_life boolean,
    year_discovered integer,
    discovered_by text,
    diameter_in_miles integer,
    miles_from_earth numeric
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constellation text,
    is_spherical boolean,
    has_life boolean,
    age_in_millions_of_years integer,
    year_discovered integer,
    light_years_from_earth numeric
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    description text,
    is_spherical boolean,
    has_life boolean,
    orbit_length_days integer,
    diameter_in_miles integer,
    parsecs_from_earth numeric
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
    galaxy_id integer,
    description text,
    is_spherical boolean,
    has_life boolean,
    age_in_millions_of_years integer,
    diameter_in_miles integer,
    light_years_from_earth numeric
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
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'A spiral galaxy made of stars, dust, and gas.', false, true, 250, 105700, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'A spiral galaxy made of stars, dust, and gas with a central bulge.', false, false, 1000, 220000, 2.537);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A spiral galaxy with a bright cluster of star forming areas in the center.', false, false, 40, 60000, 2.723);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'An elliptical galaxy with a large central bulge and a bright nucleus.', false, false, 100, 50000, 2.935);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'A spiral galaxy with two pronounced curving arms.', false, false, 100, 60000, 31);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'An irregular galaxy and a satellite galaxy of the Milky Way.', false, false, 20, 14000, 1.58);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Moon', 3, true, false, NULL, 'Known to Ancients', 2159, NULL);
INSERT INTO public.moon VALUES (22, 'Ganymede', 5, true, false, 1610, 'Galileo', 3273, NULL);
INSERT INTO public.moon VALUES (23, 'Europa', 5, true, false, 1610, 'Galileo', 1940, NULL);
INSERT INTO public.moon VALUES (24, 'Callisto', 5, true, false, 1610, 'Galileo', 2995, NULL);
INSERT INTO public.moon VALUES (25, 'Titan', 6, true, false, 1655, 'C. Huygens', 3200, NULL);
INSERT INTO public.moon VALUES (26, 'Io', 5, true, false, 1610, 'Galileo', 2264, NULL);
INSERT INTO public.moon VALUES (27, 'Prometheus', 6, false, false, 1980, 'Voyager Science Team', 54, NULL);
INSERT INTO public.moon VALUES (28, 'Deimos', 4, false, false, 1877, 'A. Hall', 8, NULL);
INSERT INTO public.moon VALUES (29, 'Mimas', 6, true, false, 1789, 'W. Herschel', 246, NULL);
INSERT INTO public.moon VALUES (30, 'Rhea', 6, true, false, 1672, 'G.D. Cassini', 949, NULL);
INSERT INTO public.moon VALUES (31, 'Ariel', 7, true, false, 1851, 'W. Lassell', 719, NULL);
INSERT INTO public.moon VALUES (32, 'Enceladus', 6, true, false, 1789, 'W. Herschel', 313, NULL);
INSERT INTO public.moon VALUES (33, 'Iapetus', 6, true, false, 1671, 'G.D. Cassini', 913, NULL);
INSERT INTO public.moon VALUES (34, 'Phobos', 4, false, false, 1877, 'A. Hall', 14, NULL);
INSERT INTO public.moon VALUES (35, 'Dione', 6, true, false, 1684, 'G.D. Cassini', 698, NULL);
INSERT INTO public.moon VALUES (36, 'Triton', 8, true, false, 1846, 'W. Lassell', 1682, NULL);
INSERT INTO public.moon VALUES (37, 'Umbriel', 7, true, false, 1851, 'W. Lassell', 727, NULL);
INSERT INTO public.moon VALUES (38, 'Hyperion', 6, false, false, 1848, 'W.C. Bond, G.P. Bond, W. Lassell', 168, NULL);
INSERT INTO public.moon VALUES (39, 'Adrastea', 5, true, false, 1979, 'Voyager Science Team', 10, NULL);
INSERT INTO public.moon VALUES (40, 'Himalia', 5, true, false, 1904, 'C.D. Perrine', 106, NULL);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Horsehead Nebula', 'Orion', false, NULL, NULL, 1888, NULL);
INSERT INTO public.nebula VALUES (2, 'Cat’s Eye Nebula', 'Draco', false, NULL, NULL, 1786, NULL);
INSERT INTO public.nebula VALUES (3, 'Owl Nebula', 'Ursa Major', true, NULL, NULL, 1781, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'The smallet planet in our solar system and closest to the Sun.', true, false, 88, 3032, 0.0000063823);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'The hottest planet in our solar system and closest to Earth.', true, false, 225, 7521, 0.0000073915);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Home sweet home.', true, true, 365, 7917, 0);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Known as the Red Planet, it is dusty, cold, and desert like with evidence of weather, ice caps, and volcanoes.', true, false, 687, 4212, 0.000010661);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'A gas giant with an atmosphere of hydrogen and helium. Its distinct stripes and swirls are cold, windy clouds made of ammonia and water.', true, false, 4329, 86881, 0.000026554);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'A gas giant with a complex system of seven icy rings. Its yellow color comes from ammonia crystals in the atmosphere, which is home to electrical storms.', true, false, 10753, 72367, 0.000051865);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'An ice giant, the coldest planet in our system, and the only planet that spins on its side.', true, false, 30663, 31518, 0.00009701);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'An ice giant known as the Blue Giant and has supersonic winds reaching speeds of 1200 mph.', true, false, 60148, 30599, 0.00014965);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 4, 'An Earth like exoplanet within the Goldilocks zone of its star. It is one of the closest known exoplanets to Earth.', true, false, 11, 7918, 1.295);
INSERT INTO public.planet VALUES (10, 'Kepler-22B', 7, 'A water-covered exoplanet with visible jet streams and clouds within its system’s Goldilocks zone.', true, false, 290, 19002, 200);
INSERT INTO public.planet VALUES (11, 'Kepler-69C', 8, 'An explanet once thought to be a super-Earth but is now recognized as a super-Venus and uninhabitable.', true, false, 242, 13539, 746);
INSERT INTO public.planet VALUES (12, 'Kepler-62F', 9, 'A super-Earth explanet located within its system’s Goldilocks zone. It is completely covered by water with no land in sight.', true, false, 267, 11164, 300);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 1, 'The center of our solar system and our only star. A yellow dwarf star that sustains all life on planet Earth.', true, false, 4600, 865370, 0.0000158);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'The brightest star in the night sky. Part of the constellation Canis Major, one of Orion’s hunting dogs.', true, false, 230, 1500000, 8.611);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'A red supergiant star and visible by the naked eye. Part of the constellation Orion located in his upper left shoulder.', true, false, 10, 766000000, 700);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 1, 'A trio of stars and nearest star system to our sun. Theory suggests a 75% chance of hosting a potentially habitable planet.', true, false, 5000, 133320, 4.367);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'A bluish-white color and is the brightest star in the constellation Lyra the Harp.', true, false, 450, 2000000, 25.05);
INSERT INTO public.star VALUES (6, 'Polaris', 1, 'Known as the North Star and actually a triple star, however, movement is not detectable. Earth’s axis points almost exactly to Polaris.', true, false, 70, 28000000, 447.6);
INSERT INTO public.star VALUES (7, 'Kepler-22', 1, 'A G-type star similar to ours though smaller and cooler. Part of the constellation Cygnus or the Swan.', true, false, 4000, 846000, 619);
INSERT INTO public.star VALUES (8, 'Kepler-69', 1, 'A G-type star similar to ours. Part of the constellation Cygnus or the Swan.', true, false, 9800, NULL, 2700);
INSERT INTO public.star VALUES (9, 'Kepler-62', 1, 'A K-type star.', true, false, 7000, 553330, 1200);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


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
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

