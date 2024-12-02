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
-- Name: civilization; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.civilization (
    civilization_id integer NOT NULL,
    name character varying(20) NOT NULL,
    type character varying(20),
    inhabited_percent_galaxy numeric(4,1),
    galaxy_id integer
);


ALTER TABLE public.civilization OWNER TO freecodecamp;

--
-- Name: civilization_civilization_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.civilization_civilization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.civilization_civilization_id_seq OWNER TO freecodecamp;

--
-- Name: civilization_civilization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.civilization_civilization_id_seq OWNED BY public.civilization.civilization_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    type character varying(20) NOT NULL,
    diameter_light_year numeric(6,2) NOT NULL,
    total_star_in_billions integer,
    life boolean DEFAULT false
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
    name character varying(20) NOT NULL,
    type character varying(20),
    tidal_locking boolean DEFAULT true,
    chemical_structure text,
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    type character varying(20),
    total_hour_in_day integer,
    oxygen_and_water boolean DEFAULT true,
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
    name character varying(20) NOT NULL,
    type character varying(20),
    color character varying(20),
    temperature numeric(8,4),
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
-- Name: civilization civilization_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization ALTER COLUMN civilization_id SET DEFAULT nextval('public.civilization_civilization_id_seq'::regclass);


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
-- Data for Name: civilization; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.civilization VALUES (1, 'Eryndari', 'Psionic Organics', 42.7, 1);
INSERT INTO public.civilization VALUES (2, 'Vulkrex', 'Reptilian Warmongers', 18.3, 2);
INSERT INTO public.civilization VALUES (3, 'Zynthari', 'Synthetic Intellects', 62.1, 3);
INSERT INTO public.civilization VALUES (4, 'Myralith', 'Aquatic Explorers', 11.4, 4);
INSERT INTO public.civilization VALUES (5, 'Thraxian', 'Hive-Mind Insectoids', 37.9, 5);
INSERT INTO public.civilization VALUES (6, 'Aurethian', 'Energy Beings', 88.2, 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Ecliptica', 'Dwarf Spheroidal', 4000.12, 90, true);
INSERT INTO public.galaxy VALUES (2, 'Cryostra', 'Barred Spiral', 3648.87, 120, false);
INSERT INTO public.galaxy VALUES (3, 'Aetherion', 'Grand Design Spiral', 3275.43, 135, true);
INSERT INTO public.galaxy VALUES (4, 'Oblivion', 'Elliptical', 5245.03, 250, true);
INSERT INTO public.galaxy VALUES (5, 'Luminaris', 'Irregular', 2101.34, 190, false);
INSERT INTO public.galaxy VALUES (6, 'Nyxheim', 'Lenticular', 900.78, 110, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Zytherion', 'Volcanic', true, 'Carbon-rich silicates, basalt crust, iron deposits, faint methane traces.', 1);
INSERT INTO public.moon VALUES (2, 'Orinthar', 'Icy', true, 'Frozen water, ammonia crystals, carbon compounds, silicate-rich core.', 2);
INSERT INTO public.moon VALUES (3, 'Velcronis', 'Rocky', false, 'Sulfates, silicate dust, rare magnesium oxides, traces of organic residue.', 3);
INSERT INTO public.moon VALUES (4, 'Draylith', 'Desert-like', false, 'Silica, iron hydroxides, volcanic minerals, thin rocky crust.', 4);
INSERT INTO public.moon VALUES (5, 'Kryonix', 'Frozen', true, 'Methane ice, nitrogen deposits, carbon dioxide, ammonia-based compounds.', 5);
INSERT INTO public.moon VALUES (6, 'Quarvith', 'Temperate', false, 'Carbonates, silica, iron oxides, faint sulfuric acid residues, regolith crust.', 6);
INSERT INTO public.moon VALUES (7, 'Fenrythia', 'Volcanic', true, 'Pyroxenes, olivine, high titanium deposits, volcanic emissions observed.', 7);
INSERT INTO public.moon VALUES (8, 'Auralyn', 'Icy', true, 'Ammonia, frozen methane, water ice deposits, silicate core structure.', 9);
INSERT INTO public.moon VALUES (9, 'Lynthor', 'Rocky', true, 'Magnetite, carbonaceous silicates, faint iron traces, organic molecules found.', 8);
INSERT INTO public.moon VALUES (10, 'Zarvion', 'Desert-like', true, 'Frozen water, carbonates, basaltic crust, magnesium oxide traces.', 10);
INSERT INTO public.moon VALUES (11, 'Velcora', 'Temperate', false, 'Silica, sulfides, iron hydroxides, faint volcanic minerals, organic residue.', 11);
INSERT INTO public.moon VALUES (12, 'Mythralis', 'Icy', false, 'Rare silicates, carbon compounds, ammonia deposits, rocky surface layer.', 18);
INSERT INTO public.moon VALUES (13, 'Tynorax', 'Rocky', true, 'Basalt, olivine, pyroxenes, high iron and nickel content, faint methane.', 19);
INSERT INTO public.moon VALUES (14, 'Gralythos', 'Frozen', false, 'Carbon-rich crust, silicate dust, frozen nitrogen and methane deposits.', 20);
INSERT INTO public.moon VALUES (15, 'Jovanyth', 'Icy', true, 'Ammonia-based compounds, water ice crust, carbon dioxide traces, silicates.', 21);
INSERT INTO public.moon VALUES (16, 'Perythra', 'Rocky', false, 'Hematite, basalt crust, rare sulfates, faint carbon residue, silicates.', 22);
INSERT INTO public.moon VALUES (17, 'Luntharion', 'Volcanic', false, 'Silica, iron deposits, magnesium oxides, volcanic residue, organic molecules.', 23);
INSERT INTO public.moon VALUES (18, 'Exovaris', 'Temperate', true, 'Carbonates, silicate rocks, faint methane traces, water ice observed.', 24);
INSERT INTO public.moon VALUES (19, 'Thermyon', 'Volcanic', false, 'Pyroxenes, magnetite, olivine, iron-rich crust, volcanic minerals present.', 27);
INSERT INTO public.moon VALUES (20, 'Cryvolis', 'Frozen', true, 'Frozen carbon dioxide, ammonia crystals, silicate-rich surface, nitrogen ice.', 25);
INSERT INTO public.moon VALUES (21, 'Helvionis', 'Rocky', false, 'Rare sulfides, silicates, faint organic deposits, rocky crust, basalt layers.', 26);
INSERT INTO public.moon VALUES (22, 'Xylaris', 'Icy', false, 'Carbon dioxide, frozen water ice, ammonia traces, silicate minerals found.', 28);
INSERT INTO public.moon VALUES (23, 'Vyntheris', 'Frozen', true, 'Methane ice, nitrogen deposits, faint basalt crust, olivine-rich core.', 29);
INSERT INTO public.moon VALUES (24, 'Ostralix', 'Rocky', false, 'Sulfides, silica, iron oxides, faint volcanic emissions, silicate crust.', 30);
INSERT INTO public.moon VALUES (25, 'Braylithos', 'Icy', true, 'Carbon compounds, frozen water ice, ammonia-rich crust, faint methane observed.', 31);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Zerathis', 'Roky', 23, true, 1);
INSERT INTO public.planet VALUES (2, 'Aqualon', 'Ocean', 18, true, 1);
INSERT INTO public.planet VALUES (3, 'Pyrrhos', 'Volcanic', 28, false, 1);
INSERT INTO public.planet VALUES (4, 'Cryora', 'Ice', 16, true, 2);
INSERT INTO public.planet VALUES (5, 'Oblivara', 'Desert', 31, true, 2);
INSERT INTO public.planet VALUES (6, 'Lumivor', 'Gas Giant', 9, false, 3);
INSERT INTO public.planet VALUES (7, 'Elythera', 'Temperate', 24, true, 3);
INSERT INTO public.planet VALUES (8, 'Molthar', 'Lava', 35, false, 4);
INSERT INTO public.planet VALUES (9, 'Verdalis', 'Forest', 22, true, 4);
INSERT INTO public.planet VALUES (10, 'Nyxora', 'Dark', 0, true, 5);
INSERT INTO public.planet VALUES (11, 'Tyranix', 'Rocky', 29, false, 5);
INSERT INTO public.planet VALUES (18, 'Aetheron', 'Gas Giant', 11, false, 6);
INSERT INTO public.planet VALUES (19, 'Ignithor', 'Volcanic', 33, false, 6);
INSERT INTO public.planet VALUES (20, 'Thalassos', 'Ocean', 17, true, 7);
INSERT INTO public.planet VALUES (21, 'Xeraphis', 'Desert', 29, true, 7);
INSERT INTO public.planet VALUES (22, 'Cyrana', 'Ice', 19, true, 8);
INSERT INTO public.planet VALUES (23, 'Solvaris', 'Temperate', 20, false, 8);
INSERT INTO public.planet VALUES (24, 'Noctarion', 'Rocky', 27, true, 9);
INSERT INTO public.planet VALUES (25, 'Zephyra', 'Forest', 21, true, 9);
INSERT INTO public.planet VALUES (26, 'Umbrexis', 'Gas Giant', 8, false, 10);
INSERT INTO public.planet VALUES (27, 'Arcanis', 'Magma', 36, false, 10);
INSERT INTO public.planet VALUES (28, 'Hydrelia', 'Ocean', 20, true, 11);
INSERT INTO public.planet VALUES (29, 'Nebyron', 'Gas Giant', 12, false, 11);
INSERT INTO public.planet VALUES (30, 'Frostalis', 'Ice', 18, true, 12);
INSERT INTO public.planet VALUES (31, 'Drakthora', 'Rocky', 26, true, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Solara', 'Main Sequence', 'Yellow', 5778.1234, 1);
INSERT INTO public.star VALUES (2, 'Aetheris', 'Red Giant', 'Red', 3500.5678, 1);
INSERT INTO public.star VALUES (3, 'Luminis', 'Red Giant', 'Red', 1000.8765, 2);
INSERT INTO public.star VALUES (4, 'Ignis', 'Blue Giant', 'Blue', 2500.5467, 2);
INSERT INTO public.star VALUES (5, 'Umbra', 'Brown Dwarf', 'Brown', 1200.4567, 3);
INSERT INTO public.star VALUES (6, 'Stellara', 'Neutron Star', 'Blue-White', 1600.0000, 3);
INSERT INTO public.star VALUES (7, 'Flareon', 'Main Sequence', 'Orange', 4800.9876, 4);
INSERT INTO public.star VALUES (8, 'Pyrona', 'Hypergiant', 'Yellow-White', 9000.6543, 4);
INSERT INTO public.star VALUES (9, 'Noctis', 'Black Hole Star', 'Black', 0.0000, 5);
INSERT INTO public.star VALUES (10, 'Glaciallis', 'White Dwarf', 'White', 8000.5432, 5);
INSERT INTO public.star VALUES (11, 'Aquilion', 'Blue Supergiant', 'Blue', 9000.0000, 6);
INSERT INTO public.star VALUES (12, 'Obscura', 'Red Dwarf', 'Red', 3000.3253, 6);


--
-- Name: civilization_civilization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.civilization_civilization_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 31, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: civilization civilization_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_name_key UNIQUE (name);


--
-- Name: civilization civilization_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_pkey PRIMARY KEY (civilization_id);


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
-- Name: civilization civilization_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

