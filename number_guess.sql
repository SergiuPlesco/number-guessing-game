--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    player_id integer NOT NULL,
    guess_count integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    player_name character varying(22) NOT NULL,
    player_id integer NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (3, 4, 3);
INSERT INTO public.games VALUES (4, 4, 6);
INSERT INTO public.games VALUES (5, 5, 357);
INSERT INTO public.games VALUES (6, 5, 726);
INSERT INTO public.games VALUES (7, 6, 986);
INSERT INTO public.games VALUES (8, 6, 783);
INSERT INTO public.games VALUES (9, 5, 610);
INSERT INTO public.games VALUES (10, 5, 571);
INSERT INTO public.games VALUES (11, 5, 478);
INSERT INTO public.games VALUES (12, 7, 805);
INSERT INTO public.games VALUES (13, 7, 578);
INSERT INTO public.games VALUES (14, 8, 467);
INSERT INTO public.games VALUES (15, 8, 917);
INSERT INTO public.games VALUES (16, 7, 529);
INSERT INTO public.games VALUES (17, 7, 110);
INSERT INTO public.games VALUES (18, 7, 944);
INSERT INTO public.games VALUES (19, 9, 37);
INSERT INTO public.games VALUES (20, 9, 971);
INSERT INTO public.games VALUES (21, 10, 469);
INSERT INTO public.games VALUES (22, 10, 547);
INSERT INTO public.games VALUES (23, 9, 930);
INSERT INTO public.games VALUES (24, 9, 267);
INSERT INTO public.games VALUES (25, 9, 589);
INSERT INTO public.games VALUES (26, 11, 926);
INSERT INTO public.games VALUES (27, 11, 524);
INSERT INTO public.games VALUES (28, 12, 814);
INSERT INTO public.games VALUES (29, 12, 120);
INSERT INTO public.games VALUES (30, 11, 82);
INSERT INTO public.games VALUES (31, 11, 415);
INSERT INTO public.games VALUES (32, 11, 728);
INSERT INTO public.games VALUES (33, 13, 212);
INSERT INTO public.games VALUES (34, 13, 162);
INSERT INTO public.games VALUES (35, 14, 573);
INSERT INTO public.games VALUES (36, 14, 524);
INSERT INTO public.games VALUES (37, 13, 601);
INSERT INTO public.games VALUES (38, 13, 811);
INSERT INTO public.games VALUES (39, 13, 592);
INSERT INTO public.games VALUES (40, 15, 922);
INSERT INTO public.games VALUES (41, 15, 128);
INSERT INTO public.games VALUES (42, 16, 89);
INSERT INTO public.games VALUES (43, 16, 260);
INSERT INTO public.games VALUES (44, 15, 411);
INSERT INTO public.games VALUES (45, 15, 630);
INSERT INTO public.games VALUES (46, 15, 226);
INSERT INTO public.games VALUES (47, 17, 623);
INSERT INTO public.games VALUES (48, 17, 216);
INSERT INTO public.games VALUES (49, 18, 761);
INSERT INTO public.games VALUES (50, 18, 204);
INSERT INTO public.games VALUES (51, 17, 669);
INSERT INTO public.games VALUES (52, 17, 790);
INSERT INTO public.games VALUES (53, 17, 113);
INSERT INTO public.games VALUES (54, 19, 468);
INSERT INTO public.games VALUES (55, 19, 755);
INSERT INTO public.games VALUES (56, 20, 884);
INSERT INTO public.games VALUES (57, 20, 381);
INSERT INTO public.games VALUES (58, 19, 127);
INSERT INTO public.games VALUES (59, 19, 107);
INSERT INTO public.games VALUES (60, 19, 807);
INSERT INTO public.games VALUES (61, 21, 849);
INSERT INTO public.games VALUES (62, 21, 905);
INSERT INTO public.games VALUES (63, 22, 53);
INSERT INTO public.games VALUES (64, 22, 707);
INSERT INTO public.games VALUES (65, 21, 238);
INSERT INTO public.games VALUES (66, 21, 364);
INSERT INTO public.games VALUES (67, 21, 168);
INSERT INTO public.games VALUES (68, 23, 589);
INSERT INTO public.games VALUES (69, 23, 370);
INSERT INTO public.games VALUES (70, 24, 224);
INSERT INTO public.games VALUES (71, 24, 761);
INSERT INTO public.games VALUES (72, 23, 759);
INSERT INTO public.games VALUES (73, 23, 806);
INSERT INTO public.games VALUES (74, 23, 996);
INSERT INTO public.games VALUES (75, 25, 97);
INSERT INTO public.games VALUES (76, 25, 892);
INSERT INTO public.games VALUES (77, 26, 150);
INSERT INTO public.games VALUES (78, 26, 795);
INSERT INTO public.games VALUES (79, 25, 937);
INSERT INTO public.games VALUES (80, 25, 127);
INSERT INTO public.games VALUES (81, 25, 935);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES ('Sergiu', 4);
INSERT INTO public.players VALUES ('user_1769856406404', 5);
INSERT INTO public.players VALUES ('user_1769856406403', 6);
INSERT INTO public.players VALUES ('user_1769856755971', 7);
INSERT INTO public.players VALUES ('user_1769856755970', 8);
INSERT INTO public.players VALUES ('user_1769856791220', 9);
INSERT INTO public.players VALUES ('user_1769856791219', 10);
INSERT INTO public.players VALUES ('user_1769857390980', 11);
INSERT INTO public.players VALUES ('user_1769857390979', 12);
INSERT INTO public.players VALUES ('user_1769857474156', 13);
INSERT INTO public.players VALUES ('user_1769857474155', 14);
INSERT INTO public.players VALUES ('user_1769857554626', 15);
INSERT INTO public.players VALUES ('user_1769857554625', 16);
INSERT INTO public.players VALUES ('user_1769857887643', 17);
INSERT INTO public.players VALUES ('user_1769857887642', 18);
INSERT INTO public.players VALUES ('user_1769858127687', 19);
INSERT INTO public.players VALUES ('user_1769858127686', 20);
INSERT INTO public.players VALUES ('user_1769858159882', 21);
INSERT INTO public.players VALUES ('user_1769858159881', 22);
INSERT INTO public.players VALUES ('user_1769858197038', 23);
INSERT INTO public.players VALUES ('user_1769858197037', 24);
INSERT INTO public.players VALUES ('user_1769858468550', 25);
INSERT INTO public.players VALUES ('user_1769858468549', 26);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 81, true);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 26, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players number_guessing_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT number_guessing_username_key UNIQUE (player_name);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: games games_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- PostgreSQL database dump complete
--

