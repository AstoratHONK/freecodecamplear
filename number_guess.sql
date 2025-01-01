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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: score; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.score (
    sesion_id integer NOT NULL,
    user_id integer NOT NULL,
    sesions_id integer NOT NULL,
    score integer
);


ALTER TABLE public.score OWNER TO freecodecamp;

--
-- Name: score_sesion_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.score_sesion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.score_sesion_id_seq OWNER TO freecodecamp;

--
-- Name: score_sesion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.score_sesion_id_seq OWNED BY public.score.sesion_id;


--
-- Name: sesion; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sesion (
    sesion_id integer NOT NULL,
    user_id integer NOT NULL,
    pop integer
);


ALTER TABLE public.sesion OWNER TO freecodecamp;

--
-- Name: sesion_sesion_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sesion_sesion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sesion_sesion_id_seq OWNER TO freecodecamp;

--
-- Name: sesion_sesion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sesion_sesion_id_seq OWNED BY public.sesion.sesion_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: score sesion_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.score ALTER COLUMN sesion_id SET DEFAULT nextval('public.score_sesion_id_seq'::regclass);


--
-- Name: sesion sesion_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sesion ALTER COLUMN sesion_id SET DEFAULT nextval('public.sesion_sesion_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: score; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: sesion; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sesion VALUES (227, 66, NULL);
INSERT INTO public.sesion VALUES (228, 66, NULL);
INSERT INTO public.sesion VALUES (229, 67, NULL);
INSERT INTO public.sesion VALUES (230, 67, NULL);
INSERT INTO public.sesion VALUES (231, 66, NULL);
INSERT INTO public.sesion VALUES (232, 66, NULL);
INSERT INTO public.sesion VALUES (233, 66, NULL);
INSERT INTO public.sesion VALUES (234, 68, NULL);
INSERT INTO public.sesion VALUES (235, 69, 23);
INSERT INTO public.sesion VALUES (236, 68, NULL);
INSERT INTO public.sesion VALUES (237, 70, 455);
INSERT INTO public.sesion VALUES (238, 70, 460);
INSERT INTO public.sesion VALUES (239, 71, 669);
INSERT INTO public.sesion VALUES (240, 71, 746);
INSERT INTO public.sesion VALUES (241, 70, 9);
INSERT INTO public.sesion VALUES (242, 70, 155);
INSERT INTO public.sesion VALUES (243, 70, 345);
INSERT INTO public.sesion VALUES (244, 72, 516);
INSERT INTO public.sesion VALUES (245, 72, 853);
INSERT INTO public.sesion VALUES (246, 73, 848);
INSERT INTO public.sesion VALUES (247, 73, 39);
INSERT INTO public.sesion VALUES (248, 72, 559);
INSERT INTO public.sesion VALUES (249, 72, 186);
INSERT INTO public.sesion VALUES (250, 72, 125);
INSERT INTO public.sesion VALUES (251, 74, 747);
INSERT INTO public.sesion VALUES (252, 74, 532);
INSERT INTO public.sesion VALUES (253, 75, 283);
INSERT INTO public.sesion VALUES (254, 75, 541);
INSERT INTO public.sesion VALUES (255, 74, 313);
INSERT INTO public.sesion VALUES (256, 74, 584);
INSERT INTO public.sesion VALUES (257, 74, 569);
INSERT INTO public.sesion VALUES (258, 68, 4);
INSERT INTO public.sesion VALUES (259, 68, 10);
INSERT INTO public.sesion VALUES (260, 68, NULL);
INSERT INTO public.sesion VALUES (261, 76, 962);
INSERT INTO public.sesion VALUES (262, 76, 352);
INSERT INTO public.sesion VALUES (263, 77, 530);
INSERT INTO public.sesion VALUES (264, 77, 44);
INSERT INTO public.sesion VALUES (265, 76, 380);
INSERT INTO public.sesion VALUES (266, 76, 881);
INSERT INTO public.sesion VALUES (267, 76, 618);
INSERT INTO public.sesion VALUES (268, 78, NULL);
INSERT INTO public.sesion VALUES (269, 78, NULL);
INSERT INTO public.sesion VALUES (270, 79, NULL);
INSERT INTO public.sesion VALUES (271, 79, NULL);
INSERT INTO public.sesion VALUES (272, 78, NULL);
INSERT INTO public.sesion VALUES (273, 78, NULL);
INSERT INTO public.sesion VALUES (274, 78, NULL);
INSERT INTO public.sesion VALUES (275, 80, NULL);
INSERT INTO public.sesion VALUES (276, 80, NULL);
INSERT INTO public.sesion VALUES (277, 81, NULL);
INSERT INTO public.sesion VALUES (278, 81, NULL);
INSERT INTO public.sesion VALUES (279, 80, NULL);
INSERT INTO public.sesion VALUES (280, 80, NULL);
INSERT INTO public.sesion VALUES (281, 80, NULL);
INSERT INTO public.sesion VALUES (282, 82, 437);
INSERT INTO public.sesion VALUES (283, 82, 439);
INSERT INTO public.sesion VALUES (284, 83, 689);
INSERT INTO public.sesion VALUES (285, 83, 175);
INSERT INTO public.sesion VALUES (286, 82, 407);
INSERT INTO public.sesion VALUES (287, 82, 895);
INSERT INTO public.sesion VALUES (288, 82, 236);
INSERT INTO public.sesion VALUES (289, 84, 680);
INSERT INTO public.sesion VALUES (290, 84, 119);
INSERT INTO public.sesion VALUES (291, 85, 979);
INSERT INTO public.sesion VALUES (292, 85, 39);
INSERT INTO public.sesion VALUES (293, 84, 730);
INSERT INTO public.sesion VALUES (294, 84, 651);
INSERT INTO public.sesion VALUES (295, 84, 985);
INSERT INTO public.sesion VALUES (296, 86, NULL);
INSERT INTO public.sesion VALUES (297, 86, NULL);
INSERT INTO public.sesion VALUES (298, 87, NULL);
INSERT INTO public.sesion VALUES (299, 87, NULL);
INSERT INTO public.sesion VALUES (300, 86, NULL);
INSERT INTO public.sesion VALUES (301, 86, NULL);
INSERT INTO public.sesion VALUES (302, 86, NULL);
INSERT INTO public.sesion VALUES (303, 88, NULL);
INSERT INTO public.sesion VALUES (304, 88, NULL);
INSERT INTO public.sesion VALUES (305, 89, NULL);
INSERT INTO public.sesion VALUES (306, 89, NULL);
INSERT INTO public.sesion VALUES (307, 88, NULL);
INSERT INTO public.sesion VALUES (308, 88, NULL);
INSERT INTO public.sesion VALUES (309, 88, NULL);
INSERT INTO public.sesion VALUES (310, 68, NULL);
INSERT INTO public.sesion VALUES (311, 68, NULL);
INSERT INTO public.sesion VALUES (312, 90, NULL);
INSERT INTO public.sesion VALUES (313, 90, NULL);
INSERT INTO public.sesion VALUES (314, 91, NULL);
INSERT INTO public.sesion VALUES (315, 91, NULL);
INSERT INTO public.sesion VALUES (316, 90, NULL);
INSERT INTO public.sesion VALUES (317, 90, NULL);
INSERT INTO public.sesion VALUES (318, 90, NULL);
INSERT INTO public.sesion VALUES (319, 92, 532);
INSERT INTO public.sesion VALUES (320, 92, 756);
INSERT INTO public.sesion VALUES (321, 93, 912);
INSERT INTO public.sesion VALUES (322, 93, 425);
INSERT INTO public.sesion VALUES (323, 92, 628);
INSERT INTO public.sesion VALUES (324, 92, 90);
INSERT INTO public.sesion VALUES (325, 92, 252);
INSERT INTO public.sesion VALUES (326, 94, 911);
INSERT INTO public.sesion VALUES (327, 94, 199);
INSERT INTO public.sesion VALUES (328, 95, 703);
INSERT INTO public.sesion VALUES (329, 95, 506);
INSERT INTO public.sesion VALUES (330, 94, 38);
INSERT INTO public.sesion VALUES (331, 94, 238);
INSERT INTO public.sesion VALUES (332, 94, 476);
INSERT INTO public.sesion VALUES (333, 96, 858);
INSERT INTO public.sesion VALUES (334, 96, 146);
INSERT INTO public.sesion VALUES (335, 97, 684);
INSERT INTO public.sesion VALUES (336, 97, 808);
INSERT INTO public.sesion VALUES (337, 96, 427);
INSERT INTO public.sesion VALUES (338, 96, 591);
INSERT INTO public.sesion VALUES (339, 96, 190);
INSERT INTO public.sesion VALUES (340, 98, 142);
INSERT INTO public.sesion VALUES (341, 98, 210);
INSERT INTO public.sesion VALUES (342, 99, 255);
INSERT INTO public.sesion VALUES (343, 99, 624);
INSERT INTO public.sesion VALUES (344, 98, 456);
INSERT INTO public.sesion VALUES (345, 98, 253);
INSERT INTO public.sesion VALUES (346, 98, 449);
INSERT INTO public.sesion VALUES (347, 100, 742);
INSERT INTO public.sesion VALUES (348, 100, 420);
INSERT INTO public.sesion VALUES (349, 101, 524);
INSERT INTO public.sesion VALUES (350, 101, 790);
INSERT INTO public.sesion VALUES (351, 100, 906);
INSERT INTO public.sesion VALUES (352, 100, 733);
INSERT INTO public.sesion VALUES (353, 100, 769);
INSERT INTO public.sesion VALUES (354, 102, 348);
INSERT INTO public.sesion VALUES (355, 102, 125);
INSERT INTO public.sesion VALUES (356, 103, 443);
INSERT INTO public.sesion VALUES (357, 103, 426);
INSERT INTO public.sesion VALUES (358, 102, 209);
INSERT INTO public.sesion VALUES (359, 102, 242);
INSERT INTO public.sesion VALUES (360, 102, 339);
INSERT INTO public.sesion VALUES (361, 104, NULL);
INSERT INTO public.sesion VALUES (362, 68, NULL);
INSERT INTO public.sesion VALUES (363, 105, 789);
INSERT INTO public.sesion VALUES (364, 105, 655);
INSERT INTO public.sesion VALUES (365, 106, 370);
INSERT INTO public.sesion VALUES (366, 106, 85);
INSERT INTO public.sesion VALUES (367, 105, 851);
INSERT INTO public.sesion VALUES (368, 105, 264);
INSERT INTO public.sesion VALUES (369, 105, 425);
INSERT INTO public.sesion VALUES (370, 107, 407);
INSERT INTO public.sesion VALUES (371, 107, 238);
INSERT INTO public.sesion VALUES (372, 108, 139);
INSERT INTO public.sesion VALUES (373, 108, 828);
INSERT INTO public.sesion VALUES (374, 107, 265);
INSERT INTO public.sesion VALUES (375, 107, 990);
INSERT INTO public.sesion VALUES (376, 107, 832);
INSERT INTO public.sesion VALUES (377, 68, NULL);
INSERT INTO public.sesion VALUES (378, 109, 274);
INSERT INTO public.sesion VALUES (379, 109, 356);
INSERT INTO public.sesion VALUES (380, 110, 419);
INSERT INTO public.sesion VALUES (381, 110, 722);
INSERT INTO public.sesion VALUES (382, 109, 707);
INSERT INTO public.sesion VALUES (383, 109, 321);
INSERT INTO public.sesion VALUES (384, 109, 599);
INSERT INTO public.sesion VALUES (385, 111, 121);
INSERT INTO public.sesion VALUES (386, 111, 834);
INSERT INTO public.sesion VALUES (387, 112, 221);
INSERT INTO public.sesion VALUES (388, 112, 590);
INSERT INTO public.sesion VALUES (389, 111, 321);
INSERT INTO public.sesion VALUES (390, 111, 479);
INSERT INTO public.sesion VALUES (391, 111, 73);
INSERT INTO public.sesion VALUES (392, 113, 833);
INSERT INTO public.sesion VALUES (393, 113, 677);
INSERT INTO public.sesion VALUES (394, 114, 654);
INSERT INTO public.sesion VALUES (395, 114, 718);
INSERT INTO public.sesion VALUES (396, 113, 936);
INSERT INTO public.sesion VALUES (397, 113, 482);
INSERT INTO public.sesion VALUES (398, 113, 382);
INSERT INTO public.sesion VALUES (399, 115, 120);
INSERT INTO public.sesion VALUES (400, 115, 675);
INSERT INTO public.sesion VALUES (401, 116, 499);
INSERT INTO public.sesion VALUES (402, 116, 170);
INSERT INTO public.sesion VALUES (403, 115, 584);
INSERT INTO public.sesion VALUES (404, 115, 376);
INSERT INTO public.sesion VALUES (405, 115, 441);
INSERT INTO public.sesion VALUES (406, 117, 101);
INSERT INTO public.sesion VALUES (407, 117, 741);
INSERT INTO public.sesion VALUES (408, 118, 188);
INSERT INTO public.sesion VALUES (409, 118, 882);
INSERT INTO public.sesion VALUES (410, 117, 785);
INSERT INTO public.sesion VALUES (411, 117, 305);
INSERT INTO public.sesion VALUES (412, 117, 10);
INSERT INTO public.sesion VALUES (413, 119, 606);
INSERT INTO public.sesion VALUES (414, 119, 80);
INSERT INTO public.sesion VALUES (415, 120, 88);
INSERT INTO public.sesion VALUES (416, 120, 836);
INSERT INTO public.sesion VALUES (417, 119, 105);
INSERT INTO public.sesion VALUES (418, 119, 801);
INSERT INTO public.sesion VALUES (419, 119, 127);
INSERT INTO public.sesion VALUES (420, 121, 951);
INSERT INTO public.sesion VALUES (421, 121, 716);
INSERT INTO public.sesion VALUES (422, 122, 955);
INSERT INTO public.sesion VALUES (423, 122, 322);
INSERT INTO public.sesion VALUES (424, 121, 45);
INSERT INTO public.sesion VALUES (425, 121, 291);
INSERT INTO public.sesion VALUES (426, 121, 777);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (66, 'user_1735751609958');
INSERT INTO public.users VALUES (67, 'user_1735751609957');
INSERT INTO public.users VALUES (68, 'ast');
INSERT INTO public.users VALUES (69, 'asd');
INSERT INTO public.users VALUES (70, 'user_1735752018116');
INSERT INTO public.users VALUES (71, 'user_1735752018115');
INSERT INTO public.users VALUES (72, 'user_1735752088265');
INSERT INTO public.users VALUES (73, 'user_1735752088264');
INSERT INTO public.users VALUES (74, 'user_1735752107527');
INSERT INTO public.users VALUES (75, 'user_1735752107526');
INSERT INTO public.users VALUES (76, 'user_1735752675446');
INSERT INTO public.users VALUES (77, 'user_1735752675445');
INSERT INTO public.users VALUES (78, 'user_1735753346187');
INSERT INTO public.users VALUES (79, 'user_1735753346186');
INSERT INTO public.users VALUES (80, 'user_1735753388837');
INSERT INTO public.users VALUES (81, 'user_1735753388836');
INSERT INTO public.users VALUES (82, 'user_1735753436239');
INSERT INTO public.users VALUES (83, 'user_1735753436238');
INSERT INTO public.users VALUES (84, 'user_1735753681455');
INSERT INTO public.users VALUES (85, 'user_1735753681454');
INSERT INTO public.users VALUES (86, 'user_1735753736495');
INSERT INTO public.users VALUES (87, 'user_1735753736494');
INSERT INTO public.users VALUES (88, 'user_1735753773727');
INSERT INTO public.users VALUES (89, 'user_1735753773726');
INSERT INTO public.users VALUES (90, 'user_1735753829497');
INSERT INTO public.users VALUES (91, 'user_1735753829496');
INSERT INTO public.users VALUES (92, 'user_1735753849996');
INSERT INTO public.users VALUES (93, 'user_1735753849995');
INSERT INTO public.users VALUES (94, 'user_1735753880221');
INSERT INTO public.users VALUES (95, 'user_1735753880220');
INSERT INTO public.users VALUES (96, 'user_1735753959171');
INSERT INTO public.users VALUES (97, 'user_1735753959170');
INSERT INTO public.users VALUES (98, 'user_1735754010088');
INSERT INTO public.users VALUES (99, 'user_1735754010087');
INSERT INTO public.users VALUES (100, 'user_1735754047667');
INSERT INTO public.users VALUES (101, 'user_1735754047666');
INSERT INTO public.users VALUES (102, 'user_1735754053450');
INSERT INTO public.users VALUES (103, 'user_1735754053449');
INSERT INTO public.users VALUES (104, 'asty');
INSERT INTO public.users VALUES (105, 'user_1735754080494');
INSERT INTO public.users VALUES (106, 'user_1735754080493');
INSERT INTO public.users VALUES (107, 'user_1735754150565');
INSERT INTO public.users VALUES (108, 'user_1735754150564');
INSERT INTO public.users VALUES (109, 'user_1735754186259');
INSERT INTO public.users VALUES (110, 'user_1735754186258');
INSERT INTO public.users VALUES (111, 'user_1735754191467');
INSERT INTO public.users VALUES (112, 'user_1735754191466');
INSERT INTO public.users VALUES (113, 'user_1735754195263');
INSERT INTO public.users VALUES (114, 'user_1735754195262');
INSERT INTO public.users VALUES (115, 'user_1735754260517');
INSERT INTO public.users VALUES (116, 'user_1735754260516');
INSERT INTO public.users VALUES (117, 'user_1735754264465');
INSERT INTO public.users VALUES (118, 'user_1735754264464');
INSERT INTO public.users VALUES (119, 'user_1735754268015');
INSERT INTO public.users VALUES (120, 'user_1735754268014');
INSERT INTO public.users VALUES (121, 'user_1735754271911');
INSERT INTO public.users VALUES (122, 'user_1735754271910');


--
-- Name: score_sesion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.score_sesion_id_seq', 14626, true);


--
-- Name: sesion_sesion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sesion_sesion_id_seq', 426, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 122, true);


--
-- Name: score score_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.score
    ADD CONSTRAINT score_pkey PRIMARY KEY (sesion_id);


--
-- Name: sesion sesion_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sesion
    ADD CONSTRAINT sesion_pkey PRIMARY KEY (sesion_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: sesion sesion_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sesion
    ADD CONSTRAINT sesion_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

