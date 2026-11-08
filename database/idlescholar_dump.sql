--
-- PostgreSQL database dump
--

\restrict L0DmAz18ZeT6hb31ick5JRdli3jd12er20sVq57EvwqZCcwladyMEXwDyqbwVkC

-- Dumped from database version 18.6 (Debian 18.6-1.pgdg13+2)
-- Dumped by pg_dump version 18.6 (Debian 18.6-1.pgdg13+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password_hash character varying(255) NOT NULL,
    email character varying(100),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.account OWNER TO postgres;

--
-- Name: account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.account_id_seq OWNER TO postgres;

--
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_id_seq OWNED BY public.account.id;


--
-- Name: achievements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.achievements (
    id integer NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    tier integer DEFAULT 1 NOT NULL,
    requirement_type character varying(50) NOT NULL,
    requirement_value bigint NOT NULL,
    reward_gold bigint NOT NULL,
    reward_exp bigint NOT NULL,
    reward_talent_point integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.achievements OWNER TO postgres;

--
-- Name: achievements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.achievements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.achievements_id_seq OWNER TO postgres;

--
-- Name: achievements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.achievements_id_seq OWNED BY public.achievements.id;


--
-- Name: character; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."character" (
    id integer NOT NULL,
    name character varying(10) NOT NULL,
    level integer DEFAULT 1 NOT NULL,
    class_type character varying(15) NOT NULL,
    experience bigint DEFAULT 0 NOT NULL,
    strength integer DEFAULT 1 NOT NULL,
    dexterity integer DEFAULT 1 NOT NULL,
    intelligence integer DEFAULT 1 NOT NULL,
    luck integer DEFAULT 1 NOT NULL,
    talents jsonb DEFAULT '{}'::jsonb NOT NULL,
    talentpoint integer DEFAULT 0 NOT NULL,
    expeditionstart bigint DEFAULT 0 NOT NULL,
    expeditionend bigint DEFAULT 0 NOT NULL,
    isonline integer DEFAULT 0 NOT NULL,
    last_seen timestamp with time zone DEFAULT now(),
    account_id integer,
    warning integer DEFAULT 0 NOT NULL,
    gold bigint DEFAULT 0 NOT NULL,
    penalty_stacks integer DEFAULT 0 NOT NULL,
    penalty_expires integer DEFAULT 0 NOT NULL,
    allowed_domains jsonb DEFAULT '[]'::jsonb,
    allowed_apps jsonb DEFAULT '[]'::jsonb,
    last_heartbeat bigint DEFAULT 0,
    activity_type integer DEFAULT 0,
    activity_level integer DEFAULT 1,
    last_processed_time bigint DEFAULT 0,
    is_paused boolean DEFAULT false,
    active_food_code character varying(50) DEFAULT NULL::character varying,
    active_food_gold_pct integer DEFAULT 0,
    active_food_exp_pct integer DEFAULT 0,
    active_food_luck_pct integer DEFAULT 0,
    barracks_start bigint DEFAULT 0,
    barracks_end bigint DEFAULT 0,
    barracks_level integer DEFAULT 1,
    total_expedition_time bigint DEFAULT 0,
    clan_id integer,
    coop_group_id integer,
    is_ready boolean DEFAULT false,
    total_crafts integer DEFAULT 0,
    total_expeditions integer DEFAULT 0,
    total_pvp_wins integer DEFAULT 0,
    total_echo_wins integer DEFAULT 0,
    total_raid_defends integer DEFAULT 0,
    total_clan_deposits bigint DEFAULT 0,
    total_blizzard_survives integer DEFAULT 0,
    total_resonance_pos integer DEFAULT 0,
    total_salvaged integer DEFAULT 0,
    total_raids_survived integer DEFAULT 0,
    total_blizzards_survived integer DEFAULT 0,
    total_focus_minutes bigint DEFAULT 0,
    total_gold_earned bigint DEFAULT 0,
    total_loot_collected bigint DEFAULT 0,
    pvp_wins integer DEFAULT 0,
    pvp_losses integer DEFAULT 0,
    tutorial_step integer DEFAULT 0
);


ALTER TABLE public."character" OWNER TO postgres;

--
-- Name: character_achievements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.character_achievements (
    character_id integer NOT NULL,
    achievement_id integer NOT NULL,
    is_completed boolean DEFAULT false,
    completed_at timestamp with time zone
);


ALTER TABLE public.character_achievements OWNER TO postgres;

--
-- Name: character_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.character_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.character_id_seq OWNER TO postgres;

--
-- Name: character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.character_id_seq OWNED BY public."character".id;


--
-- Name: character_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.character_item (
    id integer NOT NULL,
    character_id integer NOT NULL,
    item_code character varying(30) NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    equipped boolean DEFAULT false NOT NULL
);


ALTER TABLE public.character_item OWNER TO postgres;

--
-- Name: character_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.character_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.character_item_id_seq OWNER TO postgres;

--
-- Name: character_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.character_item_id_seq OWNED BY public.character_item.id;


--
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    id integer NOT NULL,
    character_id integer NOT NULL,
    gold bigint DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    level integer DEFAULT 1
);


ALTER TABLE public.city OWNER TO postgres;

--
-- Name: city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.city_id_seq OWNER TO postgres;

--
-- Name: city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.city_id_seq OWNED BY public.city.id;


--
-- Name: city_resource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city_resource (
    city_id integer NOT NULL,
    resource_type character varying(30) NOT NULL,
    amount bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.city_resource OWNER TO postgres;

--
-- Name: city_upgrade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city_upgrade (
    city_id integer NOT NULL,
    upgrade_code character varying(50) NOT NULL,
    level integer DEFAULT 1
);


ALTER TABLE public.city_upgrade OWNER TO postgres;

--
-- Name: clans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clans (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    leader_id integer,
    created_at timestamp with time zone DEFAULT now(),
    bank_gold bigint DEFAULT 0,
    active_buff character varying(50) DEFAULT NULL::character varying,
    buff_expires_at bigint DEFAULT 0
);


ALTER TABLE public.clans OWNER TO postgres;

--
-- Name: clans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clans_id_seq OWNER TO postgres;

--
-- Name: clans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clans_id_seq OWNED BY public.clans.id;


--
-- Name: coop_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coop_groups (
    id integer NOT NULL,
    leader_id integer,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.coop_groups OWNER TO postgres;

--
-- Name: coop_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coop_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coop_groups_id_seq OWNER TO postgres;

--
-- Name: coop_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coop_groups_id_seq OWNED BY public.coop_groups.id;


--
-- Name: food_recipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_recipe (
    id integer NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    cost_resource character varying(30) NOT NULL,
    cost_amount integer NOT NULL,
    buff_gold_pct integer DEFAULT 0,
    buff_exp_pct integer DEFAULT 0,
    buff_luck_pct integer DEFAULT 0,
    tier integer DEFAULT 1
);


ALTER TABLE public.food_recipe OWNER TO postgres;

--
-- Name: food_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.food_recipe_id_seq OWNER TO postgres;

--
-- Name: food_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_recipe_id_seq OWNED BY public.food_recipe.id;


--
-- Name: friendships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friendships (
    id integer NOT NULL,
    requester_id integer,
    receiver_id integer,
    status character varying(20) DEFAULT 'pending'::character varying
);


ALTER TABLE public.friendships OWNER TO postgres;

--
-- Name: friendships_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.friendships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.friendships_id_seq OWNER TO postgres;

--
-- Name: friendships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.friendships_id_seq OWNED BY public.friendships.id;


--
-- Name: item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item (
    id integer NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(30) NOT NULL,
    slot character varying(20) NOT NULL,
    attack integer DEFAULT 0 NOT NULL,
    defense integer DEFAULT 0 NOT NULL,
    luck integer DEFAULT 0 NOT NULL,
    tier integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.item OWNER TO postgres;

--
-- Name: item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.item_id_seq OWNER TO postgres;

--
-- Name: item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_id_seq OWNED BY public.item.id;


--
-- Name: potion_recipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.potion_recipe (
    id integer NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    tier integer DEFAULT 1,
    cost_resource character varying(30) NOT NULL,
    cost_amount integer NOT NULL,
    cost_gold integer DEFAULT 0,
    reward_gold integer DEFAULT 0,
    reward_exp integer DEFAULT 0,
    reward_resource character varying(30) DEFAULT NULL::character varying,
    reward_resource_amount integer DEFAULT 0
);


ALTER TABLE public.potion_recipe OWNER TO postgres;

--
-- Name: potion_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.potion_recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.potion_recipe_id_seq OWNER TO postgres;

--
-- Name: potion_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.potion_recipe_id_seq OWNED BY public.potion_recipe.id;


--
-- Name: raid_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raid_logs (
    id integer NOT NULL,
    character_id integer,
    raid_power integer NOT NULL,
    wall_defense integer NOT NULL,
    resources_lost integer NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.raid_logs OWNER TO postgres;

--
-- Name: raid_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.raid_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.raid_logs_id_seq OWNER TO postgres;

--
-- Name: raid_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.raid_logs_id_seq OWNED BY public.raid_logs.id;


--
-- Name: recipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipe (
    id integer NOT NULL,
    code character varying(50) NOT NULL,
    result_code character varying(30) NOT NULL,
    result_quantity integer DEFAULT 1 NOT NULL,
    gold_cost bigint DEFAULT 0
);


ALTER TABLE public.recipe OWNER TO postgres;

--
-- Name: recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recipe_id_seq OWNER TO postgres;

--
-- Name: recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recipe_id_seq OWNED BY public.recipe.id;


--
-- Name: recipe_ingredient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipe_ingredient (
    recipe_id integer NOT NULL,
    resource_type character varying(30) NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public.recipe_ingredient OWNER TO postgres;

--
-- Name: salvage_by_tier_slot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salvage_by_tier_slot (
    tier integer NOT NULL,
    slot character varying(20) NOT NULL,
    resource_type character varying(30) NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public.salvage_by_tier_slot OWNER TO postgres;

--
-- Name: account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account ALTER COLUMN id SET DEFAULT nextval('public.account_id_seq'::regclass);


--
-- Name: achievements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievements ALTER COLUMN id SET DEFAULT nextval('public.achievements_id_seq'::regclass);


--
-- Name: character id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."character" ALTER COLUMN id SET DEFAULT nextval('public.character_id_seq'::regclass);


--
-- Name: character_item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_item ALTER COLUMN id SET DEFAULT nextval('public.character_item_id_seq'::regclass);


--
-- Name: city id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city ALTER COLUMN id SET DEFAULT nextval('public.city_id_seq'::regclass);


--
-- Name: clans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clans ALTER COLUMN id SET DEFAULT nextval('public.clans_id_seq'::regclass);


--
-- Name: coop_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coop_groups ALTER COLUMN id SET DEFAULT nextval('public.coop_groups_id_seq'::regclass);


--
-- Name: food_recipe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_recipe ALTER COLUMN id SET DEFAULT nextval('public.food_recipe_id_seq'::regclass);


--
-- Name: friendships id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendships ALTER COLUMN id SET DEFAULT nextval('public.friendships_id_seq'::regclass);


--
-- Name: item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item ALTER COLUMN id SET DEFAULT nextval('public.item_id_seq'::regclass);


--
-- Name: potion_recipe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.potion_recipe ALTER COLUMN id SET DEFAULT nextval('public.potion_recipe_id_seq'::regclass);


--
-- Name: raid_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raid_logs ALTER COLUMN id SET DEFAULT nextval('public.raid_logs_id_seq'::regclass);


--
-- Name: recipe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe ALTER COLUMN id SET DEFAULT nextval('public.recipe_id_seq'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account (id, username, password_hash, email, created_at) FROM stdin;
95	ShadowFox	$2a$10$P18pZ7Ta3a8EAra6Q0EXsu7lxjfxZNT7Z.M.Nemdy8GL.H52dZnVy	shadowfox@example.com	2026-11-06 01:08:24.362288+03
96	LunaBlade	$2a$10$bHBL27dBh99VSMUBGXCtTeHeIpIthKQaGOLT3zSTCxcs2ZFmIkK0e	lunablade@example.com	2026-11-06 01:08:24.362288+03
3	ku4ka_pomoev	$2a$10$vdvqi0FAOJkL//MmVfGMl.dVyuH.TS/i4QQnvzZ.Q6nt/wFa97L72	abobausaaa@gmail.com	2026-10-12 00:32:31.83828+03
4	anatolii	$2a$10$4.nfKiJz33H0oDxmffsoq.bBSrbTvGHqgRk3WhyGE2.pM9El4yX.a	belovdmitrii12vk@gmail.com	2026-10-13 23:53:52.688094+03
5	sobachka123pisun4ik	$2a$10$40sjj8DmB1k9Uc0oKsbACulgj7P4XFbHli14tpwM3pTCpcW92poh6	vasek32raz@gmail.com	2026-10-14 00:01:45.678896+03
6	gambit	$2a$10$SPNPah0OxywL3af8PwhTPu/TSlFrhrMa8feXhDwzxbIMMdtUXfLAG	bonyt040@gmail.com	2026-10-14 11:00:18.766965+03
97	DarkMango	$2a$10$N0vRDQ.Nn1xutsBZ6d8ZT.23zsJDGOcxR4J6HfZ5RX2TtoNGxR7jC	darkmango@example.com	2026-11-06 01:08:24.362288+03
98	FrostByte	$2a$10$q08QM3wl3WYYbTOAq/sTheGRg.4TfLKfzdRGKF1SWrJPBDlF97uRq	frostbyte@example.com	2026-11-06 01:08:24.362288+03
9	test	$2a$10$NECL/60Ea22OtcWNVf6/xONfE2t69qwibG22nt0b.hhIwo/r8qokS	test@gmail.com	2026-10-21 01:21:25.463757+03
99	SilentWolf	$2a$10$BJkxET7Su23E4gjf3EcK.uaIY5uSy.Yo/lmsYcQY6.T.Pn6v8NkQG	silentwolf@example.com	2026-11-06 01:08:24.362288+03
100	CherryMage	$2a$10$kcBU0oYk.DUxI9b7JFjb4eJIJI0AG7DxIZsiPVLzjgpP5tZbiTWt2	cherrymage@example.com	2026-11-06 01:08:24.362288+03
12	Debil	$2a$10$OekgWNKrVe4RJVo1yAmQV.QZQ6I3RHlyI5LcPFE09v9Z11MbVkZje	belovdmitrii7@gmail.com	2026-10-22 20:25:54.246184+03
13	12312312312	$2a$10$75AJRHS5QwFbyYyFXuEQCuIfyKUr90Dt.5T4EMhTVuDa5SnCeaJ.e	123123@gmail.com	2026-10-25 17:45:59.327922+03
14	test2	$2a$10$R1PS.uEhh6y0v2lEenPKt.6F.scG/Zgsg7Gr9FXXmU97KlW7h98qu	test2@gmail.com	2026-11-03 00:13:28.840156+03
101	IronViking	$2a$10$nuo93m.g7Ek6e1LBQop1ruPVX8rMYaEEL5I3Q/3bl8WuM2VBZsBaa	ironviking@example.com	2026-11-06 01:08:24.362288+03
102	NightRaven	$2a$10$FSKgJUFvCWG2R7pORdWLkuIHxXfgooVgaZWKn2gM7g5SnNkdoodxi	nightraven@example.com	2026-11-06 01:08:24.362288+03
103	PixelKnight	$2a$10$i4P6lUrNlec6YrjlbPJNBO54SPR6jZGLjdp8wykZXqD4bET2WOq/S	pixelknight@example.com	2026-11-06 01:08:24.362288+03
104	StormBreaker	$2a$10$S8Ey4oJZAOwm27FhHn3eDuI7m.k9mRTzZVh707eaMqY1YQdchJmLG	stormbreaker@example.com	2026-11-06 01:08:24.362288+03
105	GoldenKiwi	$2a$10$K.mWD2W7QJ9Q.y.9LPNZdeS.2ZuxvKEIpYp4irmHav34VWnibYqtS	goldenkiwi@example.com	2026-11-06 01:08:24.362288+03
106	ToxicRabbit	$2a$10$ChtVse0q8YFq5Za6a5a5U.KKiVUDTWV2qAL3OFkBg0dQ/XnaI.87.	toxicrabbit@example.com	2026-11-06 01:08:24.362288+03
107	MoonWalker	$2a$10$8UM5j0ebqnNrJpfRuUHmYuvwqc4yP.1983ty9t.NCiefafuDrssBW	moonwalker@example.com	2026-11-06 01:08:24.362288+03
108	CrimsonBard	$2a$10$tgzVRhBhjtaPGLlJbnxm/eNlnRCVFTFY6hxphvspbRv/S/QL8JhZG	crimsonbard@example.com	2026-11-06 01:08:24.362288+03
109	WildBerry	$2a$10$OVXHtx7lFdgjzlg.o63Ok.pbCWrbLJwxxc/96dIjykGul06pfj9yW	wildberry@example.com	2026-11-06 01:08:24.362288+03
110	VoidHunter	$2a$10$Sb36lZBkVfuBfse/SJX2wu6WbqU1rt6aULW73SLphl/rThRaqZCnW	voidhunter@example.com	2026-11-06 01:08:24.362288+03
111	LuckyPenguin	$2a$10$QDC8UEWRw8Z68tK7Ajz7h.Ix9/J.Pw.7dTXNApFHGDF7XUlXHsM3O	luckypenguin@example.com	2026-11-06 01:08:24.362288+03
112	SilverDragon	$2a$10$JBi4rHcBFfhMgUJYtCISF.XBlBtkQEnX680nLNDXz0Rgu6xqwixKe	silverdragon@example.com	2026-11-06 01:08:24.362288+03
113	MysticOwl	$2a$10$eOnzZVpXL2DtXDLEeqLyreOb.Jw0tBRWv8dnaPV/nnrhHl/E4tDFG	mysticowl@example.com	2026-11-06 01:08:24.362288+03
114	ThunderCat	$2a$10$mvE2SKBR8Y.zAaWHn3Wy2.ieXocUr/buSrXWbaPxRwyWD.dh966Dy	thundercat@example.com	2026-11-06 01:08:24.362288+03
115	dada	$2a$10$vSnvje.amV.DjvlD8zpZyuRgP8s9pH8nsh3.fhdkEMoOYVTwiPEG2	dadadada@gmail.com	2026-11-07 21:43:58.599984+03
116	sabaka	$2a$10$emMVIeZquLIy7QUa95QHTugsE2t8h0Ufv1q/w1NH9guhsjhONoMAe	sabaka@gmail.com	2026-11-07 21:57:35.123455+03
117	novi4ok	$2a$10$a/YABLhA3Q8MxqwNBpkTneTlgQsITnKb/9vGsYFRZ7F7ygGbjAbUG	novi4ok@gmail.com	2026-11-08 08:59:40.691133+03
\.


--
-- Data for Name: achievements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.achievements (id, code, name, description, tier, requirement_type, requirement_value, reward_gold, reward_exp, reward_talent_point) FROM stdin;
1	lvl_5	Новичок	Достичь 5 уровня.	1	level	5	500	500	1
2	gold_1000	Первая тысяча	Накопить 1,000 золота.	1	gold	1000	500	500	1
3	craft_5	Ученик кузнеца	Скрафтить 5 предметов.	1	crafts	5	500	500	1
4	exp_1	Первая вылазка	Завершить 1 экспедицию.	1	expeditions	1	500	500	1
5	pvp_1	Задира	Победить в 1 PvP-рейде.	1	pvp_win	1	500	500	1
6	lvl_15	Опытный	Достичь 15 уровня.	2	level	15	1000	1000	1
7	gold_10000	Богач	Накопить 10,000 золота.	2	gold	10000	1000	1000	1
8	echo_1	Победитель эха	Победить Эхо в Зачарованном озере.	2	echo_win	1	1000	1000	1
9	clan_create	Основатель	Создать свой клан.	2	clan_leader	1	1000	1000	1
10	friend_1	Социалист	Добавить первого друга.	2	friends	1	1000	1000	1
11	lvl_30	Ветеран	Достичь 30 уровня.	3	level	30	2500	2500	1
12	craft_50	Мастер	Скрафтить 50 предметов.	3	crafts	50	2500	2500	1
13	raid_def_10	Защитник	Отбить 10 рейдов монстров.	3	raid_defend	10	2500	2500	1
14	blizzard_1	Морозостойкий	Пережить метель в Ледяном лесу.	3	blizzard_survive	1	2500	2500	1
15	clan_bank_10k	Меценат	Внести 10,000 золота в банк клана.	3	clan_deposit	10000	2500	2500	1
16	lvl_45	Элита	Достичь 45 уровня.	4	level	45	5000	5000	1
17	pvp_win_20	Гроза городов	Победить в 20 PvP-рейдах.	4	pvp_win	20	5000	5000	1
18	gold_100k	Олигарх	Накопить 100,000 золота.	4	gold	100000	5000	5000	1
19	resonance_pos	Любимец магии	Получить положительный резонанс в Башне Архимага.	4	resonance	1	5000	5000	1
20	exp_100	Путешественник	Завершить 100 экспедиций.	4	expeditions	100	5000	5000	1
21	lvl_60	Легенда	Достичь максимального 60 уровня.	5	level	60	10000	10000	1
22	craft_500	Архитектор	Скрафтить 500 предметов.	5	crafts	500	10000	10000	1
23	pvp_win_100	Император	Победить в 100 PvP-рейдах.	5	pvp_win	100	10000	10000	1
24	gold_1m	Империя	Накопить 1,000,000 золота.	5	gold	1000000	10000	10000	1
25	echo_50	Убийца эха	Победить Эхо 50 раз.	5	echo_win	50	10000	10000	1
\.


--
-- Data for Name: character; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."character" (id, name, level, class_type, experience, strength, dexterity, intelligence, luck, talents, talentpoint, expeditionstart, expeditionend, isonline, last_seen, account_id, warning, gold, penalty_stacks, penalty_expires, allowed_domains, allowed_apps, last_heartbeat, activity_type, activity_level, last_processed_time, is_paused, active_food_code, active_food_gold_pct, active_food_exp_pct, active_food_luck_pct, barracks_start, barracks_end, barracks_level, total_expedition_time, clan_id, coop_group_id, is_ready, total_crafts, total_expeditions, total_pvp_wins, total_echo_wins, total_raid_defends, total_clan_deposits, total_blizzard_survives, total_resonance_pos, total_salvaged, total_raids_survived, total_blizzards_survived, total_focus_minutes, total_gold_earned, total_loot_collected, pvp_wins, pvp_losses, tutorial_step) FROM stdin;
8	test	60	warrior	33	9	3	1	2	{"str_1": 5, "str_2": 5, "str_3": 5, "str_4": 5, "str_5": 5, "str_6": 5}	70	0	0	0	2026-10-21 01:21:52.581166+03	9	0	1471100	0	0	["google.com", "github.com"]	["emacs.exe", "discord.exe"]	1793291361	1	0	1793291390	f	\N	0	0	0	0	0	1	180	2	\N	t	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
5	Kitty	1	bard	0	2	4	3	1	{}	0	0	0	0	2026-10-13 23:54:01.518708+03	4	0	0	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	0	\N	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
10	12312312	1	warrior	0	4	3	1	2	{}	0	0	0	0	2026-10-25 17:46:47.702874+03	13	0	0	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	0	\N	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
112	Местный	1	bard	0	2	4	3	1	{}	0	0	0	0	2026-11-07 22:00:31.716592+03	116	0	0	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	0	\N	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
7	maid	1	warrior	0	4	3	1	2	{}	0	0	0	0	2026-10-14 11:01:06.570996+03	6	0	0	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	0	\N	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
6	Klusha	1	alchemist	0	2	1	3	4	{}	0	0	0	0	2026-10-14 00:02:41.401077+03	5	0	0	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	0	\N	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
9	Котик	60	warrior	100	9	3	1	2	{"dex_1": 3, "int_1": 1, "str_1": 5, "str_2": 5, "str_3": 5, "str_4": 5, "str_5": 5, "str_6": 5}	694	0	0	0	2026-10-22 20:26:36.458867+03	12	0	4913443	1	1	["google.com", "github.com"]	["emacs.exe", "discord.exe"]	1794074951	0	3	1794075540	f	\N	0	0	0	1793646786	1793675586	1	420	2	6	t	84	8	2	0	3	0	0	0	0	0	0	0	0	0	0	0	0
4	Ku4ka	60	alchemist	22693	7	1	3	4	{"dex_1": 2, "str_1": 5, "str_2": 5, "str_3": 5, "str_4": 5, "str_5": 5, "str_6": 5, "luck_1": 5, "luck_2": 2}	109	0	0	0	2026-10-12 00:32:49.865861+03	3	0	1519700	0	0	["google.com", "github.com"]	["emacs.exe", "discord.exe"]	1793654716	0	0	1793654724	f	\N	0	0	0	1794124476	1794153276	1	68468	1	\N	t	120	85	2	12	0	0	0	3	45	18	7	1250	245000	3400	15	4	0
11	test2	1	bard	520	2	4	3	1	{}	1	0	0	0	2026-11-03 00:13:41.146535+03	14	0	510	0	0	["google.com", "github.com"]	["emacs.exe", "discord.exe"]	1793654281	0	0	1793654309	f	\N	0	0	0	1793654071	1793682871	1	60	1	\N	f	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
97	Theron	14	bard	1217	4	12	10	1	{}	0	0	0	0	2026-10-17 00:20:58.767908+03	100	0	40762	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	1058496	15	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
104	Mirelle	26	alchemist	1026	7	12	20	12	{}	0	0	0	0	2026-10-17 10:34:59.541932+03	108	0	43527	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	1204145	15	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
107	Isolde	32	alchemist	2321	2	5	19	9	{}	0	0	0	0	2026-10-08 08:54:26.788565+03	97	0	662	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	1703087	15	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
92	Darian	1	warrior	56	2	13	20	11	{}	0	0	0	0	2026-10-17 16:16:17.536564+03	98	0	463	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	1410896	15	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
103	Astrid	23	bard	3579	4	2	14	8	{}	0	0	0	0	2026-10-18 21:10:36.038194+03	105	0	16335	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	140907	15	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
108	Orion	33	alchemist	3503	14	5	14	5	{}	0	0	0	0	2026-10-11 08:14:33.852722+03	101	0	46485	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	728580	15	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
95	Sylas	12	warrior	615	18	9	9	12	{}	0	0	0	0	2026-10-25 00:03:53.916335+03	111	0	9787	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	827252	15	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
106	Freya	31	alchemist	4772	8	15	19	5	{}	0	0	0	0	2026-11-05 00:44:29.881439+03	96	0	23141	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	843369	16	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
109	Aldric	40	mage	4846	6	3	19	4	{}	0	0	0	0	2026-10-26 04:07:40.684859+03	107	0	25602	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	1531660	16	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
96	Seraph	13	warrior	1935	17	13	20	1	{}	0	0	0	0	2026-10-15 04:00:03.163427+03	113	0	40690	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	1595323	16	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
93	Elara	4	warrior	444	12	2	11	6	{}	0	0	0	0	2026-10-22 20:29:59.91595+03	102	0	15901	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	1417866	16	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
105	Magnus	31	alchemist	3564	1	18	16	10	{}	0	0	0	0	2026-10-22 08:26:54.64446+03	103	0	38117	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	1034478	16	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
100	Evelyn	20	bard	130	11	2	17	11	{}	0	0	0	0	2026-10-11 09:25:32.864688+03	95	0	48198	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	1437625	16	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
94	Dante	8	warrior	457	13	2	12	2	{}	0	0	0	0	2026-11-05 12:34:56.516655+03	99	0	36950	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	525210	16	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
110	Kaelen	44	mage	3164	11	9	11	8	{}	0	0	0	0	2026-11-05 05:35:19.523172+03	112	0	45382	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	699158	17	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
98	Riven	16	bard	2769	6	16	15	10	{}	0	0	0	0	2026-10-10 12:12:44.733441+03	104	0	32975	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	839355	17	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
101	Lucien	20	bard	3353	5	7	18	8	{}	0	0	0	0	2026-10-18 05:32:58.3803+03	114	0	26302	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	369978	17	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
102	Cedric	22	bard	675	5	1	10	4	{}	0	0	0	0	2026-10-08 01:05:09.114825+03	110	0	3698	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	1491922	17	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
99	Lyanna	17	bard	2134	15	7	14	1	{}	0	0	0	0	2026-10-27 17:23:13.357887+03	109	0	347	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	1379768	17	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
111	Nyx	45	mage	8451	18	18	4	5	{}	0	0	0	0	2026-10-09 13:03:09.616753+03	106	0	16277	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	1187382	17	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
113	123231	1	mage	0	1	3	4	2	{}	0	0	0	0	2026-11-08 09:13:42.684159+03	117	0	0	0	0	[]	[]	0	0	1	0	f	\N	0	0	0	0	0	1	0	\N	\N	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
\.


--
-- Data for Name: character_achievements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.character_achievements (character_id, achievement_id, is_completed, completed_at) FROM stdin;
4	1	t	2026-11-01 00:53:44.71046+03
4	6	t	2026-11-01 00:53:44.71046+03
4	11	t	2026-11-01 00:53:44.71046+03
4	16	t	2026-11-01 00:53:44.71046+03
4	2	t	2026-11-01 00:54:36.863228+03
4	5	t	2026-11-01 00:54:36.863228+03
4	7	t	2026-11-01 00:54:36.863228+03
4	18	t	2026-11-01 00:54:36.863228+03
9	5	t	2026-11-02 18:28:58.411648+03
9	1	t	2026-11-02 19:00:43.622224+03
9	2	t	2026-11-02 19:00:43.622224+03
9	4	t	2026-11-02 19:00:43.622224+03
9	6	t	2026-11-02 19:00:43.622224+03
9	7	t	2026-11-02 19:00:43.622224+03
9	18	t	2026-11-02 19:00:43.622224+03
9	24	t	2026-11-02 19:00:43.622224+03
9	11	t	2026-11-02 19:19:04.728517+03
9	3	t	2026-11-02 21:04:05.163626+03
9	12	t	2026-11-02 21:05:18.249355+03
9	16	t	2026-11-02 21:57:44.63904+03
9	21	t	2026-11-02 21:57:44.63904+03
4	3	t	2026-11-03 00:05:30.617307+03
11	4	t	2026-11-03 00:18:31.770903+03
4	4	t	2026-11-06 19:58:29.903869+03
4	8	t	2026-11-06 19:58:29.903869+03
4	12	t	2026-11-06 19:58:29.903869+03
4	19	t	2026-11-06 19:58:29.903869+03
\.


--
-- Data for Name: character_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.character_item (id, character_id, item_code, created_at, equipped) FROM stdin;
144349	4	oak_staff	2026-11-06 20:13:37.775652+03	f
143409	4	bone_ring	2026-10-21 11:21:56.273117+03	f
143410	4	vial	2026-10-21 11:24:12.0507+03	f
143411	4	cloth_robe	2026-10-21 11:25:29.724081+03	f
144350	4	enchant_bow	2026-11-06 20:13:37.775652+03	f
144351	4	alch_scepter	2026-11-06 20:13:37.775652+03	f
143414	4	leather_helmet	2026-10-21 11:27:29.782843+03	f
143415	4	wooden_shield	2026-10-21 11:28:29.788786+03	f
143416	4	cloth_robe	2026-10-21 11:28:29.788786+03	f
143417	4	vial	2026-10-21 11:29:29.794496+03	f
143418	4	cloth_robe	2026-10-21 11:32:29.810707+03	f
143419	4	cloth_robe	2026-10-21 11:33:29.744314+03	f
143420	4	cloth_robe	2026-10-21 11:34:29.822623+03	f
143421	4	vial	2026-10-21 11:35:29.827835+03	f
143422	4	wooden_amulet	2026-10-21 11:35:29.827835+03	f
143423	4	bone_ring	2026-10-21 11:36:29.832652+03	f
143424	4	wooden_shield	2026-10-21 11:37:29.838811+03	f
143425	4	wooden_shield	2026-10-21 11:38:29.843376+03	f
143426	4	cloth_robe	2026-10-21 11:41:29.77375+03	f
143427	4	bone_ring	2026-10-21 11:44:29.894986+03	f
16	4	bone_ring	2026-10-15 23:28:14.786648+03	f
12	4	herb_pouch	2026-10-15 23:23:14.537554+03	t
32	4	vial	2026-10-16 00:16:10.790874+03	f
144352	4	moon_blade	2026-11-06 20:13:37.775652+03	f
143413	4	vial	2026-10-21 11:26:29.776394+03	f
10	4	apprentice_wand	2026-10-15 22:24:44.354739+03	t
144353	4	crystal_staff	2026-11-06 20:13:37.775652+03	f
144354	4	resonance_flute	2026-11-06 20:13:37.775652+03	f
144355	4	philosopher_stone	2026-11-06 20:13:37.775652+03	f
144356	4	silver_mail	2026-11-06 20:13:37.775652+03	f
144357	4	mage_robe	2026-11-06 20:13:37.775652+03	f
144358	4	moon_shield	2026-11-06 20:13:37.775652+03	f
34	4	cloth_cap	2026-10-17 04:16:36.663256+03	f
144359	4	sapphire_ring	2026-11-06 20:13:37.775652+03	f
144360	4	moon_amulet	2026-11-06 20:13:37.775652+03	f
144361	4	frost_blade	2026-11-06 20:13:37.775652+03	f
144362	4	ice_staff	2026-11-06 20:13:37.775652+03	f
144363	4	winter_bow	2026-11-06 20:13:37.775652+03	f
144364	4	alch_frost_flask	2026-11-06 20:13:37.775652+03	f
144365	4	ice_armor	2026-11-06 20:13:37.775652+03	f
144366	4	wooden_club	2026-11-06 20:13:37.775652+03	f
144367	4	stone_axe	2026-11-06 20:13:37.775652+03	f
144368	4	leather_cap	2026-11-06 20:13:37.775652+03	f
144369	4	leather_vest	2026-11-06 20:13:37.775652+03	f
143404	4	wooden_shield	2026-10-21 04:06:06.697528+03	f
144370	4	wooden_ring	2026-11-06 20:13:37.775652+03	f
144371	4	warrior_sword	2026-11-06 20:13:37.775652+03	f
9	4	wooden_amulet	2026-10-15 22:24:44.354739+03	f
144372	4	mage_staff	2026-11-06 20:13:37.775652+03	f
144373	4	bard_lute	2026-11-06 20:13:37.775652+03	f
144374	4	alch_flask	2026-11-06 20:13:37.775652+03	f
144375	4	sturdy_shield	2026-11-06 20:13:37.775652+03	f
144376	4	cloth_hood	2026-11-06 20:13:37.775652+03	f
144377	4	copper_ring	2026-11-06 20:13:37.775652+03	f
144378	4	silver_sword	2026-11-06 20:13:37.775652+03	f
144379	4	glacier_sword	2026-11-06 20:13:37.775652+03	f
143575	4	alch_flask	2026-10-23 02:32:34.978919+03	f
144380	4	blizzard_staff	2026-11-06 20:13:37.775652+03	f
15	4	cloth_robe	2026-10-15 23:28:14.786648+03	t
144381	4	frost_lute	2026-11-06 20:13:37.775652+03	f
143406	4	cloth_robe	2026-10-21 11:02:51.760066+03	f
144382	4	alch_ice_scepter	2026-11-06 20:13:37.775652+03	f
144383	4	frost_shield	2026-11-06 20:13:37.775652+03	f
144384	4	snow_robe	2026-11-06 20:13:37.775652+03	f
144385	4	ice_ring	2026-11-06 20:13:37.775652+03	f
144386	4	iron_sword	2026-11-06 20:13:37.775652+03	f
144387	4	acid_staff	2026-11-06 20:13:37.775652+03	f
143578	4	copper_ring	2026-10-23 02:40:52.54297+03	f
144388	4	rusty_bow	2026-11-06 20:13:37.775652+03	f
143584	4	iron_armor	2026-10-27 11:32:47.144909+03	f
144389	4	alch_acid_flask	2026-11-06 20:13:37.775652+03	f
144390	4	iron_armor	2026-11-06 20:13:37.775652+03	f
144391	4	acid_robe	2026-11-06 20:13:37.775652+03	f
144392	4	corrosion_ring	2026-11-06 20:13:37.775652+03	f
144393	4	rusty_dagger	2026-11-06 20:13:37.775652+03	f
144394	4	coral_ring	2026-11-06 20:13:37.775652+03	f
143589	4	corrosion_ring	2026-10-27 11:37:09.215916+03	f
144395	4	iron_helm	2026-11-06 20:13:37.775652+03	f
144396	4	archmage_staff	2026-11-06 20:13:37.775652+03	f
143585	4	iron_helm	2026-10-27 11:32:47.144909+03	f
144397	4	void_blade	2026-11-06 20:13:37.775652+03	f
143583	4	iron_sword	2026-10-27 11:32:47.144909+03	f
144398	4	starlight_bow	2026-11-06 20:13:37.775652+03	f
144399	4	philosophers_elixir	2026-11-06 20:13:37.775652+03	f
144400	4	archmage_robe	2026-11-06 20:13:37.775652+03	f
143577	4	cloth_hood	2026-10-23 02:34:05.808255+03	f
144401	4	void_armor	2026-11-06 20:13:37.775652+03	f
144402	4	celestial_ring	2026-11-06 20:13:37.775652+03	f
143588	4	frost_shield	2026-10-27 11:37:09.215916+03	f
143587	4	acid_robe	2026-10-27 11:37:09.215916+03	t
143590	4	coral_ring	2026-10-27 11:37:09.215916+03	t
143586	4	acid_staff	2026-10-27 11:37:09.215916+03	f
143593	4	philosophers_elixir	2026-10-30 17:30:35.022055+03	f
143594	4	philosophers_elixir	2026-10-30 17:30:35.022055+03	f
143591	4	alch_acid_flask	2026-10-27 11:38:36.182426+03	f
143592	4	philosophers_elixir	2026-10-30 14:59:44.20668+03	t
143595	8	oak_staff	2026-11-01 02:09:49.408042+03	f
143596	8	enchant_bow	2026-11-01 02:09:49.408042+03	f
143597	8	alch_scepter	2026-11-01 02:09:49.408042+03	f
143598	8	moon_blade	2026-11-01 02:09:49.408042+03	f
143599	8	crystal_staff	2026-11-01 02:09:49.408042+03	f
143600	8	resonance_flute	2026-11-01 02:09:49.408042+03	f
143601	8	philosopher_stone	2026-11-01 02:09:49.408042+03	f
143602	8	silver_mail	2026-11-01 02:09:49.408042+03	f
143603	8	mage_robe	2026-11-01 02:09:49.408042+03	f
143604	8	moon_shield	2026-11-01 02:09:49.408042+03	f
143605	8	sapphire_ring	2026-11-01 02:09:49.408042+03	f
143606	8	moon_amulet	2026-11-01 02:09:49.408042+03	f
143607	8	frost_blade	2026-11-01 02:09:49.408042+03	f
143608	8	ice_staff	2026-11-01 02:09:49.408042+03	f
143609	8	winter_bow	2026-11-01 02:09:49.408042+03	f
143610	8	alch_frost_flask	2026-11-01 02:09:49.408042+03	f
143611	8	ice_armor	2026-11-01 02:09:49.408042+03	f
143612	8	wooden_club	2026-11-01 02:09:49.408042+03	f
143613	8	stone_axe	2026-11-01 02:09:49.408042+03	f
143614	8	leather_cap	2026-11-01 02:09:49.408042+03	f
143615	8	leather_vest	2026-11-01 02:09:49.408042+03	f
143616	8	wooden_ring	2026-11-01 02:09:49.408042+03	f
143617	8	warrior_sword	2026-11-01 02:09:49.408042+03	f
143618	8	mage_staff	2026-11-01 02:09:49.408042+03	f
143619	8	bard_lute	2026-11-01 02:09:49.408042+03	f
143620	8	alch_flask	2026-11-01 02:09:49.408042+03	f
143621	8	sturdy_shield	2026-11-01 02:09:49.408042+03	f
143622	8	cloth_hood	2026-11-01 02:09:49.408042+03	f
143623	8	copper_ring	2026-11-01 02:09:49.408042+03	f
143624	8	silver_sword	2026-11-01 02:09:49.408042+03	f
143625	8	glacier_sword	2026-11-01 02:09:49.408042+03	f
143626	8	blizzard_staff	2026-11-01 02:09:49.408042+03	f
143627	8	frost_lute	2026-11-01 02:09:49.408042+03	f
143628	8	alch_ice_scepter	2026-11-01 02:09:49.408042+03	f
143629	8	frost_shield	2026-11-01 02:09:49.408042+03	f
143630	8	snow_robe	2026-11-01 02:09:49.408042+03	f
143631	8	ice_ring	2026-11-01 02:09:49.408042+03	f
143632	8	iron_sword	2026-11-01 02:09:49.408042+03	f
143633	8	acid_staff	2026-11-01 02:09:49.408042+03	f
143634	8	rusty_bow	2026-11-01 02:09:49.408042+03	f
143635	8	alch_acid_flask	2026-11-01 02:09:49.408042+03	f
143636	8	iron_armor	2026-11-01 02:09:49.408042+03	f
143637	8	acid_robe	2026-11-01 02:09:49.408042+03	f
143638	8	corrosion_ring	2026-11-01 02:09:49.408042+03	f
143639	8	rusty_dagger	2026-11-01 02:09:49.408042+03	f
143640	8	coral_ring	2026-11-01 02:09:49.408042+03	f
143641	8	iron_helm	2026-11-01 02:09:49.408042+03	f
143642	8	archmage_staff	2026-11-01 02:09:49.408042+03	f
143643	8	void_blade	2026-11-01 02:09:49.408042+03	f
143644	8	starlight_bow	2026-11-01 02:09:49.408042+03	f
143645	8	philosophers_elixir	2026-11-01 02:09:49.408042+03	f
143646	8	archmage_robe	2026-11-01 02:09:49.408042+03	f
143647	8	void_armor	2026-11-01 02:09:49.408042+03	f
143648	8	celestial_ring	2026-11-01 02:09:49.408042+03	f
143649	9	oak_staff	2026-11-02 18:59:08.796337+03	f
143650	9	enchant_bow	2026-11-02 18:59:08.796337+03	f
143651	9	alch_scepter	2026-11-02 18:59:08.796337+03	f
143652	9	moon_blade	2026-11-02 18:59:08.796337+03	f
143653	9	crystal_staff	2026-11-02 18:59:08.796337+03	f
143654	9	resonance_flute	2026-11-02 18:59:08.796337+03	f
143655	9	philosopher_stone	2026-11-02 18:59:08.796337+03	f
143656	9	silver_mail	2026-11-02 18:59:08.796337+03	f
143657	9	mage_robe	2026-11-02 18:59:08.796337+03	f
143658	9	moon_shield	2026-11-02 18:59:08.796337+03	f
143659	9	sapphire_ring	2026-11-02 18:59:08.796337+03	f
143660	9	moon_amulet	2026-11-02 18:59:08.796337+03	f
143661	9	frost_blade	2026-11-02 18:59:08.796337+03	f
143662	9	ice_staff	2026-11-02 18:59:08.796337+03	f
143663	9	winter_bow	2026-11-02 18:59:08.796337+03	f
143664	9	alch_frost_flask	2026-11-02 18:59:08.796337+03	f
143665	9	ice_armor	2026-11-02 18:59:08.796337+03	f
143666	9	wooden_club	2026-11-02 18:59:08.796337+03	f
143667	9	stone_axe	2026-11-02 18:59:08.796337+03	f
143668	9	leather_cap	2026-11-02 18:59:08.796337+03	f
143669	9	leather_vest	2026-11-02 18:59:08.796337+03	f
143670	9	wooden_ring	2026-11-02 18:59:08.796337+03	f
143671	9	warrior_sword	2026-11-02 18:59:08.796337+03	f
143672	9	mage_staff	2026-11-02 18:59:08.796337+03	f
143673	9	bard_lute	2026-11-02 18:59:08.796337+03	f
143674	9	alch_flask	2026-11-02 18:59:08.796337+03	f
143675	9	sturdy_shield	2026-11-02 18:59:08.796337+03	f
143676	9	cloth_hood	2026-11-02 18:59:08.796337+03	f
143677	9	copper_ring	2026-11-02 18:59:08.796337+03	f
143678	9	silver_sword	2026-11-02 18:59:08.796337+03	f
143679	9	glacier_sword	2026-11-02 18:59:08.796337+03	f
143680	9	blizzard_staff	2026-11-02 18:59:08.796337+03	f
143681	9	frost_lute	2026-11-02 18:59:08.796337+03	f
143682	9	alch_ice_scepter	2026-11-02 18:59:08.796337+03	f
143683	9	frost_shield	2026-11-02 18:59:08.796337+03	f
143684	9	snow_robe	2026-11-02 18:59:08.796337+03	f
143685	9	ice_ring	2026-11-02 18:59:08.796337+03	f
143686	9	iron_sword	2026-11-02 18:59:08.796337+03	f
143687	9	acid_staff	2026-11-02 18:59:08.796337+03	f
143688	9	rusty_bow	2026-11-02 18:59:08.796337+03	f
143689	9	alch_acid_flask	2026-11-02 18:59:08.796337+03	f
143690	9	iron_armor	2026-11-02 18:59:08.796337+03	f
143691	9	acid_robe	2026-11-02 18:59:08.796337+03	f
143693	9	rusty_dagger	2026-11-02 18:59:08.796337+03	f
143694	9	coral_ring	2026-11-02 18:59:08.796337+03	f
143696	9	archmage_staff	2026-11-02 18:59:08.796337+03	f
143697	9	void_blade	2026-11-02 18:59:08.796337+03	f
143698	9	starlight_bow	2026-11-02 18:59:08.796337+03	f
143699	9	philosophers_elixir	2026-11-02 18:59:08.796337+03	f
143700	9	archmage_robe	2026-11-02 18:59:08.796337+03	f
143701	9	void_armor	2026-11-02 18:59:08.796337+03	f
143703	9	oak_staff	2026-11-02 18:59:12.073971+03	f
143704	9	enchant_bow	2026-11-02 18:59:12.073971+03	f
143705	9	alch_scepter	2026-11-02 18:59:12.073971+03	f
143706	9	moon_blade	2026-11-02 18:59:12.073971+03	f
143707	9	crystal_staff	2026-11-02 18:59:12.073971+03	f
143708	9	resonance_flute	2026-11-02 18:59:12.073971+03	f
143709	9	philosopher_stone	2026-11-02 18:59:12.073971+03	f
143710	9	silver_mail	2026-11-02 18:59:12.073971+03	f
143711	9	mage_robe	2026-11-02 18:59:12.073971+03	f
143712	9	moon_shield	2026-11-02 18:59:12.073971+03	f
143713	9	sapphire_ring	2026-11-02 18:59:12.073971+03	f
143714	9	moon_amulet	2026-11-02 18:59:12.073971+03	f
143715	9	frost_blade	2026-11-02 18:59:12.073971+03	f
143716	9	ice_staff	2026-11-02 18:59:12.073971+03	f
143717	9	winter_bow	2026-11-02 18:59:12.073971+03	f
143718	9	alch_frost_flask	2026-11-02 18:59:12.073971+03	f
143719	9	ice_armor	2026-11-02 18:59:12.073971+03	f
143720	9	wooden_club	2026-11-02 18:59:12.073971+03	f
143721	9	stone_axe	2026-11-02 18:59:12.073971+03	f
143722	9	leather_cap	2026-11-02 18:59:12.073971+03	f
143723	9	leather_vest	2026-11-02 18:59:12.073971+03	f
143725	9	warrior_sword	2026-11-02 18:59:12.073971+03	f
143726	9	mage_staff	2026-11-02 18:59:12.073971+03	f
143727	9	bard_lute	2026-11-02 18:59:12.073971+03	f
143728	9	alch_flask	2026-11-02 18:59:12.073971+03	f
143729	9	sturdy_shield	2026-11-02 18:59:12.073971+03	f
143730	9	cloth_hood	2026-11-02 18:59:12.073971+03	f
143731	9	copper_ring	2026-11-02 18:59:12.073971+03	f
143732	9	silver_sword	2026-11-02 18:59:12.073971+03	f
143733	9	glacier_sword	2026-11-02 18:59:12.073971+03	f
143734	9	blizzard_staff	2026-11-02 18:59:12.073971+03	f
143695	9	iron_helm	2026-11-02 18:59:08.796337+03	f
143702	9	celestial_ring	2026-11-02 18:59:08.796337+03	t
143735	9	frost_lute	2026-11-02 18:59:12.073971+03	f
143736	9	alch_ice_scepter	2026-11-02 18:59:12.073971+03	f
143737	9	frost_shield	2026-11-02 18:59:12.073971+03	f
143738	9	snow_robe	2026-11-02 18:59:12.073971+03	f
143739	9	ice_ring	2026-11-02 18:59:12.073971+03	f
143740	9	iron_sword	2026-11-02 18:59:12.073971+03	f
143741	9	acid_staff	2026-11-02 18:59:12.073971+03	f
143742	9	rusty_bow	2026-11-02 18:59:12.073971+03	f
143743	9	alch_acid_flask	2026-11-02 18:59:12.073971+03	f
143744	9	iron_armor	2026-11-02 18:59:12.073971+03	f
143745	9	acid_robe	2026-11-02 18:59:12.073971+03	f
143746	9	corrosion_ring	2026-11-02 18:59:12.073971+03	f
143747	9	rusty_dagger	2026-11-02 18:59:12.073971+03	f
143748	9	coral_ring	2026-11-02 18:59:12.073971+03	f
143749	9	iron_helm	2026-11-02 18:59:12.073971+03	f
143750	9	archmage_staff	2026-11-02 18:59:12.073971+03	f
143751	9	void_blade	2026-11-02 18:59:12.073971+03	f
143752	9	starlight_bow	2026-11-02 18:59:12.073971+03	f
143753	9	philosophers_elixir	2026-11-02 18:59:12.073971+03	f
143754	9	archmage_robe	2026-11-02 18:59:12.073971+03	f
143755	9	void_armor	2026-11-02 18:59:12.073971+03	f
143756	9	celestial_ring	2026-11-02 18:59:12.073971+03	f
143757	9	oak_staff	2026-11-02 18:59:28.661808+03	f
143758	9	enchant_bow	2026-11-02 18:59:28.661808+03	f
143759	9	alch_scepter	2026-11-02 18:59:28.661808+03	f
143760	9	moon_blade	2026-11-02 18:59:28.661808+03	f
143761	9	crystal_staff	2026-11-02 18:59:28.661808+03	f
143762	9	resonance_flute	2026-11-02 18:59:28.661808+03	f
143763	9	philosopher_stone	2026-11-02 18:59:28.661808+03	f
143764	9	silver_mail	2026-11-02 18:59:28.661808+03	f
143765	9	mage_robe	2026-11-02 18:59:28.661808+03	f
143766	9	moon_shield	2026-11-02 18:59:28.661808+03	f
143767	9	sapphire_ring	2026-11-02 18:59:28.661808+03	f
143768	9	moon_amulet	2026-11-02 18:59:28.661808+03	f
143769	9	frost_blade	2026-11-02 18:59:28.661808+03	f
143770	9	ice_staff	2026-11-02 18:59:28.661808+03	f
143771	9	winter_bow	2026-11-02 18:59:28.661808+03	f
143772	9	alch_frost_flask	2026-11-02 18:59:28.661808+03	f
143773	9	ice_armor	2026-11-02 18:59:28.661808+03	f
143774	9	wooden_club	2026-11-02 18:59:28.661808+03	f
143775	9	stone_axe	2026-11-02 18:59:28.661808+03	f
143776	9	leather_cap	2026-11-02 18:59:28.661808+03	f
143777	9	leather_vest	2026-11-02 18:59:28.661808+03	f
143778	9	wooden_ring	2026-11-02 18:59:28.661808+03	f
143779	9	warrior_sword	2026-11-02 18:59:28.661808+03	f
143780	9	mage_staff	2026-11-02 18:59:28.661808+03	f
143782	9	alch_flask	2026-11-02 18:59:28.661808+03	f
143783	9	sturdy_shield	2026-11-02 18:59:28.661808+03	f
143784	9	cloth_hood	2026-11-02 18:59:28.661808+03	f
143785	9	copper_ring	2026-11-02 18:59:28.661808+03	f
143786	9	silver_sword	2026-11-02 18:59:28.661808+03	f
143787	9	glacier_sword	2026-11-02 18:59:28.661808+03	f
143788	9	blizzard_staff	2026-11-02 18:59:28.661808+03	f
143790	9	alch_ice_scepter	2026-11-02 18:59:28.661808+03	f
143791	9	frost_shield	2026-11-02 18:59:28.661808+03	f
143792	9	snow_robe	2026-11-02 18:59:28.661808+03	f
144289	100	silver_sword	2026-11-06 01:08:24.362288+03	t
143794	9	iron_sword	2026-11-02 18:59:28.661808+03	f
143795	9	acid_staff	2026-11-02 18:59:28.661808+03	f
143796	9	rusty_bow	2026-11-02 18:59:28.661808+03	f
143797	9	alch_acid_flask	2026-11-02 18:59:28.661808+03	f
143798	9	iron_armor	2026-11-02 18:59:28.661808+03	f
144290	100	mage_robe	2026-11-06 01:08:24.362288+03	t
144291	100	moon_amulet	2026-11-06 01:08:24.362288+03	t
143801	9	rusty_dagger	2026-11-02 18:59:28.661808+03	f
143802	9	coral_ring	2026-11-02 18:59:28.661808+03	f
143803	9	iron_helm	2026-11-02 18:59:28.661808+03	f
143804	9	archmage_staff	2026-11-02 18:59:28.661808+03	f
143805	9	void_blade	2026-11-02 18:59:28.661808+03	f
143806	9	starlight_bow	2026-11-02 18:59:28.661808+03	f
143807	9	philosophers_elixir	2026-11-02 18:59:28.661808+03	f
143808	9	archmage_robe	2026-11-02 18:59:28.661808+03	f
143809	9	void_armor	2026-11-02 18:59:28.661808+03	f
143810	9	celestial_ring	2026-11-02 18:59:28.661808+03	f
143811	9	oak_staff	2026-11-02 19:03:57.155986+03	f
143812	9	enchant_bow	2026-11-02 19:03:57.155986+03	f
143813	9	alch_scepter	2026-11-02 19:03:57.155986+03	f
143814	9	moon_blade	2026-11-02 19:03:57.155986+03	f
143815	9	crystal_staff	2026-11-02 19:03:57.155986+03	f
143816	9	resonance_flute	2026-11-02 19:03:57.155986+03	f
143817	9	philosopher_stone	2026-11-02 19:03:57.155986+03	f
143818	9	silver_mail	2026-11-02 19:03:57.155986+03	f
143819	9	mage_robe	2026-11-02 19:03:57.155986+03	f
143820	9	moon_shield	2026-11-02 19:03:57.155986+03	f
143821	9	sapphire_ring	2026-11-02 19:03:57.155986+03	f
143822	9	moon_amulet	2026-11-02 19:03:57.155986+03	f
143823	9	frost_blade	2026-11-02 19:03:57.155986+03	f
143824	9	ice_staff	2026-11-02 19:03:57.155986+03	f
143825	9	winter_bow	2026-11-02 19:03:57.155986+03	f
143826	9	alch_frost_flask	2026-11-02 19:03:57.155986+03	f
143827	9	ice_armor	2026-11-02 19:03:57.155986+03	f
143828	9	wooden_club	2026-11-02 19:03:57.155986+03	f
143829	9	stone_axe	2026-11-02 19:03:57.155986+03	f
143830	9	leather_cap	2026-11-02 19:03:57.155986+03	f
143831	9	leather_vest	2026-11-02 19:03:57.155986+03	f
143832	9	wooden_ring	2026-11-02 19:03:57.155986+03	f
143833	9	warrior_sword	2026-11-02 19:03:57.155986+03	f
143834	9	mage_staff	2026-11-02 19:03:57.155986+03	f
143835	9	bard_lute	2026-11-02 19:03:57.155986+03	f
143836	9	alch_flask	2026-11-02 19:03:57.155986+03	f
143837	9	sturdy_shield	2026-11-02 19:03:57.155986+03	f
143838	9	cloth_hood	2026-11-02 19:03:57.155986+03	f
143840	9	silver_sword	2026-11-02 19:03:57.155986+03	f
143841	9	glacier_sword	2026-11-02 19:03:57.155986+03	f
143842	9	blizzard_staff	2026-11-02 19:03:57.155986+03	f
143843	9	frost_lute	2026-11-02 19:03:57.155986+03	f
143844	9	alch_ice_scepter	2026-11-02 19:03:57.155986+03	f
143845	9	frost_shield	2026-11-02 19:03:57.155986+03	f
143846	9	snow_robe	2026-11-02 19:03:57.155986+03	f
143848	9	iron_sword	2026-11-02 19:03:57.155986+03	f
143849	9	acid_staff	2026-11-02 19:03:57.155986+03	f
143850	9	rusty_bow	2026-11-02 19:03:57.155986+03	f
143851	9	alch_acid_flask	2026-11-02 19:03:57.155986+03	f
143852	9	iron_armor	2026-11-02 19:03:57.155986+03	f
143853	9	acid_robe	2026-11-02 19:03:57.155986+03	f
143793	9	ice_ring	2026-11-02 18:59:28.661808+03	f
143799	9	acid_robe	2026-11-02 18:59:28.661808+03	t
143789	9	frost_lute	2026-11-02 18:59:28.661808+03	t
143854	9	corrosion_ring	2026-11-02 19:03:57.155986+03	f
143855	9	rusty_dagger	2026-11-02 19:03:57.155986+03	f
143856	9	coral_ring	2026-11-02 19:03:57.155986+03	f
143857	9	iron_helm	2026-11-02 19:03:57.155986+03	f
143859	9	void_blade	2026-11-02 19:03:57.155986+03	f
143860	9	starlight_bow	2026-11-02 19:03:57.155986+03	f
143861	9	philosophers_elixir	2026-11-02 19:03:57.155986+03	f
143862	9	archmage_robe	2026-11-02 19:03:57.155986+03	f
143863	9	void_armor	2026-11-02 19:03:57.155986+03	f
143864	9	celestial_ring	2026-11-02 19:03:57.155986+03	f
143865	9	oak_staff	2026-11-02 19:17:57.039311+03	f
143866	9	enchant_bow	2026-11-02 19:17:57.039311+03	f
143867	9	alch_scepter	2026-11-02 19:17:57.039311+03	f
143868	9	moon_blade	2026-11-02 19:17:57.039311+03	f
143869	9	crystal_staff	2026-11-02 19:17:57.039311+03	f
143870	9	resonance_flute	2026-11-02 19:17:57.039311+03	f
143871	9	philosopher_stone	2026-11-02 19:17:57.039311+03	f
143872	9	silver_mail	2026-11-02 19:17:57.039311+03	f
143873	9	mage_robe	2026-11-02 19:17:57.039311+03	f
143874	9	moon_shield	2026-11-02 19:17:57.039311+03	f
143875	9	sapphire_ring	2026-11-02 19:17:57.039311+03	f
143876	9	moon_amulet	2026-11-02 19:17:57.039311+03	f
143877	9	frost_blade	2026-11-02 19:17:57.039311+03	f
143878	9	ice_staff	2026-11-02 19:17:57.039311+03	f
143879	9	winter_bow	2026-11-02 19:17:57.039311+03	f
143880	9	alch_frost_flask	2026-11-02 19:17:57.039311+03	f
143881	9	ice_armor	2026-11-02 19:17:57.039311+03	f
143882	9	wooden_club	2026-11-02 19:17:57.039311+03	f
143883	9	stone_axe	2026-11-02 19:17:57.039311+03	f
143884	9	leather_cap	2026-11-02 19:17:57.039311+03	f
143885	9	leather_vest	2026-11-02 19:17:57.039311+03	f
143886	9	wooden_ring	2026-11-02 19:17:57.039311+03	f
143887	9	warrior_sword	2026-11-02 19:17:57.039311+03	f
143888	9	mage_staff	2026-11-02 19:17:57.039311+03	f
143889	9	bard_lute	2026-11-02 19:17:57.039311+03	f
143890	9	alch_flask	2026-11-02 19:17:57.039311+03	f
143891	9	sturdy_shield	2026-11-02 19:17:57.039311+03	f
143892	9	cloth_hood	2026-11-02 19:17:57.039311+03	f
143893	9	copper_ring	2026-11-02 19:17:57.039311+03	f
143894	9	silver_sword	2026-11-02 19:17:57.039311+03	f
143895	9	glacier_sword	2026-11-02 19:17:57.039311+03	f
143896	9	blizzard_staff	2026-11-02 19:17:57.039311+03	f
143897	9	frost_lute	2026-11-02 19:17:57.039311+03	f
143898	9	alch_ice_scepter	2026-11-02 19:17:57.039311+03	f
143899	9	frost_shield	2026-11-02 19:17:57.039311+03	f
143900	9	snow_robe	2026-11-02 19:17:57.039311+03	f
143901	9	ice_ring	2026-11-02 19:17:57.039311+03	f
143902	9	iron_sword	2026-11-02 19:17:57.039311+03	f
143903	9	acid_staff	2026-11-02 19:17:57.039311+03	f
143904	9	rusty_bow	2026-11-02 19:17:57.039311+03	f
143905	9	alch_acid_flask	2026-11-02 19:17:57.039311+03	f
143906	9	iron_armor	2026-11-02 19:17:57.039311+03	f
143908	9	corrosion_ring	2026-11-02 19:17:57.039311+03	f
143909	9	rusty_dagger	2026-11-02 19:17:57.039311+03	f
143910	9	coral_ring	2026-11-02 19:17:57.039311+03	f
143911	9	iron_helm	2026-11-02 19:17:57.039311+03	f
143912	9	archmage_staff	2026-11-02 19:17:57.039311+03	f
143913	9	void_blade	2026-11-02 19:17:57.039311+03	f
143914	9	starlight_bow	2026-11-02 19:17:57.039311+03	f
143916	9	archmage_robe	2026-11-02 19:17:57.039311+03	f
143917	9	void_armor	2026-11-02 19:17:57.039311+03	f
143918	9	celestial_ring	2026-11-02 19:17:57.039311+03	f
143919	9	ice_armor	2026-11-02 19:19:04.659047+03	f
143920	9	ice_armor	2026-11-02 19:19:04.659047+03	f
143921	9	oak_staff	2026-11-02 19:19:22.74548+03	f
143922	9	enchant_bow	2026-11-02 19:19:22.74548+03	f
143923	9	alch_scepter	2026-11-02 19:19:22.74548+03	f
143924	9	moon_blade	2026-11-02 19:19:22.74548+03	f
143925	9	crystal_staff	2026-11-02 19:19:22.74548+03	f
143926	9	resonance_flute	2026-11-02 19:19:22.74548+03	f
143927	9	philosopher_stone	2026-11-02 19:19:22.74548+03	f
143928	9	silver_mail	2026-11-02 19:19:22.74548+03	f
143929	9	mage_robe	2026-11-02 19:19:22.74548+03	f
143930	9	moon_shield	2026-11-02 19:19:22.74548+03	f
143931	9	sapphire_ring	2026-11-02 19:19:22.74548+03	f
143932	9	moon_amulet	2026-11-02 19:19:22.74548+03	f
143933	9	frost_blade	2026-11-02 19:19:22.74548+03	f
143934	9	ice_staff	2026-11-02 19:19:22.74548+03	f
143935	9	winter_bow	2026-11-02 19:19:22.74548+03	f
143936	9	alch_frost_flask	2026-11-02 19:19:22.74548+03	f
143937	9	ice_armor	2026-11-02 19:19:22.74548+03	f
143938	9	wooden_club	2026-11-02 19:19:22.74548+03	f
143939	9	stone_axe	2026-11-02 19:19:22.74548+03	f
143940	9	leather_cap	2026-11-02 19:19:22.74548+03	f
143941	9	leather_vest	2026-11-02 19:19:22.74548+03	f
143942	9	wooden_ring	2026-11-02 19:19:22.74548+03	f
143943	9	warrior_sword	2026-11-02 19:19:22.74548+03	f
143944	9	mage_staff	2026-11-02 19:19:22.74548+03	f
143945	9	bard_lute	2026-11-02 19:19:22.74548+03	f
143946	9	alch_flask	2026-11-02 19:19:22.74548+03	f
143947	9	sturdy_shield	2026-11-02 19:19:22.74548+03	f
143948	9	cloth_hood	2026-11-02 19:19:22.74548+03	f
143949	9	copper_ring	2026-11-02 19:19:22.74548+03	f
143950	9	silver_sword	2026-11-02 19:19:22.74548+03	f
143951	9	glacier_sword	2026-11-02 19:19:22.74548+03	f
143952	9	blizzard_staff	2026-11-02 19:19:22.74548+03	f
143953	9	frost_lute	2026-11-02 19:19:22.74548+03	f
143954	9	alch_ice_scepter	2026-11-02 19:19:22.74548+03	f
143955	9	frost_shield	2026-11-02 19:19:22.74548+03	f
143956	9	snow_robe	2026-11-02 19:19:22.74548+03	f
143957	9	ice_ring	2026-11-02 19:19:22.74548+03	f
143958	9	iron_sword	2026-11-02 19:19:22.74548+03	f
143959	9	acid_staff	2026-11-02 19:19:22.74548+03	f
143960	9	rusty_bow	2026-11-02 19:19:22.74548+03	f
143961	9	alch_acid_flask	2026-11-02 19:19:22.74548+03	f
143962	9	iron_armor	2026-11-02 19:19:22.74548+03	f
143963	9	acid_robe	2026-11-02 19:19:22.74548+03	f
143964	9	corrosion_ring	2026-11-02 19:19:22.74548+03	f
143965	9	rusty_dagger	2026-11-02 19:19:22.74548+03	f
143966	9	coral_ring	2026-11-02 19:19:22.74548+03	f
143967	9	iron_helm	2026-11-02 19:19:22.74548+03	f
143968	9	archmage_staff	2026-11-02 19:19:22.74548+03	f
143969	9	void_blade	2026-11-02 19:19:22.74548+03	f
143970	9	starlight_bow	2026-11-02 19:19:22.74548+03	f
143971	9	philosophers_elixir	2026-11-02 19:19:22.74548+03	f
143972	9	archmage_robe	2026-11-02 19:19:22.74548+03	f
143973	9	void_armor	2026-11-02 19:19:22.74548+03	f
143974	9	celestial_ring	2026-11-02 19:19:22.74548+03	f
143975	9	ice_armor	2026-11-02 19:20:29.951938+03	f
143976	9	ice_armor	2026-11-02 19:20:29.951938+03	f
143847	9	ice_ring	2026-11-02 19:03:57.155986+03	f
143800	9	corrosion_ring	2026-11-02 18:59:28.661808+03	f
143839	9	copper_ring	2026-11-02 19:03:57.155986+03	f
143692	9	corrosion_ring	2026-11-02 18:59:08.796337+03	f
143985	9	stone_axe	2026-11-02 21:04:05.116186+03	f
143986	9	philosopher_stone	2026-11-02 21:04:08.047975+03	f
143987	9	mage_robe	2026-11-02 21:04:18.430778+03	f
143988	9	sapphire_ring	2026-11-02 21:07:57.05273+03	f
143989	9	oak_staff	2026-11-02 21:57:29.258815+03	f
143990	9	enchant_bow	2026-11-02 21:57:29.258815+03	f
143991	9	alch_scepter	2026-11-02 21:57:29.258815+03	f
143992	9	moon_blade	2026-11-02 21:57:29.258815+03	f
143993	9	crystal_staff	2026-11-02 21:57:29.258815+03	f
143994	9	resonance_flute	2026-11-02 21:57:29.258815+03	f
143995	9	philosopher_stone	2026-11-02 21:57:29.258815+03	f
143996	9	silver_mail	2026-11-02 21:57:29.258815+03	f
143997	9	mage_robe	2026-11-02 21:57:29.258815+03	f
143998	9	moon_shield	2026-11-02 21:57:29.258815+03	f
143999	9	sapphire_ring	2026-11-02 21:57:29.258815+03	f
144000	9	moon_amulet	2026-11-02 21:57:29.258815+03	f
144001	9	frost_blade	2026-11-02 21:57:29.258815+03	f
144002	9	ice_staff	2026-11-02 21:57:29.258815+03	f
144003	9	winter_bow	2026-11-02 21:57:29.258815+03	f
144004	9	alch_frost_flask	2026-11-02 21:57:29.258815+03	f
144005	9	ice_armor	2026-11-02 21:57:29.258815+03	f
144006	9	wooden_club	2026-11-02 21:57:29.258815+03	f
144007	9	stone_axe	2026-11-02 21:57:29.258815+03	f
144008	9	leather_cap	2026-11-02 21:57:29.258815+03	f
144009	9	leather_vest	2026-11-02 21:57:29.258815+03	f
144011	9	warrior_sword	2026-11-02 21:57:29.258815+03	f
144012	9	mage_staff	2026-11-02 21:57:29.258815+03	f
144013	9	bard_lute	2026-11-02 21:57:29.258815+03	f
144014	9	alch_flask	2026-11-02 21:57:29.258815+03	f
144016	9	cloth_hood	2026-11-02 21:57:29.258815+03	f
144017	9	copper_ring	2026-11-02 21:57:29.258815+03	f
144018	9	silver_sword	2026-11-02 21:57:29.258815+03	f
144019	9	glacier_sword	2026-11-02 21:57:29.258815+03	f
144020	9	blizzard_staff	2026-11-02 21:57:29.258815+03	f
144021	9	frost_lute	2026-11-02 21:57:29.258815+03	f
144022	9	alch_ice_scepter	2026-11-02 21:57:29.258815+03	f
144023	9	frost_shield	2026-11-02 21:57:29.258815+03	f
144024	9	snow_robe	2026-11-02 21:57:29.258815+03	f
144025	9	ice_ring	2026-11-02 21:57:29.258815+03	f
144026	9	iron_sword	2026-11-02 21:57:29.258815+03	f
144027	9	acid_staff	2026-11-02 21:57:29.258815+03	f
144028	9	rusty_bow	2026-11-02 21:57:29.258815+03	f
144029	9	alch_acid_flask	2026-11-02 21:57:29.258815+03	f
144030	9	iron_armor	2026-11-02 21:57:29.258815+03	f
144031	9	acid_robe	2026-11-02 21:57:29.258815+03	f
144032	9	corrosion_ring	2026-11-02 21:57:29.258815+03	f
144033	9	rusty_dagger	2026-11-02 21:57:29.258815+03	f
144034	9	coral_ring	2026-11-02 21:57:29.258815+03	f
144035	9	iron_helm	2026-11-02 21:57:29.258815+03	f
144036	9	archmage_staff	2026-11-02 21:57:29.258815+03	f
144037	9	void_blade	2026-11-02 21:57:29.258815+03	f
144038	9	starlight_bow	2026-11-02 21:57:29.258815+03	f
144039	9	philosophers_elixir	2026-11-02 21:57:29.258815+03	f
144040	9	archmage_robe	2026-11-02 21:57:29.258815+03	f
144041	9	void_armor	2026-11-02 21:57:29.258815+03	f
144042	9	celestial_ring	2026-11-02 21:57:29.258815+03	f
144043	9	warrior_sword	2026-11-02 22:49:16.401639+03	f
144044	9	warrior_sword	2026-11-02 22:49:16.401639+03	f
144045	9	leather_cap	2026-11-02 22:49:16.401639+03	f
144046	9	leather_cap	2026-11-02 22:49:16.401639+03	f
143915	9	philosophers_elixir	2026-11-02 19:17:57.039311+03	f
144047	9	acid_staff	2026-11-02 23:09:53.991293+03	f
144292	106	silver_sword	2026-11-06 01:08:24.362288+03	t
144293	106	mage_robe	2026-11-06 01:08:24.362288+03	t
144294	106	moon_amulet	2026-11-06 01:08:24.362288+03	t
144295	107	silver_sword	2026-11-06 01:08:24.362288+03	t
144296	107	mage_robe	2026-11-06 01:08:24.362288+03	t
144297	107	moon_amulet	2026-11-06 01:08:24.362288+03	t
144298	92	silver_sword	2026-11-06 01:08:24.362288+03	t
144299	92	mage_robe	2026-11-06 01:08:24.362288+03	t
144300	92	moon_amulet	2026-11-06 01:08:24.362288+03	t
144301	94	silver_sword	2026-11-06 01:08:24.362288+03	t
144302	94	mage_robe	2026-11-06 01:08:24.362288+03	t
144303	94	moon_amulet	2026-11-06 01:08:24.362288+03	t
144304	97	silver_sword	2026-11-06 01:08:24.362288+03	t
144305	97	mage_robe	2026-11-06 01:08:24.362288+03	t
144306	97	moon_amulet	2026-11-06 01:08:24.362288+03	t
144307	108	silver_sword	2026-11-06 01:08:24.362288+03	t
144308	108	mage_robe	2026-11-06 01:08:24.362288+03	t
144309	108	moon_amulet	2026-11-06 01:08:24.362288+03	t
144310	93	silver_sword	2026-11-06 01:08:24.362288+03	t
144311	93	mage_robe	2026-11-06 01:08:24.362288+03	t
144312	93	moon_amulet	2026-11-06 01:08:24.362288+03	t
144313	105	silver_sword	2026-11-06 01:08:24.362288+03	t
144314	105	mage_robe	2026-11-06 01:08:24.362288+03	t
144315	105	moon_amulet	2026-11-06 01:08:24.362288+03	t
144316	98	silver_sword	2026-11-06 01:08:24.362288+03	t
144317	98	mage_robe	2026-11-06 01:08:24.362288+03	t
144318	98	moon_amulet	2026-11-06 01:08:24.362288+03	t
144319	103	silver_sword	2026-11-06 01:08:24.362288+03	t
144320	103	mage_robe	2026-11-06 01:08:24.362288+03	t
144321	103	moon_amulet	2026-11-06 01:08:24.362288+03	t
144322	111	silver_sword	2026-11-06 01:08:24.362288+03	t
144323	111	mage_robe	2026-11-06 01:08:24.362288+03	t
144324	111	moon_amulet	2026-11-06 01:08:24.362288+03	t
144325	109	silver_sword	2026-11-06 01:08:24.362288+03	t
144326	109	mage_robe	2026-11-06 01:08:24.362288+03	t
144327	109	moon_amulet	2026-11-06 01:08:24.362288+03	t
144328	104	silver_sword	2026-11-06 01:08:24.362288+03	t
144329	104	mage_robe	2026-11-06 01:08:24.362288+03	t
144330	104	moon_amulet	2026-11-06 01:08:24.362288+03	t
144331	99	silver_sword	2026-11-06 01:08:24.362288+03	t
144332	99	mage_robe	2026-11-06 01:08:24.362288+03	t
144333	99	moon_amulet	2026-11-06 01:08:24.362288+03	t
144334	102	silver_sword	2026-11-06 01:08:24.362288+03	t
144335	102	mage_robe	2026-11-06 01:08:24.362288+03	t
144336	102	moon_amulet	2026-11-06 01:08:24.362288+03	t
144337	95	silver_sword	2026-11-06 01:08:24.362288+03	t
144338	95	mage_robe	2026-11-06 01:08:24.362288+03	t
144339	95	moon_amulet	2026-11-06 01:08:24.362288+03	t
144340	110	silver_sword	2026-11-06 01:08:24.362288+03	t
144341	110	mage_robe	2026-11-06 01:08:24.362288+03	t
144342	110	moon_amulet	2026-11-06 01:08:24.362288+03	t
144343	96	silver_sword	2026-11-06 01:08:24.362288+03	t
144344	96	mage_robe	2026-11-06 01:08:24.362288+03	t
144345	96	moon_amulet	2026-11-06 01:08:24.362288+03	t
144346	101	silver_sword	2026-11-06 01:08:24.362288+03	t
144347	101	mage_robe	2026-11-06 01:08:24.362288+03	t
144348	101	moon_amulet	2026-11-06 01:08:24.362288+03	t
\.


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city (id, character_id, gold, created_at, level) FROM stdin;
1	4	0	2026-10-14 05:02:32.380732+03	1
2	5	0	2026-10-14 05:02:32.380732+03	1
3	6	0	2026-10-14 05:02:32.380732+03	1
4	7	0	2026-10-14 11:01:06.570996+03	1
5	8	0	2026-10-21 01:21:52.581166+03	1
6	9	0	2026-10-22 20:26:36.458867+03	1
7	10	0	2026-10-25 17:46:47.702874+03	1
8	11	0	2026-11-03 00:13:41.146535+03	1
9	112	0	2026-11-07 22:00:31.716592+03	1
10	113	0	2026-11-08 09:13:42.684159+03	1
\.


--
-- Data for Name: city_resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city_resource (city_id, resource_type, amount) FROM stdin;
1	rope	1
1	bone	4
1	feather	4
1	stone	4270
4	wood	2
4	stone	2
4	leather	1
4	herbs	3
1	coal	8
1	herbs	23
1	wood	70
1	clay	40
1	twig	450
1	fabric	2
1	gem	10000
5	frost_ore	10000
5	ice_crystal	10000
6	iron_ore	9980
6	ice_crystal	9980
6	leather	10002
1	hide	10000
6	twig	5970
5	snow_leather	10000
6	stone	7600
6	flint	10002
6	lake_water	10004
6	mana_crystal	10004
6	wooden_plank	10018
1	fiber	10000
5	frozen_wood	10000
6	leather_strip	10000
1	flint	10000
6	stone_block	10001
5	twig	10000
6	fiber	9953
6	resin	9965
5	log	10000
5	stone	10000
5	gem	10000
1	resin	10000
5	hide	10000
5	fiber	10000
5	flint	10000
5	resin	10000
5	leather	10000
5	wooden_plank	10000
5	stone_block	10000
5	leather_strip	10000
5	lake_water	10000
5	mana_crystal	10000
5	silver_ore	10000
5	enchant_dust	10000
5	silver_ingot	10000
5	enchanted_cloth	10000
5	spirit_wood	10000
5	frost_ingot	10000
5	ice_cloth	10000
5	frozen_plank	10000
5	iron_ore	10000
5	rust	10000
5	acid_gland	10000
5	coral	10000
5	iron_ingot	10000
5	treated_leather	10000
5	rusty_plank	10000
5	acid_steel	10000
5	magic_essence	10000
5	stardust	10000
5	ancient_scroll	10000
5	void_shard	10000
5	arcane_ingot	10000
5	star_cloth	10000
1	leather	10000
5	runic_plank	10000
1	wooden_plank	10000
1	stone_block	10000
6	coral	9999
1	leather_strip	10000
1	lake_water	10000
6	silver_ore	10000
6	enchant_dust	10000
6	silver_ingot	10000
6	hide	9980
6	frost_ore	10000
8	hide	1
8	twig	0
1	frost_ore	10000
1	ice_crystal	10000
6	snow_leather	10000
6	frozen_wood	10000
6	enchanted_cloth	10000
1	snow_leather	10000
6	spirit_wood	10000
1	frozen_wood	10000
6	acid_gland	9987
6	frost_ingot	10000
1	mana_crystal	10000
6	ice_cloth	10000
6	gem	10015
1	silver_ore	10000
1	enchant_dust	10000
6	log	10000
1	silver_ingot	10000
1	log	10000
1	enchanted_cloth	10000
1	spirit_wood	10000
1	frost_ingot	10000
6	frozen_plank	10000
1	ice_cloth	10000
6	rust	10000
1	frozen_plank	10000
1	iron_ore	10000
1	rust	10000
6	iron_ingot	10000
1	acid_gland	10000
1	coral	10000
1	iron_ingot	10000
1	treated_leather	10000
1	rusty_plank	10000
1	acid_steel	10000
1	magic_essence	10000
1	stardust	10000
1	ancient_scroll	10000
6	treated_leather	10000
6	stardust	10000
6	ancient_scroll	10000
6	void_shard	10000
6	arcane_ingot	10000
6	star_cloth	10000
6	runic_plank	10000
6	rusty_plank	9999
6	acid_steel	9998
6	magic_essence	9960
8	leather_strip	1
8	wooden_plank	1
1	void_shard	10000
1	arcane_ingot	10000
1	star_cloth	10000
1	runic_plank	10000
\.


--
-- Data for Name: city_upgrade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city_upgrade (city_id, upgrade_code, level) FROM stdin;
2	barracks	1
3	barracks	1
4	barracks	1
7	barracks	1
5	gold_mine	10
5	library	10
5	warehouse	10
5	barracks	10
5	wall	10
6	library	11
6	warehouse	11
6	barracks	11
6	gold_mine	11
6	wall	13
1	gold_mine	10
1	library	10
1	barracks	10
1	wall	20
1	warehouse	13
\.


--
-- Data for Name: clans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clans (id, name, leader_id, created_at, bank_gold, active_buff, buff_expires_at) FROM stdin;
1	test	4	2026-10-29 14:51:24.46713+03	100	exp_boost	1793528913
2	123	8	2026-10-31 13:38:41.284286+03	700	exp_boost	1793736678
15	DragonFruit	97	2026-11-06 01:08:24.362288+03	4381	\N	0
16	BlueberryLegion	106	2026-11-06 01:08:24.362288+03	7111	\N	0
17	MangoRaiders	110	2026-11-06 01:08:24.362288+03	1666	\N	0
\.


--
-- Data for Name: coop_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coop_groups (id, leader_id, created_at) FROM stdin;
6	9	2026-11-02 23:34:09.589779+03
\.


--
-- Data for Name: food_recipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_recipe (id, code, name, description, cost_resource, cost_amount, buff_gold_pct, buff_exp_pct, buff_luck_pct, tier) FROM stdin;
1	meat_stew	Мясная похлебка	+20% к золоту за следующую экспедицию.	hide	10	20	0	0	1
2	herb_tea	Травяной чай	+20% к опыту за следующую экспедицию.	fiber	15	0	20	0	1
3	lucky_pie	Пирог удачи	+20% к удаче (дропу) за следующую экспедицию.	resin	5	0	0	20	1
4	magic_soup	Магический суп	Восстанавливает ману. +40% к опыту.	lake_water	10	0	40	0	2
5	silver_tea	Серебряный чай	Придает сил. +40% к золоту.	silver_ore	5	40	0	0	2
6	moon_cookie	Лунное печенье	Приносит удачу. +40% к дропу.	mana_crystal	3	0	0	40	2
7	frost_stew	Морозное рагу	Согревает. +60% к опыту.	snow_leather	10	0	60	0	3
8	ice_tea	Ледяной чай	Бодрит. +60% к золоту.	ice_crystal	5	60	0	0	3
9	snow_pie	Снежный пирог	Приносит удачу. +60% к дропу.	frozen_wood	5	0	0	60	3
10	iron_brew	Железный отвар	Дает сил. +80% к опыту.	iron_ore	10	0	80	0	4
11	coral_tea	Коралловый чай	Укрепляет дух. +80% к золоту.	coral	5	80	0	0	4
12	acid_cake	Кислотный пирог	Обжигает, но приносит удачу. +80% к дропу.	acid_gland	5	0	0	80	4
13	acid_soup	Кислотный суп	Обжигающий, но полезный. +90% к опыту.	acid_gland	8	0	90	0	4
14	coral_wine	Коралловое вино	Придает уверенности. +90% к золоту.	coral	8	90	0	0	4
15	archmage_feast	Пир Архимага	Дает невероятную силу. +150% к опыту.	magic_essence	20	0	150	0	5
16	stardust_wine	Звездное вино	Дарует просветление. +150% к золоту.	stardust	10	150	0	0	5
\.


--
-- Data for Name: friendships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.friendships (id, requester_id, receiver_id, status) FROM stdin;
1	8	4	accepted
94	100	107	accepted
3	9	4	pending
4	11	4	pending
95	92	101	accepted
96	94	107	accepted
97	94	98	accepted
98	94	103	accepted
99	94	109	accepted
100	97	103	accepted
101	93	108	accepted
102	93	95	accepted
103	105	106	accepted
104	98	100	accepted
105	98	107	accepted
106	98	108	accepted
107	98	109	accepted
108	103	106	accepted
109	103	105	accepted
110	104	108	accepted
111	99	106	accepted
112	99	107	accepted
113	99	104	accepted
114	102	103	accepted
115	102	109	accepted
116	95	99	accepted
117	95	110	accepted
118	96	107	accepted
\.


--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item (id, code, name, slot, attack, defense, luck, tier) FROM stdin;
64	oak_staff	Дубовый посох	weapon	8	0	2	2
65	enchant_bow	Зачарованный лук	weapon	9	0	1	2
66	alch_scepter	Скипетр алхимика	weapon	7	0	3	2
67	moon_blade	Лунный клинок	weapon	12	0	2	2
68	crystal_staff	Кристальный посох	weapon	10	0	3	2
69	resonance_flute	Флейта резонанса	weapon	9	0	4	2
70	philosopher_stone	Философский камень	weapon	8	0	5	2
71	silver_mail	Серебряная кольчуга	armor	0	8	0	2
72	mage_robe	Мантия мага	armor	0	5	3	2
73	moon_shield	Лунный щит	armor	0	10	0	2
74	sapphire_ring	Сапфировое кольцо	accessory	0	2	3	2
75	moon_amulet	Лунный амулет	accessory	2	0	4	2
76	frost_ore	Морозная руда	material	0	0	0	3
77	ice_crystal	Ледяной кристалл	material	0	0	0	3
78	snow_leather	Снежная кожа	material	0	0	0	3
79	frozen_wood	Мерзлая древесина	material	0	0	0	3
80	frost_blade	Морозный клинок	weapon	20	0	2	3
81	ice_staff	Посох льда	weapon	18	0	4	3
82	winter_bow	Зимний лук	weapon	19	0	3	3
83	alch_frost_flask	Морозная колба	weapon	15	0	6	3
84	ice_armor	Ледяная броня	armor	0	15	2	3
32	twig	Ветка	material	0	0	0	1
33	log	Бревно	material	0	0	0	1
34	stone	Камень	material	0	0	0	1
35	gem	Самоцвет	material	0	0	0	1
36	hide	Шкура	material	0	0	0	1
37	fiber	Волокно	material	0	0	0	1
38	flint	Кремень	material	0	0	0	1
39	resin	Смола	material	0	0	0	1
40	leather	Кожа	material	0	0	0	1
41	wooden_plank	Деревянная доска	material	0	0	0	1
42	stone_block	Каменный блок	material	0	0	0	1
43	leather_strip	Полоска кожи	material	0	0	0	1
44	wooden_club	Деревянная дубина	weapon	2	0	0	1
45	stone_axe	Каменный топор	weapon	3	0	0	1
46	leather_cap	Кожаный капюшон	armor	0	1	0	1
47	leather_vest	Кожаный жилет	armor	0	2	0	1
48	wooden_ring	Деревянное кольцо	accessory	0	0	1	1
49	warrior_sword	Тренировочный меч	weapon	4	0	0	1
50	mage_staff	Посох ученика	weapon	4	0	0	1
51	bard_lute	Простая лютня	weapon	2	0	2	1
52	alch_flask	Колба алхимика	weapon	1	0	3	1
53	sturdy_shield	Крепкий щит	armor	0	4	0	1
54	cloth_hood	Тканевый капюшон	armor	0	1	1	1
55	copper_ring	Медное кольцо	accessory	0	1	1	1
56	lake_water	Вода озера	material	0	0	0	2
57	mana_crystal	Кристалл маны	material	0	0	0	2
58	silver_ore	Серебряная руда	material	0	0	0	2
59	enchant_dust	Магическая пыль	material	0	0	0	2
60	silver_ingot	Серебряный слиток	material	0	0	0	2
61	enchanted_cloth	Зачарованная ткань	material	0	0	0	2
62	spirit_wood	Дух-древесина	material	0	0	0	2
63	silver_sword	Серебряный клинок	weapon	10	0	0	2
89	frost_ingot	Морозный слиток	material	0	0	0	3
90	ice_cloth	Ледяная ткань	material	0	0	0	3
91	frozen_plank	Мерзлая доска	material	0	0	0	3
92	glacier_sword	Ледниковый меч	weapon	25	0	3	3
93	blizzard_staff	Посох метели	weapon	22	0	5	3
94	frost_lute	Морозная лютня	weapon	20	0	6	3
95	alch_ice_scepter	Ледяной скипетр	weapon	18	0	8	3
96	frost_shield	Морозный щит	armor	0	20	0	3
97	snow_robe	Снежная роба	armor	0	12	8	3
98	ice_ring	Ледяное кольцо	accessory	0	5	5	3
99	iron_ore	Железная руда	material	0	0	0	4
100	rust	Ржавчина	material	0	0	0	4
101	acid_gland	Кислотная железа	material	0	0	0	4
102	coral	Кровавый коралл	material	0	0	0	4
103	iron_ingot	Железный слиток	material	0	0	0	4
104	treated_leather	Обработанная кожа	material	0	0	0	4
105	rusty_plank	Пропитанная доска	material	0	0	0	4
106	iron_sword	Железный меч	weapon	35	0	4	4
107	acid_staff	Кислотный посох	weapon	30	0	8	4
108	rusty_bow	Ржавый лук	weapon	32	0	6	4
109	alch_acid_flask	Кислотная бомба	weapon	28	0	10	4
110	iron_armor	Железная броня	armor	0	30	3	4
111	acid_robe	Кислотная мантия	armor	0	20	10	4
112	corrosion_ring	Кольцо коррозии	accessory	0	10	5	4
113	acid_steel	Кислотная сталь	material	0	0	0	4
114	rusty_dagger	Ржавый кинжал	weapon	38	0	6	4
115	coral_ring	Коралловое кольцо	accessory	0	8	8	4
116	iron_helm	Железный шлем	armor	0	25	1	4
119	magic_essence	Эссенция магии	material	0	0	0	5
120	stardust	Звездная пыль	material	0	0	0	5
121	ancient_scroll	Древний свиток	material	0	0	0	5
122	void_shard	Осколок пустоты	material	0	0	0	5
123	arcane_ingot	Тайный слиток	material	0	0	0	5
124	star_cloth	Звездная ткань	material	0	0	0	5
125	runic_plank	Руническая доска	material	0	0	0	5
126	archmage_staff	Посох Архимага	weapon	60	0	20	5
127	void_blade	Клинок Пустоты	weapon	65	0	15	5
128	starlight_bow	Звездный лук	weapon	62	0	18	5
129	philosophers_elixir	Эликсир Философа	weapon	55	0	25	5
130	archmage_robe	Мантия Архимага	armor	0	40	20	5
131	void_armor	Броня Пустоты	armor	0	50	10	5
132	celestial_ring	Небесное кольцо	accessory	10	10	25	5
\.


--
-- Data for Name: potion_recipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.potion_recipe (id, code, name, description, tier, cost_resource, cost_amount, cost_gold, reward_gold, reward_exp, reward_resource, reward_resource_amount) FROM stdin;
1	minor_heal	Малое зелье лечения	Мгновенно дает 50 золота.	1	herbs	5	10	50	0	\N	0
2	minor_insight	Малое зелье мудрости	Мгновенно дает 100 опыта.	1	fiber	5	10	0	100	\N	0
3	minor_luck	Малое зелье удачи	Мгновенно дает 5 самоцветов.	2	resin	10	50	0	0	gem	5
4	greater_heal	Великое зелье лечения	Мгновенно дает 500 золота.	2	lake_water	20	50	500	0	\N	0
5	greater_insight	Великое зелье мудрости	Мгновенно дает 1000 опыта.	2	enchant_dust	10	100	0	1000	\N	0
6	elixir_heal	Эликсир лечения	Мгновенно дает 1500 золота.	3	ice_crystal	20	200	1500	0	\N	0
7	elixir_insight	Эликсир мудрости	Мгновенно дает 3000 опыта.	3	snow_leather	10	300	0	3000	\N	0
8	elixir_greater_heal	Великий эликсир	Мгновенно дает 4000 золота.	4	iron_ore	20	500	4000	0	\N	0
9	elixir_greater_insight	Великий эликсир мудрости	Мгновенно дает 8000 опыта.	4	acid_gland	10	800	0	8000	\N	0
10	elixir_iron_skin	Эликсир железной кожи	Мгновенно дает 50 Железной руды.	4	rust	10	200	0	0	iron_ore	50
11	elixir_coral_vision	Эликсир кораллового зрения	Мгновенно дает 20 Кораллов.	4	acid_gland	10	300	0	0	coral	20
\.


--
-- Data for Name: raid_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raid_logs (id, character_id, raid_power, wall_defense, resources_lost, created_at) FROM stdin;
1	4	50	0	36	2026-10-25 08:17:21.968512+03
2	4	57	0	32	2026-10-26 10:46:11.902117+03
3	4	62	0	32	2026-10-26 11:33:12.283932+03
4	4	51	0	30	2026-10-26 12:42:46.906344+03
5	4	69	0	27	2026-10-26 12:44:26.300082+03
6	4	79	0	26	2026-10-26 12:54:17.591591+03
7	4	23	10	50	2026-10-26 21:08:46.369734+03
8	4	66	15	223	2026-10-27 09:52:18.022178+03
9	4	86	15	199	2026-10-27 11:47:00.174647+03
10	4	118	15	295	2026-10-30 19:40:01.063643+03
11	9	65	150	0	2026-11-02 19:03:23.766194+03
12	9	81	150	0	2026-11-02 19:20:30.037772+03
13	9	139	292	0	2026-11-02 23:30:37.079781+03
\.


--
-- Data for Name: recipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipe (id, code, result_code, result_quantity, gold_cost) FROM stdin;
27	r_moon_blade	moon_blade	1	25
28	r_crystal_staff	crystal_staff	1	25
29	r_resonance_flute	resonance_flute	1	25
30	r_philosopher_stone	philosopher_stone	1	25
31	r_silver_mail	silver_mail	1	25
32	r_mage_robe	mage_robe	1	25
33	r_moon_shield	moon_shield	1	25
34	r_sapphire_ring	sapphire_ring	1	25
35	r_moon_amulet	moon_amulet	1	25
14	r_club	wooden_club	1	15
15	r_stone_axe	stone_axe	1	15
16	r_leather_vest	leather_vest	1	15
17	r_warrior_sword	warrior_sword	1	15
18	r_mage_staff	mage_staff	1	15
19	r_bard_lute	bard_lute	1	15
20	r_alch_flask	alch_flask	1	15
21	r_sturdy_shield	sturdy_shield	1	15
22	r_cloth_hood	cloth_hood	1	15
23	r_copper_ring	copper_ring	1	15
39	r_glacier_sword	glacier_sword	1	35
40	r_blizzard_staff	blizzard_staff	1	35
41	r_frost_lute	frost_lute	1	35
42	r_alch_ice_scepter	alch_ice_scepter	1	35
43	r_frost_shield	frost_shield	1	35
44	r_snow_robe	snow_robe	1	35
45	r_ice_ring	ice_ring	1	35
49	r_iron_sword	iron_sword	1	45
50	r_acid_staff	acid_staff	1	45
51	r_rusty_bow	rusty_bow	1	45
52	r_alch_acid_flask	alch_acid_flask	1	45
53	r_iron_armor	iron_armor	1	45
54	r_acid_robe	acid_robe	1	45
55	r_corrosion_ring	corrosion_ring	1	45
57	r_rusty_dagger	rusty_dagger	1	45
58	r_coral_ring	coral_ring	1	45
59	r_iron_helm	iron_helm	1	45
65	r_archmage_staff	archmage_staff	1	55
66	r_void_blade	void_blade	1	55
67	r_starlight_bow	starlight_bow	1	55
68	r_philosophers_elixir	philosophers_elixir	1	55
69	r_archmage_robe	archmage_robe	1	55
70	r_void_armor	void_armor	1	55
71	r_celestial_ring	celestial_ring	1	55
11	r_plank	wooden_plank	1	0
12	r_stone_block	stone_block	1	0
13	r_leather_strip	leather_strip	1	0
24	r_silver_ingot	silver_ingot	1	0
25	r_enchanted_cloth	enchanted_cloth	1	0
26	r_spirit_wood	spirit_wood	1	0
36	r_frost_ingot	frost_ingot	1	0
37	r_ice_cloth	ice_cloth	1	0
38	r_frozen_plank	frozen_plank	1	0
46	r_iron_ingot	iron_ingot	1	0
47	r_treated_leather	treated_leather	1	0
48	r_rusty_plank	rusty_plank	1	0
56	r_acid_steel	acid_steel	1	0
62	r_arcane_ingot	arcane_ingot	1	0
63	r_star_cloth	star_cloth	1	0
64	r_runic_plank	runic_plank	1	0
\.


--
-- Data for Name: recipe_ingredient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipe_ingredient (recipe_id, resource_type, amount) FROM stdin;
11	twig	2
12	stone	3
13	hide	2
14	wooden_plank	2
14	fiber	1
15	wooden_plank	1
15	stone_block	2
15	fiber	1
16	leather_strip	3
17	wooden_plank	2
17	stone_block	2
17	fiber	1
18	wooden_plank	2
18	gem	1
18	resin	2
19	wooden_plank	2
19	fiber	2
19	leather_strip	1
20	stone_block	2
20	resin	2
20	flint	1
21	wooden_plank	3
21	stone_block	3
22	fiber	3
22	leather	1
23	flint	1
23	gem	1
24	silver_ore	3
25	enchant_dust	2
25	lake_water	1
26	lake_water	2
26	mana_crystal	1
27	silver_ingot	2
27	mana_crystal	1
28	spirit_wood	2
28	mana_crystal	2
29	spirit_wood	2
29	enchanted_cloth	1
30	silver_ingot	1
30	enchant_dust	3
31	silver_ingot	3
32	enchanted_cloth	2
33	silver_ingot	2
33	spirit_wood	1
34	mana_crystal	1
35	silver_ingot	1
36	frost_ore	3
37	snow_leather	2
37	ice_crystal	1
38	frozen_wood	2
38	ice_crystal	1
39	frost_ingot	3
40	frozen_plank	1
40	ice_crystal	3
41	frozen_plank	2
41	ice_cloth	1
42	frost_ingot	1
42	ice_crystal	2
43	frost_ingot	4
44	ice_cloth	3
45	frost_ingot	1
45	ice_crystal	2
46	iron_ore	3
47	acid_gland	2
47	coral	1
48	rust	2
48	coral	1
49	iron_ingot	3
50	rusty_plank	1
50	acid_gland	3
51	rusty_plank	2
51	treated_leather	2
52	iron_ingot	1
52	acid_gland	2
53	iron_ingot	4
54	treated_leather	3
55	iron_ingot	1
55	coral	2
56	iron_ingot	2
56	acid_gland	1
57	iron_ingot	2
57	rust	1
58	coral	2
58	acid_steel	1
59	acid_steel	2
59	treated_leather	1
50	acid_steel	2
50	coral	1
62	magic_essence	3
63	stardust	3
64	ancient_scroll	3
65	arcane_ingot	3
66	void_shard	2
67	runic_plank	2
69	star_cloth	3
70	arcane_ingot	2
71	void_shard	1
68	stardust	2
68	magic_essence	2
\.


--
-- Data for Name: salvage_by_tier_slot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.salvage_by_tier_slot (tier, slot, resource_type, amount) FROM stdin;
1	weapon	wooden_plank	1
1	armor	leather_strip	1
1	accessory	fiber	1
2	weapon	silver_ore	2
2	weapon	enchant_dust	1
2	armor	enchanted_cloth	2
2	armor	silver_ore	1
2	accessory	mana_crystal	1
2	accessory	enchant_dust	1
3	weapon	frost_ingot	2
3	weapon	ice_crystal	1
3	armor	ice_cloth	2
3	armor	snow_leather	1
3	accessory	ice_crystal	1
3	accessory	frost_ore	1
4	weapon	iron_ingot	2
4	weapon	rust	1
4	armor	acid_steel	2
4	armor	treated_leather	1
4	accessory	coral	1
4	accessory	acid_gland	1
5	weapon	arcane_ingot	2
5	weapon	void_shard	1
5	armor	star_cloth	2
5	armor	arcane_ingot	1
5	accessory	stardust	1
5	accessory	void_shard	1
\.


--
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_id_seq', 117, true);


--
-- Name: achievements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.achievements_id_seq', 25, true);


--
-- Name: character_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.character_id_seq', 113, true);


--
-- Name: character_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.character_item_id_seq', 144402, true);


--
-- Name: city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_id_seq', 10, true);


--
-- Name: clans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clans_id_seq', 17, true);


--
-- Name: coop_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coop_groups_id_seq', 7, true);


--
-- Name: food_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_recipe_id_seq', 16, true);


--
-- Name: friendships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.friendships_id_seq', 118, true);


--
-- Name: item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_id_seq', 132, true);


--
-- Name: potion_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.potion_recipe_id_seq', 11, true);


--
-- Name: raid_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.raid_logs_id_seq', 13, true);


--
-- Name: recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recipe_id_seq', 71, true);


--
-- Name: account account_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_email_key UNIQUE (email);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: account account_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_username_key UNIQUE (username);


--
-- Name: achievements achievements_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievements
    ADD CONSTRAINT achievements_code_key UNIQUE (code);


--
-- Name: achievements achievements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (id);


--
-- Name: character_achievements character_achievements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_achievements
    ADD CONSTRAINT character_achievements_pkey PRIMARY KEY (character_id, achievement_id);


--
-- Name: character_item character_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_item
    ADD CONSTRAINT character_item_pkey PRIMARY KEY (id);


--
-- Name: character character_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."character"
    ADD CONSTRAINT character_pkey PRIMARY KEY (id);


--
-- Name: city city_character_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_character_id_key UNIQUE (character_id);


--
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- Name: city_resource city_resource_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city_resource
    ADD CONSTRAINT city_resource_pkey PRIMARY KEY (city_id, resource_type);


--
-- Name: city_upgrade city_upgrade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city_upgrade
    ADD CONSTRAINT city_upgrade_pkey PRIMARY KEY (city_id, upgrade_code);


--
-- Name: clans clans_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clans
    ADD CONSTRAINT clans_name_key UNIQUE (name);


--
-- Name: clans clans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clans
    ADD CONSTRAINT clans_pkey PRIMARY KEY (id);


--
-- Name: coop_groups coop_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coop_groups
    ADD CONSTRAINT coop_groups_pkey PRIMARY KEY (id);


--
-- Name: food_recipe food_recipe_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_recipe
    ADD CONSTRAINT food_recipe_code_key UNIQUE (code);


--
-- Name: food_recipe food_recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_recipe
    ADD CONSTRAINT food_recipe_pkey PRIMARY KEY (id);


--
-- Name: friendships friendships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT friendships_pkey PRIMARY KEY (id);


--
-- Name: friendships friendships_requester_id_receiver_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT friendships_requester_id_receiver_id_key UNIQUE (requester_id, receiver_id);


--
-- Name: item item_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_code_key UNIQUE (code);


--
-- Name: item item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id);


--
-- Name: potion_recipe potion_recipe_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.potion_recipe
    ADD CONSTRAINT potion_recipe_code_key UNIQUE (code);


--
-- Name: potion_recipe potion_recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.potion_recipe
    ADD CONSTRAINT potion_recipe_pkey PRIMARY KEY (id);


--
-- Name: raid_logs raid_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raid_logs
    ADD CONSTRAINT raid_logs_pkey PRIMARY KEY (id);


--
-- Name: recipe recipe_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT recipe_code_key UNIQUE (code);


--
-- Name: recipe_ingredient recipe_ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_ingredient
    ADD CONSTRAINT recipe_ingredient_pkey PRIMARY KEY (recipe_id, resource_type);


--
-- Name: recipe recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT recipe_pkey PRIMARY KEY (id);


--
-- Name: salvage_by_tier_slot salvage_by_tier_slot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salvage_by_tier_slot
    ADD CONSTRAINT salvage_by_tier_slot_pkey PRIMARY KEY (tier, slot, resource_type);


--
-- Name: character uq_character_account; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."character"
    ADD CONSTRAINT uq_character_account UNIQUE (account_id);


--
-- Name: idx_character_isonline_last_seen; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_character_isonline_last_seen ON public."character" USING btree (isonline, last_seen);


--
-- Name: idx_character_item_char; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_character_item_char ON public.character_item USING btree (character_id);


--
-- Name: idx_character_item_equipped; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_character_item_equipped ON public.character_item USING btree (character_id, equipped);


--
-- Name: idx_city_character; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_city_character ON public.city USING btree (character_id);


--
-- Name: idx_city_resource_city; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_city_resource_city ON public.city_resource USING btree (city_id);


--
-- Name: idx_recipe_ingredient_recipe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_recipe_ingredient_recipe ON public.recipe_ingredient USING btree (recipe_id);


--
-- Name: character_achievements character_achievements_achievement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_achievements
    ADD CONSTRAINT character_achievements_achievement_id_fkey FOREIGN KEY (achievement_id) REFERENCES public.achievements(id) ON DELETE CASCADE;


--
-- Name: character_achievements character_achievements_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_achievements
    ADD CONSTRAINT character_achievements_character_id_fkey FOREIGN KEY (character_id) REFERENCES public."character"(id) ON DELETE CASCADE;


--
-- Name: character character_clan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."character"
    ADD CONSTRAINT character_clan_id_fkey FOREIGN KEY (clan_id) REFERENCES public.clans(id);


--
-- Name: character character_coop_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."character"
    ADD CONSTRAINT character_coop_group_id_fkey FOREIGN KEY (coop_group_id) REFERENCES public.coop_groups(id);


--
-- Name: character_item character_item_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.character_item
    ADD CONSTRAINT character_item_character_id_fkey FOREIGN KEY (character_id) REFERENCES public."character"(id) ON DELETE CASCADE;


--
-- Name: city city_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_character_id_fkey FOREIGN KEY (character_id) REFERENCES public."character"(id) ON DELETE CASCADE;


--
-- Name: city_resource city_resource_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city_resource
    ADD CONSTRAINT city_resource_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.city(id) ON DELETE CASCADE;


--
-- Name: city_upgrade city_upgrade_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city_upgrade
    ADD CONSTRAINT city_upgrade_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.city(id) ON DELETE CASCADE;


--
-- Name: clans clans_leader_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clans
    ADD CONSTRAINT clans_leader_id_fkey FOREIGN KEY (leader_id) REFERENCES public."character"(id);


--
-- Name: coop_groups coop_groups_leader_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coop_groups
    ADD CONSTRAINT coop_groups_leader_id_fkey FOREIGN KEY (leader_id) REFERENCES public."character"(id);


--
-- Name: character fk_character_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."character"
    ADD CONSTRAINT fk_character_account FOREIGN KEY (account_id) REFERENCES public.account(id) ON DELETE CASCADE;


--
-- Name: friendships friendships_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT friendships_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public."character"(id) ON DELETE CASCADE;


--
-- Name: friendships friendships_requester_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT friendships_requester_id_fkey FOREIGN KEY (requester_id) REFERENCES public."character"(id) ON DELETE CASCADE;


--
-- Name: raid_logs raid_logs_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raid_logs
    ADD CONSTRAINT raid_logs_character_id_fkey FOREIGN KEY (character_id) REFERENCES public."character"(id) ON DELETE CASCADE;


--
-- Name: recipe_ingredient recipe_ingredient_recipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_ingredient
    ADD CONSTRAINT recipe_ingredient_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES public.recipe(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict L0DmAz18ZeT6hb31ick5JRdli3jd12er20sVq57EvwqZCcwladyMEXwDyqbwVkC

