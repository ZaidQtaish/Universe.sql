--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
    shape character varying(30),
    brightest_star character varying(30),
    number_of_bright_stars integer NOT NULL,
    zodiac boolean NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: constellation_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_galaxy_id_seq OWNED BY public.constellation.galaxy_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(10),
    morphology character varying(30),
    age_in_millions_of_years numeric(30,1) NOT NULL,
    distance_from_earth_in_ly numeric(30,1) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    parent_planet character varying(10),
    surface character varying(30) NOT NULL,
    orbital_period_in_days integer NOT NULL,
    has_atmosphere boolean NOT NULL,
    description text,
    planet_id integer NOT NULL
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
-- Name: moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_id_seq OWNED BY public.moon.planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_type character varying(30) NOT NULL,
    atmosphere character varying(30) NOT NULL,
    rings boolean NOT NULL,
    earth_masses numeric(30,5),
    distance_from_earth_in_ly numeric(30,1),
    description text,
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
-- Name: planet_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_star_id_seq OWNER TO freecodecamp;

--
-- Name: planet_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_star_id_seq OWNED BY public.planet.star_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    spectral_type character varying(10) NOT NULL,
    temperature_in_kelvin integer,
    red_dwarf boolean NOT NULL,
    magnetic_field boolean NOT NULL,
    distance_from_earth_in_ly numeric(30,1) NOT NULL,
    age_in_millions_of_years numeric(30,1) NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    constellation_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


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

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: constellation galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN galaxy_id SET DEFAULT nextval('public.constellation_galaxy_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN planet_id SET DEFAULT nextval('public.moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN star_id SET DEFAULT nextval('public.planet_star_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'The Hunter', 'Betelgeuse', 7, false, 1);
INSERT INTO public.constellation VALUES (2, 'Leo', 'The Lion', 'Regulus', 5, true, 1);
INSERT INTO public.constellation VALUES (3, 'Ursa Major', 'The Great Bear', 'Dubhe', 7, false, 1);
INSERT INTO public.constellation VALUES (4, 'Scorpius', 'The Scorpion', 'Antares', 18, true, 1);
INSERT INTO public.constellation VALUES (5, 'Virgo', 'The Virgin', 'Spica', 10, true, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Barred Spiral', 13000.5, 26000.0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Normal Spiral', 22000.0, 22000.0);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'Normal Spiral', 4500.0, 300000.0);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 'SABb', 9000.0, 29300000.0);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 'Spiral', 'SABc', 20000.0, 21000000.0);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 'SAB(s)bc', 40000.0, 23000000.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Luna', 'Earth', 'Rocky', 27, false, 'Earth''s natural satellite, the Moon.', 17);
INSERT INTO public.moon VALUES (22, 'Phobos', 'Mars', 'Rocky', 0, false, 'One of Mars'' two small, irregularly shaped moons.', 17);
INSERT INTO public.moon VALUES (23, 'Deimos', 'Mars', 'Rocky', 1, false, 'Mars'' smaller, outer moon.', 17);
INSERT INTO public.moon VALUES (24, 'Io', 'Jupiter', 'Volcanic', 2, true, 'Intense volcanic activity.', 17);
INSERT INTO public.moon VALUES (25, 'Europa', 'Jupiter', 'Icy', 4, true, 'Believed to have a subsurface ocean.', 17);
INSERT INTO public.moon VALUES (26, 'Ganymede', 'Jupiter', 'Icy', 7, true, 'Largest moon in the solar system and a potential ocean world.', 17);
INSERT INTO public.moon VALUES (27, 'Callisto', 'Jupiter', 'Icy', 17, true, 'One of Jupiter''s Galilean moons with a heavily cratered surface.', 17);
INSERT INTO public.moon VALUES (28, 'Mimas', 'Saturn', 'Icy', 1, false, 'Prominent Herschel crater, resembling the "Death Star."', 17);
INSERT INTO public.moon VALUES (29, 'Enceladus', 'Saturn', 'Icy', 1, true, 'Known for its icy geysers erupting from its south pole.', 17);
INSERT INTO public.moon VALUES (30, 'Tethys', 'Saturn', 'Icy', 2, false, 'Massive impact crater called Odysseus.', 17);
INSERT INTO public.moon VALUES (31, 'Rhea', 'Saturn', 'Icy', 5, false, 'Bright, heavily cratered surface.', 17);
INSERT INTO public.moon VALUES (32, 'Iapetus', 'Saturn', 'Icy', 79, false, 'Dark leading hemisphere and a bright trailing hemisphere.', 17);
INSERT INTO public.moon VALUES (33, 'Miranda', 'Uranus', 'Rocky', 1, false, 'Unique, fragmented surface.', 17);
INSERT INTO public.moon VALUES (34, 'Ariel', 'Uranus', 'Icy', 3, false, 'Characterized by its icy and relatively smooth surface.', 17);
INSERT INTO public.moon VALUES (35, 'Umbriel', 'Uranus', 'Icy', 4, false, 'Heavily cratered terrain and dark appearance.', 17);
INSERT INTO public.moon VALUES (36, 'Titania', 'Uranus', 'Icy', 9, false, 'Varied landscape of plains, valleys, and impact craters.', 17);
INSERT INTO public.moon VALUES (37, 'Oberon', 'Uranus', 'Icy', 13, false, 'Diverse surface featuring impact craters and icy plains.', 17);
INSERT INTO public.moon VALUES (38, 'Triton', 'Neptune', 'Icy', -6, false, 'Unique retrograde orbit and geysers erupting from its surface.', 17);
INSERT INTO public.moon VALUES (39, 'Proteus', 'Neptune', 'Icy', 1, false, 'Irregularly shaped moon with a heavily cratered appearance.', 17);
INSERT INTO public.moon VALUES (40, 'Nereid', 'Neptune', 'Icy', 360, false, 'Eccentric moon with a highly elongated orbit.', 17);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Neptune', 'Ice Giant', 'Hydrogen, helium, methane', true, 17.20000, 0.0, 'deep-blue appearance and powerful storms.', 1);
INSERT INTO public.planet VALUES (16, 'Venus', 'Terrestrial', 'Thick, toxic atmosphere', false, 0.81500, 0.0, 'One of the hottest planets in the solar system.', 1);
INSERT INTO public.planet VALUES (17, 'Earth', 'Terrestrial', 'Nitrogen, oxygen', false, 1.00000, 0.0, 'Only known planet to support life.', 1);
INSERT INTO public.planet VALUES (18, 'Mars', 'Terrestrial', 'Thin atmosphere', false, 0.10700, 0.0, 'Cold, desert-like planet.', 1);
INSERT INTO public.planet VALUES (19, 'Jupiter', 'Gas Giant', 'Hydrogen, helium', true, 317.80000, 0.0, 'Gas giant with a massive storm known as the Great Red Spot.', 1);
INSERT INTO public.planet VALUES (20, 'Saturn', 'Gas Giant', 'Hydrogen, helium', true, 95.20000, 0.0, 'Stunning ring system, which consists of icy particles and rocky debris.', 1);
INSERT INTO public.planet VALUES (21, 'Uranus', 'Ice Giant', 'Hydrogen, helium, methane', true, 14.60000, 0.0, 'Bluish-green appearance due to its methane-rich atmosphere.', 1);
INSERT INTO public.planet VALUES (22, 'Proxima Centauri b', 'Terrestrial', 'Unknown', false, 1.27000, 4.2, 'Exoplanet candidate, but its atmosphere and conditions are still being studied.', 3);
INSERT INTO public.planet VALUES (23, 'Proxima Centauri c', 'Gas Giant', 'Unknown', false, 7.00000, 4.2, 'Gas giant exoplanet, but further observations are needed to confirm its existence.', 3);
INSERT INTO public.planet VALUES (24, 'Proxima Centauri d', 'Ice Giant', 'Unknown', false, 0.59000, 4.2, 'Ice giant exoplanet more research is required to confirm its presence.', 3);
INSERT INTO public.planet VALUES (25, 'Proxima Centauri e', 'Terrestrial', 'Unknown', false, 0.87000, 4.2, 'Subject to ongoing study.', 3);
INSERT INTO public.planet VALUES (26, 'Mercury', 'Terrestrial', 'Thin atmosphere', false, 0.05530, 0.0, 'Mercury is the closest planet to the Sun and is a rocky, airless world with extreme temperatures.', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 5778, false, true, 0.0, 4500.0, 'Our home star', 1, NULL);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'M5.5V', 2559, true, false, 4.2, 5617.0, 'The closest known star to the Sun', 1, NULL);
INSERT INTO public.star VALUES (5, 'M33 Star 1', 'O7V', 36000, true, false, 3000000.0, 2.0, 'Also known as Triangulum I', 2, NULL);
INSERT INTO public.star VALUES (4, 'M31 V1', 'M4V', 3200, false, true, 2500000.0, 8000.0, 'Also known as Andromeda I', 2, NULL);
INSERT INTO public.star VALUES (8, 'Betelgeuse', 'M2Iab', 3600, false, false, 643.7, 8.5, 'Red giant, It is one of the largest and brightest stars known, with a distinctive reddish appearance.', 1, 1);
INSERT INTO public.star VALUES (9, 'Regulus', 'B7V', 13000, false, false, 79.3, 1.5, 'Blue-white main-sequence star and one of the four Royal Stars of ancient Persia.', 1, 2);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 5, true);


--
-- Name: constellation_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_galaxy_id_seq', 1, false);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 26, true);


--
-- Name: planet_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_star_id_seq', 15, true);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

