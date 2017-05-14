--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: portalc3; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE portalc3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';


ALTER DATABASE portalc3 OWNER TO postgres;

\connect portalc3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE articles (
    id integer NOT NULL,
    title character varying,
    description text,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone
);


ALTER TABLE articles OWNER TO postgres;

--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE articles_id_seq OWNER TO postgres;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE articles_id_seq OWNED BY articles.id;


--
-- Name: class_files; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE class_files (
    id integer NOT NULL,
    discipline_class_id integer,
    attachment_file_name character varying,
    attachment_content_type character varying,
    attachment_file_size integer,
    attachment_updated_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE class_files OWNER TO postgres;

--
-- Name: class_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE class_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE class_files_id_seq OWNER TO postgres;

--
-- Name: class_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE class_files_id_seq OWNED BY class_files.id;


--
-- Name: discipline_classes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE discipline_classes (
    id integer NOT NULL,
    name character varying,
    discipline_id integer,
    user_id integer,
    shift integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE discipline_classes OWNER TO postgres;

--
-- Name: discipline_classes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE discipline_classes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE discipline_classes_id_seq OWNER TO postgres;

--
-- Name: discipline_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE discipline_classes_id_seq OWNED BY discipline_classes.id;


--
-- Name: disciplines; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE disciplines (
    id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    code character varying DEFAULT ''::character varying NOT NULL,
    link character varying,
    credit integer NOT NULL,
    hours integer,
    semester integer NOT NULL,
    shift integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE disciplines OWNER TO postgres;

--
-- Name: disciplines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE disciplines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE disciplines_id_seq OWNER TO postgres;

--
-- Name: disciplines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE disciplines_id_seq OWNED BY disciplines.id;


--
-- Name: disciplines_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE disciplines_users (
    discipline_id integer,
    user_id integer
);


ALTER TABLE disciplines_users OWNER TO postgres;

--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE events (
    id integer NOT NULL,
    title character varying,
    description character varying,
    place character varying,
    user_id integer,
    date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone
);


ALTER TABLE events OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE events_id_seq OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: materials; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE materials (
    id integer NOT NULL,
    name character varying,
    attachment character varying,
    discipline_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer
);


ALTER TABLE materials OWNER TO postgres;

--
-- Name: materials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE materials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE materials_id_seq OWNER TO postgres;

--
-- Name: materials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE materials_id_seq OWNED BY materials.id;


--
-- Name: oportunities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oportunities (
    id integer NOT NULL,
    title character varying,
    employer character varying,
    description text,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone
);


ALTER TABLE oportunities OWNER TO postgres;

--
-- Name: oportunities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oportunities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oportunities_id_seq OWNER TO postgres;

--
-- Name: oportunities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oportunities_id_seq OWNED BY oportunities.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO postgres;

--
-- Name: user_profiles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE user_profiles (
    id integer NOT NULL,
    is_teacher boolean,
    phone character varying,
    degree character varying,
    lattes character varying,
    link character varying,
    role character varying,
    interests text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE user_profiles OWNER TO postgres;

--
-- Name: user_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_profiles_id_seq OWNER TO postgres;

--
-- Name: user_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_profiles_id_seq OWNED BY user_profiles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying,
    role integer,
    user_profile_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    enrollment character varying DEFAULT ''::character varying NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet
);


ALTER TABLE users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY articles ALTER COLUMN id SET DEFAULT nextval('articles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY class_files ALTER COLUMN id SET DEFAULT nextval('class_files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY discipline_classes ALTER COLUMN id SET DEFAULT nextval('discipline_classes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY disciplines ALTER COLUMN id SET DEFAULT nextval('disciplines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materials ALTER COLUMN id SET DEFAULT nextval('materials_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oportunities ALTER COLUMN id SET DEFAULT nextval('oportunities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_profiles ALTER COLUMN id SET DEFAULT nextval('user_profiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY articles (id, title, description, user_id, created_at, updated_at, image_file_name, image_content_type, image_file_size, image_updated_at) FROM stdin;
3	Inscrições abertas para mestrados e doutorados na Católica	<p align="justify">A Universidade Católica de Pernambuco está com inscrições abertas para \r\nseus programas de pós-graduação. A UNICAP oferece sete mestrados e \r\nquatro doutorados. Cada programa tem um edital específico com os \r\nprocedimentos para a seleção. As inscrições online devem ser feitas no \r\nwww.unicap.br. Outras informações podem ser obtidas na Secretaria do <em>Strictu Sensu</em>,\r\n no setor A, 8º andar do bloco G4. O horário de atendimento é das 8h30 \r\nàs 11h e das 13h às 17h, de segunda a sexta-feira. O telefone é o \r\n&nbsp;2119-4369. <br></p>	17	2016-11-28 11:19:05.983086	2016-12-02 13:13:16.700401	\N	\N	\N	\N
\.


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('articles_id_seq', 8, true);


--
-- Data for Name: class_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY class_files (id, discipline_class_id, attachment_file_name, attachment_content_type, attachment_file_size, attachment_updated_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: class_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('class_files_id_seq', 1, false);


--
-- Data for Name: discipline_classes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY discipline_classes (id, name, discipline_id, user_id, shift, created_at, updated_at) FROM stdin;
\.


--
-- Name: discipline_classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('discipline_classes_id_seq', 1, false);


--
-- Data for Name: disciplines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY disciplines (id, name, code, link, credit, hours, semester, shift, created_at, updated_at) FROM stdin;
1	INTRODUCAO A PROGRAMACAO I	INF1121	http://www.unicap.br/pdf/ementa/INF11212014100000.pdf	4	60	1	1	2016-11-21 17:07:34.243175	2016-11-21 17:07:34.243175
2	COMPUTACAO GRAFICA	INF1701	http://www.unicap.br/pdf/ementa/INF17012008200000.pdf	4	60	7	1	2016-11-21 17:07:34.248976	2016-11-21 17:07:34.248976
3	ENGENHARIA DE SOFTWARE	INF1720	http://www.unicap.br/pdf/ementa/INF17202005200000.pdf	4	60	7	1	2016-11-21 17:07:34.257251	2016-11-21 17:07:34.257251
5	INFORMATICA E ADMINISTRACAO	INF1502	http://www.unicap.br/pdf/ementa/INF15022009100000.pdf	4	60	5	1	2016-11-21 17:07:34.290885	2016-11-21 17:07:34.290885
6	PARADIG DE LING DE PROGRAMACAO	INF1125	http://www.unicap.br/pdf/ementa/INF11252014100000.pdf	4	60	5	1	2016-11-21 17:07:34.299084	2016-11-21 17:07:34.299084
7	ARQ E ORG DE COMPUTADORES II	INF1407	http://www.unicap.br/pdf/ementa/INF14072009100000.pdf	4	60	5	1	2016-11-21 17:07:34.307374	2016-11-21 17:07:34.307374
8	LINGUAGENS FORMAIS	INF1126	http://www.unicap.br/pdf/ementa/INF11262013100000.pdf	4	60	5	1	2016-11-21 17:07:34.315655	2016-11-21 17:07:34.315655
10	COMPILADORES	INF1127	http://www.unicap.br/pdf/ementa/INF11272013100000.pdf	4	60	6	1	2016-11-21 17:07:34.332464	2016-11-21 17:07:34.332464
11	REDES DE COMPUTADORES I	INF1616	http://www.unicap.br/pdf/ementa/INF16162009100000.pdf	4	60	6	1	2016-11-21 17:07:34.340588	2016-11-21 17:07:34.340588
12	SISTEMAS DE INFORMACAO	INF1506	http://www.unicap.br/pdf/ementa/INF15062005200000.pdf	4	60	6	1	2016-11-21 17:07:34.348888	2016-11-21 17:07:34.348888
14	SISTEMAS OPERACIONAIS I	INF1218	http://www.unicap.br/pdf/ementa/INF12182012200000.pdf	4	60	7	1	2016-11-21 17:07:34.365603	2016-11-21 17:07:34.365603
15	BANCO DE DADOS II	INF1224	http://www.unicap.br/pdf/ementa/INF12242013100000.pdf	4	60	7	1	2016-11-21 17:07:34.373924	2016-11-21 17:07:34.373924
16	REDES DE COMPUTADORES II	INF1617	http://www.unicap.br/pdf/ementa/INF16172009100000.pdf	4	60	7	1	2016-11-21 17:07:34.382296	2016-11-21 17:07:34.382296
17	SISTEMAS OPERACIONAIS II	INF1219	http://www.unicap.br/pdf/ementa/INF12192012200000.pdf	4	60	8	1	2016-11-21 17:07:34.390604	2016-11-21 17:07:34.390604
18	SISTEMAS MULTIMIDIA	INF1715	http://www.unicap.br/pdf/ementa/INF17152009100000.pdf	4	60	7	0	2016-11-21 17:07:34.398921	2016-11-21 17:07:34.398921
19	SISTEMAS DISTRIBUIDOS	INF1630	http://www.unicap.br/pdf/ementa/INF16302005200000.pdf	4	60	8	1	2016-11-21 17:07:34.406901	2016-11-21 17:07:34.406901
20	ANALISE E PROJETO DE SISTEMAS	INF1508	http://www.unicap.br/pdf/ementa/INF15082005200000.pdf	4	60	8	1	2016-11-21 17:07:34.415082	2016-11-21 17:07:34.415082
21	ELETIVA DO CURSO DE QUATRO CR	ELC1040	\N	4	60	8	1	2016-11-21 17:07:34.42338	2016-11-21 17:07:34.42338
23	INFORMATICA E SOCIEDADE	SOC1230	http://www.unicap.br/pdf/ementa/SOC12302007200000.pdf	4	60	9	1	2016-11-21 17:07:34.440046	2016-11-21 17:07:34.440046
24	TRABALHO DE CONCLUSAO DE CURSO	INF1808	http://www.unicap.br/pdf/ementa/INF18082005200000.pdf	4	60	9	1	2016-11-21 17:07:34.448599	2016-11-21 17:07:34.448599
25	CALCULO DIF E INTEGRAL I	MAT1009	http://www.unicap.br/pdf/ementa/MAT10092012100000.pdf	4	60	1	1	2016-11-21 17:07:34.456823	2016-11-21 17:07:34.456823
26	PORTUGUES INSTRUMENTAL II	LET1057	http://www.unicap.br/pdf/ementa/LET10572012100000.pdf	4	60	1	1	2016-11-21 17:07:34.465175	2016-11-21 17:07:34.465175
27	LOGICA MATEMATICA	INF1200	http://www.unicap.br/pdf/ementa/INF12002007200000.pdf	4	60	1	1	2016-11-21 17:07:34.473334	2016-11-21 17:07:34.473334
30	CALCULO DIF E INTEGRAL II	MAT1010	http://www.unicap.br/pdf/ementa/MAT10102012100000.pdf	4	60	2	1	2016-11-21 17:07:34.498306	2016-11-21 17:07:34.498306
31	ALGEBRA LINEAR I	MAT1421	http://www.unicap.br/pdf/ementa/MAT14212012100000.pdf	4	60	2	1	2016-11-21 17:07:34.506617	2016-11-21 17:07:34.506617
32	INGLES APLICADO A INFORMATICA	LET1163	http://www.unicap.br/pdf/ementa/LET11632010100000.pdf	4	60	2	1	2016-11-21 17:07:34.514912	2016-11-21 17:07:34.514912
33	INTRODUCAO A PROGRAMACAO II	INF1122	http://www.unicap.br/pdf/ementa/INF11222014100000.pdf	4	60	2	1	2016-11-21 17:07:34.523153	2016-11-21 17:07:34.523153
34	ESTRUTURA DE DADOS I	INF1209	http://www.unicap.br/pdf/ementa/INF12092005200000.pdf	4	60	3	1	2016-11-21 17:07:34.53123	2016-11-21 17:07:34.53123
35	MATEMATICA DISCRETA	INF1216	http://www.unicap.br/pdf/ementa/INF12162013200000.pdf	4	60	3	1	2016-11-21 17:07:34.5395	2016-11-21 17:07:34.5395
38	CIRCUITOS DIGITAIS	INF1405	http://www.unicap.br/pdf/ementa/INF14052013100000.pdf	4	60	3	1	2016-11-21 17:07:34.564581	2016-11-21 17:07:34.564581
39	BANCO DE DADOS I	INF1223	http://www.unicap.br/pdf/ementa/INF12232010100000.pdf	4	60	6	1	2016-11-21 17:07:34.572917	2016-11-21 17:07:34.572917
40	PROGRAMACAO ORIENTADA A OBJETO	INF1123	http://www.unicap.br/pdf/ementa/INF11232014100000.pdf	4	60	4	1	2016-11-21 17:07:34.581312	2016-11-21 17:07:34.581312
41	METODOS NUMERICOS	INF1023	http://www.unicap.br/pdf/ementa/INF10232014100000.pdf	4	60	4	1	2016-11-21 17:07:34.589672	2016-11-21 17:07:34.589672
42	PRATICA DE PROGRAMACAO	INF1124	http://www.unicap.br/pdf/ementa/INF11242014100000.pdf	4	60	4	1	2016-11-21 17:07:34.597939	2016-11-21 17:07:34.597939
43	ARQ E ORG DE COMPUTADORES I	INF1406	http://www.unicap.br/pdf/ementa/INF14062009100000.pdf	4	60	4	1	2016-11-21 17:07:34.606072	2016-11-21 17:07:34.606072
44	PROGRAMACAO ORIENTADA A OBJETO	INF1123	http://www.unicap.br/pdf/ementa/INF11232014100000.pdf	4	60	4	0	2016-11-21 17:07:34.614457	2016-11-21 17:07:34.614457
45	ESTRUTURA DE DADOS II	INF1217	http://www.unicap.br/pdf/ementa/INF12172005200000.pdf	4	60	4	1	2016-11-21 17:07:34.622805	2016-11-21 17:07:34.622805
46	ARQ E ORG DE COMPUTADORES I	INF1406	http://www.unicap.br/pdf/ementa/INF14062009100000.pdf	4	60	4	0	2016-11-21 17:07:34.631257	2016-11-21 17:07:34.631257
47	ESTRUTURA DE DADOS II	INF1217	http://www.unicap.br/pdf/ementa/INF12172005200000.pdf	4	60	4	0	2016-11-21 17:07:34.639409	2016-11-21 17:07:34.639409
48	INFORMATICA E ADMINISTRACAO	INF1502	http://www.unicap.br/pdf/ementa/INF15022009100000.pdf	4	60	4	0	2016-11-21 17:07:34.64755	2016-11-21 17:07:34.64755
49	PRATICA DE PROGRAMACAO	INF1124	http://www.unicap.br/pdf/ementa/INF11242014100000.pdf	4	60	4	0	2016-11-21 17:07:34.655733	2016-11-21 17:07:34.655733
50	PORTUGUES INSTRUMENTAL II	LET1057	http://www.unicap.br/pdf/ementa/LET10572012100000.pdf	4	60	1	0	2016-11-21 17:07:34.664542	2016-11-21 17:07:34.664542
51	CALCULO DIF E INTEGRAL I	MAT1009	http://www.unicap.br/pdf/ementa/MAT10092012100000.pdf	4	60	1	0	2016-11-21 17:07:34.672653	2016-11-21 17:07:34.672653
53	INTROD A CIENCIA DA COMPUTACAO	INF1028	http://www.unicap.br/pdf/ementa/INF10282013100000.pdf	4	60	1	0	2016-11-21 17:07:34.689034	2016-11-21 17:07:34.689034
13	ANÁLISE DE ALGORITMOS	INF1208	http://www.unicap.br/pdf/ementa/INF12082005200000.pdf	4	60	6	1	2016-11-21 17:07:34.357178	2016-11-28 14:00:51.279755
22	ESTAGIO	INF1807	http://www.unicap.br/pdf/ementa/INF18072005200000.pdf	16	240	10	0	2016-11-21 17:07:34.431654	2017-03-06 16:32:25.70929
9	GRAFOS	EST1704	http://www.unicap.br/pdf/ementa/EST17042014100000.pdf	4	60	5	1	2016-11-21 17:07:34.32413	2017-02-23 16:43:59.482535
28	INTROD A CIENCIA DA COMPUTACAO	INF1028	http://www.unicap.br/pdf/ementa/INF10282013100000.pdf	4	60	1	1	2016-11-21 17:07:34.481607	2017-03-06 15:59:51.438296
37	HUMANISMO E CIDADANIA	TEO1916	http://www.unicap.br/pdf/ementa/TEO19162009200000.pdf	4	60	4	1	2016-11-21 17:07:34.556576	2017-03-07 12:54:21.930601
36	ESTATISTICA E PROBABILIDADE	EST1408	http://www.unicap.br/pdf/ementa/EST14082013100000.pdf	4	60	3	0	2016-11-21 17:07:34.548199	2017-03-07 16:46:39.346607
54	LOGICA MATEMATICA	INF1200	http://www.unicap.br/pdf/ementa/INF12002007200000.pdf	4	60	1	0	2016-11-21 17:07:34.697439	2016-11-21 17:07:34.697439
55	INTRODUCAO A PROGRAMACAO I	INF1121	http://www.unicap.br/pdf/ementa/INF11212014100000.pdf	4	60	1	0	2016-11-21 17:07:34.705651	2016-11-21 17:07:34.705651
56	ELETRONICA BASICA	FIS1607	http://www.unicap.br/pdf/ementa/FIS16072007100000.pdf	6	90	2	0	2016-11-21 17:07:34.714007	2016-11-21 17:07:34.714007
57	INGLES APLICADO A INFORMATICA	LET1163	http://www.unicap.br/pdf/ementa/LET11632010100000.pdf	4	60	2	0	2016-11-21 17:07:34.722486	2016-11-21 17:07:34.722486
59	INTRODUCAO A PROGRAMACAO II	INF1122	http://www.unicap.br/pdf/ementa/INF11222014100000.pdf	4	60	2	0	2016-11-21 17:07:34.738912	2016-11-21 17:07:34.738912
60	CALCULO DIF E INTEGRAL II	MAT1010	http://www.unicap.br/pdf/ementa/MAT10102012100000.pdf	4	60	2	0	2016-11-21 17:07:34.747311	2016-11-21 17:07:34.747311
61	ALGEBRA LINEAR I	MAT1421	http://www.unicap.br/pdf/ementa/MAT14212012100000.pdf	4	60	2	0	2016-11-21 17:07:34.755192	2016-11-21 17:07:34.755192
63	MATEMATICA DISCRETA	INF1216	http://www.unicap.br/pdf/ementa/INF12162013200000.pdf	4	60	3	0	2016-11-21 17:07:34.772147	2016-11-21 17:07:34.772147
64	ESTRUTURA DE DADOS I	INF1209	http://www.unicap.br/pdf/ementa/INF12092005200000.pdf	4	60	3	0	2016-11-21 17:07:34.780589	2016-11-21 17:07:34.780589
65	CIRCUITOS DIGITAIS	INF1405	http://www.unicap.br/pdf/ementa/INF14052013100000.pdf	4	60	3	0	2016-11-21 17:07:34.788869	2016-11-21 17:07:34.788869
66	HUMANISMO E CIDADANIA	TEO1916	http://www.unicap.br/pdf/ementa/TEO19162009200000.pdf	4	60	3	0	2016-11-21 17:07:34.797088	2016-11-21 17:07:34.797088
67	METODOS NUMERICOS	INF1023	http://www.unicap.br/pdf/ementa/INF10232014100000.pdf	4	60	3	0	2016-11-21 17:07:34.805256	2016-11-21 17:07:34.805256
68	LINGUAGENS FORMAIS	INF1126	http://www.unicap.br/pdf/ementa/INF11262013100000.pdf	4	60	4	0	2016-11-21 17:07:34.813436	2016-11-21 17:07:34.813436
69	PARADIG DE LING DE PROGRAMACAO	INF1125	http://www.unicap.br/pdf/ementa/INF11252014100000.pdf	4	60	5	0	2016-11-21 17:07:34.821935	2016-11-21 17:07:34.821935
70	BANCO DE DADOS I	INF1223	http://www.unicap.br/pdf/ementa/INF12232010100000.pdf	4	60	5	0	2016-11-21 17:07:34.830128	2016-11-21 17:07:34.830128
71	COMPILADORES	INF1127	http://www.unicap.br/pdf/ementa/INF11272013100000.pdf	4	60	5	0	2016-11-21 17:07:34.838477	2016-11-21 17:07:34.838477
72	SISTEMAS DE INFORMACAO	INF1506	http://www.unicap.br/pdf/ementa/INF15062005200000.pdf	4	60	5	0	2016-11-21 17:07:34.846673	2016-11-21 17:07:34.846673
73	ARQ E ORG DE COMPUTADORES II	INF1407	http://www.unicap.br/pdf/ementa/INF14072009100000.pdf	4	60	5	0	2016-11-21 17:07:34.85495	2016-11-21 17:07:34.85495
75	SISTEMAS OPERACIONAIS I	INF1218	http://www.unicap.br/pdf/ementa/INF12182012200000.pdf	4	60	6	0	2016-11-21 17:07:34.871499	2016-11-21 17:07:34.871499
76	BANCO DE DADOS II	INF1224	http://www.unicap.br/pdf/ementa/INF12242013100000.pdf	4	60	6	0	2016-11-21 17:07:34.880077	2016-11-21 17:07:34.880077
77	REDES DE COMPUTADORES I	INF1616	http://www.unicap.br/pdf/ementa/INF16162009100000.pdf	4	60	6	0	2016-11-21 17:07:34.888604	2016-11-21 17:07:34.888604
78	ENGENHARIA DE SOFTWARE	INF1720	http://www.unicap.br/pdf/ementa/INF17202005200000.pdf	4	60	6	0	2016-11-21 17:07:34.896681	2016-11-21 17:07:34.896681
79	COMPUTACAO GRAFICA	INF1701	http://www.unicap.br/pdf/ementa/INF17012008200000.pdf	4	60	6	0	2016-11-21 17:07:34.904879	2016-11-21 17:07:34.904879
80	ANÁLISE DE ALGORITMOS	INF1701	http://www.unicap.br/pdf/ementa/INF12082005200000.pdf	4	60	6	0	2016-11-21 17:07:34.913172	2016-11-21 17:07:34.913172
81	ELETIVA DO CURSO DE QUATRO CR	ELC1040	\N	4	60	7	0	2016-11-21 17:07:34.921403	2016-11-21 17:07:34.921403
82	SISTEMAS OPERACIONAIS II	INF1219	http://www.unicap.br/pdf/ementa/INF12192012200000.pdf	4	60	7	0	2016-11-21 17:07:34.929673	2016-11-21 17:07:34.929673
83	ANALISE E PROJETO DE SISTEMAS	INF1508	http://www.unicap.br/pdf/ementa/INF15082005200000.pdf	4	60	7	0	2016-11-21 17:07:34.938007	2016-11-21 17:07:34.938007
84	REDES DE COMPUTADORES II	INF1617	http://www.unicap.br/pdf/ementa/INF16172009100000.pdf	4	60	7	0	2016-11-21 17:07:34.946299	2016-11-21 17:07:34.946299
85	INFORMATICA E SOCIEDADE	SOC1230	http://www.unicap.br/pdf/ementa/SOC12302007200000.pdf	4	60	7	0	2016-11-21 17:07:34.954639	2016-11-21 17:07:34.954639
86	ELETIVA DO CURSO DE QUATRO CR	ELC1040	\N	4	60	8	0	2016-11-21 17:07:34.962809	2016-11-21 17:07:34.962809
87	SISTEMAS DISTRIBUIDOS	INF1630	http://www.unicap.br/pdf/ementa/INF16302005200000.pdf	4	60	8	0	2016-11-21 17:07:34.971113	2016-11-21 17:07:34.971113
88	ELETIVA DO CURSO DE QUATRO CR	ELC1040	\N	4	60	8	0	2016-11-21 17:07:34.979417	2016-11-21 17:07:34.979417
89	TRABALHO DE CONCLUSAO DE CURSO	INF1808	http://www.unicap.br/pdf/ementa/INF18082005200000.pdf	4	60	8	0	2016-11-21 17:07:34.987545	2016-11-21 17:07:34.987545
90	INTELIGENCIA ARTIFICIAL	INF1716	http://www.unicap.br/pdf/ementa/INF17162005200000.pdf	4	60	8	0	2016-11-21 17:07:34.996228	2016-11-21 17:07:34.996228
92	HUMANIDADE E TRANSCENDENCIA	TEO1917	http://www.unicap.br/pdf/ementa/TEO19172014100000.pdf	4	60	2	1	2016-11-21 17:07:35.012685	2016-11-21 17:07:35.012685
93	ELETIVA DO CURSO DE QUATRO CR	ELC1040	\N	4	60	9	1	2016-11-21 17:07:35.020976	2016-11-21 17:07:35.020976
94	ELETIVA DO CURSO DE QUATRO CR	ELC1040	\N	4	60	9	1	2016-11-21 17:07:35.029307	2016-11-21 17:07:35.029307
95	CIRCUITOS DIGITAIS	INF1405	http://www.unicap.br/pdf/ementa/INF14052013100000.pdf	4	60	3	0	2016-11-21 17:07:35.037768	2016-11-21 17:07:35.037768
4	SISTEMAS MULTIMIDIA	INF1715	http://www.unicap.br/pdf/ementa/INF17152009100000.pdf	4	60	8	1	2016-11-21 17:07:34.277222	2016-11-28 13:48:58.237955
98	CRIPTOGRAFIA	INF1220	http://www.unicap.br/pdf/ementa/INF12202005200000.pdf	4	60	0	1	2017-02-22 13:48:28.093511	2017-02-22 13:48:28.093511
74	GRAFOS	EST1704	http://www.unicap.br/pdf/ementa/EST17042014100000.pdf	4	60	5	0	2016-11-21 17:07:34.863053	2017-03-06 13:43:22.756268
99	FILOSOFIA E CONHECIMENTO TECNOLÓGICO	FIL1433	http://www.unicap.br/pdf/ementa/FIL14332016200000.pdf	4	60	1	1	2017-03-06 13:49:55.859425	2017-03-06 13:49:55.859425
100	FILOSOFIA E CONHECIMENTO TECNOLÓGICO	FIL1433	http://www.unicap.br/pdf/ementa/FIL14332016200000.pdf	4	60	1	0	2017-03-06 13:51:02.747808	2017-03-06 13:51:02.747808
101	ELETRÔNICA BÁSICA	FIS1607	http://www.unicap.br/pdf/ementa/FIS16072007100000.pdf	6	90	2	0	2017-03-06 13:53:17.447082	2017-03-06 13:53:17.447082
102	ELETRÔNICA BÁSICA	FIS1607	http://www.unicap.br/pdf/ementa/FIS16072007100000.pdf	6	90	2	1	2017-03-06 13:59:27.922124	2017-03-06 13:59:27.922124
103	INTELIGENCIA ARTIFICIAL	INF1716	http://www.unicap.br/pdf/ementa/INF17162005200000.pdf	4	60	9	1	2017-03-06 16:21:39.930457	2017-03-06 16:21:39.930457
104	TOPICOS AVANÇ EM COMPUTAÇÃO II	INF1722	http://www.unicap.br/pdf/ementa/INF17222005200000.pdf	4	60	0	0	2017-03-06 16:26:50.272663	2017-03-06 16:26:50.272663
91	ESTAGIO	INF1807	http://www.unicap.br/pdf/ementa/INF18072005200000.pdf	16	240	9	1	2016-11-21 17:07:35.00456	2017-03-06 16:34:15.279588
58	HUMANIDADE E TRANSCENDENCIA	TEO1917	http://www.unicap.br/pdf/ementa/TEO19172014100000.pdf	4	60	1	0	2016-11-21 17:07:34.730678	2017-03-06 16:46:06.866989
62	ESTATISTICA E PROBABILIDADE	EST1408	http://www.unicap.br/pdf/ementa/EST14082013100000.pdf	4	60	3	1	2016-11-21 17:07:34.763538	2017-03-06 18:35:46.729256
105	GEREN DE REDES DE COMPUTADORES	INF1623	http://www.unicap.br/pdf/ementa/INF16232006100000.pdf	4	60	0	1	2017-03-07 13:27:11.549809	2017-03-07 13:27:11.549809
\.


--
-- Name: disciplines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('disciplines_id_seq', 105, true);


--
-- Data for Name: disciplines_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY disciplines_users (discipline_id, user_id) FROM stdin;
4	17
13	17
9	17
19	3
59	4
90	13
10	6
38	13
98	13
62	25
67	11
28	5
55	31
55	14
1	4
33	14
40	5
103	9
3	31
104	5
91	15
24	14
39	31
15	31
65	18
43	18
7	18
5	19
12	19
83	19
11	7
16	7
105	7
2	14
42	4
6	5
8	6
27	3
34	4
45	14
14	15
17	15
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY events (id, title, description, place, user_id, date, created_at, updated_at, image_file_name, image_content_type, image_file_size, image_updated_at) FROM stdin;
3	Colação de grau oficial da UNICAP 2016.2	<p>Os formandos deverão chegar com 2 horas de antecedência.<br></p>	Teatro Guararapes. Centro de Convenções.	17	2017-01-23 19:00:00	2016-11-28 11:37:46.638628	2016-12-02 20:02:52.580596	colacao-de-grau-2016.png	image/png	43760	2016-11-28 11:37:46.494602
22	VI Semana de Computação da Universidade Católica de Pernambuco	<p>O programa do evento será divulgado em breve.</p><p><br></p><p>O D.A. de computação está selecionando alunos para ajudar na organização e realização do evento.</p><p><br></p><p>Participe, o evento é de todos os alunos de computação, inclusive você.</p>	UNICAP	5	2017-05-02 14:50:00	2017-03-14 09:16:51.984443	2017-03-14 09:16:51.984443	Semana_de_Computação_-_1.jpg	image/jpeg	1104178	2017-03-14 09:16:51.399501
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('events_id_seq', 22, true);


--
-- Data for Name: materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY materials (id, name, attachment, discipline_id, created_at, updated_at, user_id) FROM stdin;
20	Teste 2	ponte2.jpg	1	2016-12-10 21:59:12.425098	2016-12-10 22:51:41.135147	4
19	Teste	ponte1.jpg	1	2016-12-10 21:53:47.419619	2016-12-10 22:51:49.216135	4
\.


--
-- Name: materials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('materials_id_seq', 20, true);


--
-- Data for Name: oportunities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oportunities (id, title, employer, description, user_id, created_at, updated_at, image_file_name, image_content_type, image_file_size, image_updated_at) FROM stdin;
5	Vagas para desenvolvedor abertas em Recife.	In Loco Media	<div class="m_-8348851889880118271gmail-m_358180719384685086_39k5 m_-8348851889880118271gmail-m_358180719384685086_5s6c"><div class="m_-8348851889880118271gmail-m_358180719384685086_2cuy m_-8348851889880118271gmail-m_358180719384685086_3dgx m_-8348851889880118271gmail-m_358180719384685086_2vxa"><div class="m_-8348851889880118271gmail-m_358180719384685086_39k5 m_-8348851889880118271gmail-m_358180719384685086_5s6c"><div class="m_-8348851889880118271gmail-m_358180719384685086_2cuy m_-8348851889880118271gmail-m_358180719384685086_3dgx m_-8348851889880118271gmail-m_358180719384685086_2vxa"><p style="margin:10px 0px;padding:0px;line-height:24px"><span style="font-size: 12px;">A\r\n In Loco, uma das startups que mais crescem no Brasil, está com 30 vagas\r\n pra desenvolvedor abertas em Recife. Com um ambiente informal, dinâmico\r\n e bem-humorado, a empresa conta com trabalho open space e horários que \r\nse encaixam na rotina.</span></p><p style="margin:10px 0px;padding:0px;line-height:24px"><span style="font-size: 12px;">Benefícios:</span><br><span style="font-size: 12px;">- Salário/bolsa estágio</span><br><span style="font-size: 12px;">- Vale refeição/alimentação</span><br><span class="m_-8348851889880118271gmail-m_358180719384685086text_exposed_show"><span style="font-size: 12px;">- Assistência médica/odontológica (CLT)</span><br><span style="font-size: 12px;">- Estacionamento</span><br><span style="font-size: 12px;">- Bicicletário</span><br><span style="font-size: 12px;">- Horário flexível</span><br><span style="font-size: 12px;">- Happy hours</span><br><span style="font-size: 12px;">- Free snacks</span><br><span style="font-size: 12px;">- Assistência em compra de livros e cursos</span></span></p><div class="m_-8348851889880118271gmail-m_358180719384685086text_exposed_show"><p style="margin:10px 0px;padding:0px;line-height:24px"><a href="https://l.facebook.com/l.php?u=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DoDMoYejrBdo&amp;h=ATMnQkcMurDWHl0HlLxOBWlg4Fi1c4kXqh7bvonaLsQ_UFeINy2Fi_QIRsqqUY0qfYPCYAd4qy0EiKSdkGG_xhGubzHFA04NUMyrIvr-EVq6cPtPeSpXcjK6R7IZe5N9rA7E2Q&amp;enc=AZNujSKwCLjnh-0FNBWFDsqvY5O5i0xzqdE-V7GYymaYLDkkB4e6hD_SoUb_4Mvz4eZbJSt9avyXSflhr9dHxGqhPk1vXqf8kj_Er9pA6oWWPH-orwEzWSMjq5krDwbG9jzD0ICHu5YRB08iXfWXJ9AQi4Nt0hd0r29TvERTFF56QLPhChAGdRhfjyCPrHQ9Kxr9u1xwD_c2pks68UifbGMV&amp;s=1" rel="nofollow" style="color:rgb(43,170,223)" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=pt-BR&amp;q=https://l.facebook.com/l.php?u%3Dhttps%253A%252F%252Fwww.youtube.com%252Fwatch%253Fv%253DoDMoYejrBdo%26h%3DATMnQkcMurDWHl0HlLxOBWlg4Fi1c4kXqh7bvonaLsQ_UFeINy2Fi_QIRsqqUY0qfYPCYAd4qy0EiKSdkGG_xhGubzHFA04NUMyrIvr-EVq6cPtPeSpXcjK6R7IZe5N9rA7E2Q%26enc%3DAZNujSKwCLjnh-0FNBWFDsqvY5O5i0xzqdE-V7GYymaYLDkkB4e6hD_SoUb_4Mvz4eZbJSt9avyXSflhr9dHxGqhPk1vXqf8kj_Er9pA6oWWPH-orwEzWSMjq5krDwbG9jzD0ICHu5YRB08iXfWXJ9AQi4Nt0hd0r29TvERTFF56QLPhChAGdRhfjyCPrHQ9Kxr9u1xwD_c2pks68UifbGMV%26s%3D1&amp;source=gmail&amp;ust=1490723626511000&amp;usg=AFQjCNHmkeIlyEXkR9IHaalYoOmAtHEIag"></a><a href="https://l.facebook.com/l.php?u=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DoDMoYejrBdo&amp;h=ATMnQkcMurDWHl0HlLxOBWlg4Fi1c4kXqh7bvonaLsQ_UFeINy2Fi_QIRsqqUY0qfYPCYAd4qy0EiKSdkGG_xhGubzHFA04NUMyrIvr-EVq6cPtPeSpXcjK6R7IZe5N9rA7E2Q&amp;enc=AZNujSKwCLjnh-0FNBWFDsqvY5O5i0xzqdE-V7GYymaYLDkkB4e6hD_SoUb_4Mvz4eZbJSt9avyXSflhr9dHxGqhPk1vXqf8kj_Er9pA6oWWPH-orwEzWSMjq5krDwbG9jzD0ICHu5YRB08iXfWXJ9AQi4Nt0hd0r29TvERTFF56QLPhChAGdRhfjyCPrHQ9Kxr9u1xwD_c2pks68UifbGMV&amp;s=1" target="_blank">https://www.youtube.com/watch?</a><wbr><a href="https://l.facebook.com/l.php?u=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DoDMoYejrBdo&amp;h=ATMnQkcMurDWHl0HlLxOBWlg4Fi1c4kXqh7bvonaLsQ_UFeINy2Fi_QIRsqqUY0qfYPCYAd4qy0EiKSdkGG_xhGubzHFA04NUMyrIvr-EVq6cPtPeSpXcjK6R7IZe5N9rA7E2Q&amp;enc=AZNujSKwCLjnh-0FNBWFDsqvY5O5i0xzqdE-V7GYymaYLDkkB4e6hD_SoUb_4Mvz4eZbJSt9avyXSflhr9dHxGqhPk1vXqf8kj_Er9pA6oWWPH-orwEzWSMjq5krDwbG9jzD0ICHu5YRB08iXfWXJ9AQi4Nt0hd0r29TvERTFF56QLPhChAGdRhfjyCPrHQ9Kxr9u1xwD_c2pks68UifbGMV&amp;s=1" target="_blank">v=oDMoYejrBdo</a></p><p style="margin:10px 0px;padding:0px;line-height:24px">No vídeo vocês encontram mais informações sobre a In Loco e vagas disponíveis.</p><p style="margin:10px 0px;padding:0px;line-height:24px">"Estamos\r\n investindo massivamente em tecnologia para lançar novos produtos em \r\n2017. Por isso, buscamos profissionais que tenham um forte senso de \r\nliderança, paixão pelo que fazem e que se identifiquem com a cultura da \r\nIn Loco" - André Ferraz, CEO e cofundador.</p><p style="margin:10px 0px;padding:0px;line-height:24px">Para se inscrever:&nbsp;<span style="background-color: inherit;"><a href="https://l.facebook.com/l.php?u=https%3A%2F%2Fwww.inlocomedia.com%2Fvagas%2F&amp;h=ATPP761SqOacVhakI-1m0TE7ZYG-soEeWkUX9AkECbmzTljg30jtZpGHKfgHuMER1a0Ot_LmlU70ZurM6TTTjVJEmJ6l8_LcXwI9XQVzBoTbUN7ZsMBaVCU7TETjT2id7XdVZQ&amp;enc=AZMzTOaq4S87EPV9CJOnGi39sjZiUckFf_Zo39aMxfvWsVLb7Uq91RcDoP2o_rQ4kKF6tBZ60_5U03WJGV-lEOMMT8aJNIoHJgwowD69Mj3bA0-_HBaAIxREmTCXDsHxiLVyxLQtYqrJEW6sgbEJwCa60yX1iBYC3PxHQIjK8JaVN5QOG6jz_SdrHOk3OwYRe0qj60HQXX8wldXFFgUdh65G&amp;s=1" target="_blank">https://www.</a></span><wbr><span style="background-color: inherit;"><a href="https://l.facebook.com/l.php?u=https%3A%2F%2Fwww.inlocomedia.com%2Fvagas%2F&amp;h=ATPP761SqOacVhakI-1m0TE7ZYG-soEeWkUX9AkECbmzTljg30jtZpGHKfgHuMER1a0Ot_LmlU70ZurM6TTTjVJEmJ6l8_LcXwI9XQVzBoTbUN7ZsMBaVCU7TETjT2id7XdVZQ&amp;enc=AZMzTOaq4S87EPV9CJOnGi39sjZiUckFf_Zo39aMxfvWsVLb7Uq91RcDoP2o_rQ4kKF6tBZ60_5U03WJGV-lEOMMT8aJNIoHJgwowD69Mj3bA0-_HBaAIxREmTCXDsHxiLVyxLQtYqrJEW6sgbEJwCa60yX1iBYC3PxHQIjK8JaVN5QOG6jz_SdrHOk3OwYRe0qj60HQXX8wldXFFgUdh65G&amp;s=1" target="_blank">inlocomedia.com/vagas/</a></span></p></div></div></div></div></div><p><br></p>	17	2017-03-27 12:09:09.065084	2017-03-27 19:31:01.239824	\N	\N	\N	\N
9	Oportunidades no grupo de pesquisa SABER	SABER	<div class="m_-1999532191817545618gmail-m_6992700307380375007_39k5 m_-1999532191817545618gmail-m_6992700307380375007_5s6c"><div class="m_-1999532191817545618gmail-m_6992700307380375007_2cuy m_-1999532191817545618gmail-m_6992700307380375007_3dgx m_-1999532191817545618gmail-m_6992700307380375007_2vxa"><div class="m_-1999532191817545618gmail-m_6992700307380375007_39k5 m_-1999532191817545618gmail-m_6992700307380375007_5s6c"><div class="m_-1999532191817545618gmail-m_6992700307380375007_2cuy m_-1999532191817545618gmail-m_6992700307380375007_3dgx m_-1999532191817545618gmail-m_6992700307380375007_2vxa"><br></div><div class="m_-1999532191817545618gmail-m_6992700307380375007_2cuy m_-1999532191817545618gmail-m_6992700307380375007_3dgx m_-1999532191817545618gmail-m_6992700307380375007_2vxa">O grupo de pesquisa SABER (<a href="http://www.sabertecnologias.com.br/ferramenta/saber_suporte/scp/l.php?url=http%3A%2F%2Fwww.sabertecnologias.com.br&amp;auth=56eb126c84490a2d696522fdd99d9f90" style="color:rgb(43,170,223)" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=pt-BR&amp;q=http://www.sabertecnologias.com.br/ferramenta/saber_suporte/scp/l.php?url%3Dhttp%253A%252F%252Fwww.sabertecnologias.com.br%26auth%3D56eb126c84490a2d696522fdd99d9f90&amp;source=gmail&amp;ust=1490723953770000&amp;usg=AFQjCNEEV_tJHVqURzpDScpEhXUzqcFQMg">www.sabertecnologias.com.br</a>) está com uma (1) vaga para colaborador na área de Infraestrutura de TI e uma (1) vaga para um&nbsp;<strong>estudante</strong>&nbsp;para desenvolvimento web back-end (20h ou 30h semanais).<br><br><u><strong>Vaga para colaborador na área de Infraestrutura de TI</strong></u><br>O\r\n colaborador apoiará o planejamento, a organização e a execução de \r\natribuições que envolvam o desenvolvimento, a implantação e o \r\nacompanhamento dos projetos de infraestrutura.<br><br><strong>Atribuições previstas:</strong><br>Apoiar a gestão dos serviços de patrimônio, sua operação, manutenção e melhoria contínua do ambiente.<br>Apoiar\r\n na implantação de processos de operação e manutenção do ambiente, \r\nseguindo os processos de validação, verificação, preparação.<br><br><strong>Conhecimentos necessários:</strong><br>HyperV, Cluster Microsoft, soluções de Backup, banco de dados Mysql e PostgreSql, e gerenciamento de infraestrutura Linux.<br><br><strong>Requisitos obrigatórios:&nbsp;</strong><br>Estar cursando graduação ou mestrado em engenharia da computação, ciência da computação ou áreas afins.<br><br>Interessados devem encaminhar currículo para&nbsp;<a href="http://www.sabertecnologias.com.br/ferramenta/saber_suporte/scp/l.php?url=mailto%3Ainfraestrutura.saber%40gmail.com&amp;auth=bc765ff22a4931024ddf90d1448a8eb1" style="color:rgb(43,170,223)" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=pt-BR&amp;q=http://www.sabertecnologias.com.br/ferramenta/saber_suporte/scp/l.php?url%3Dmailto%253Ainfraestrutura.saber%2540gmail.com%26auth%3Dbc765ff22a4931024ddf90d1448a8eb1&amp;source=gmail&amp;ust=1490723953770000&amp;usg=AFQjCNGtX_OnyYjga2HlvnFSWEEjrcUbSg">infraestrutura.saber@<wbr>gmail.com</a>&nbsp;até\r\n o dia 30/03, indicando o interesse. Após análise dos currículos, alguns\r\n candidatos serão chamados para entrevista e prova prática.<br clear="all"><br><u><strong>Vaga para estudante em desenvolvimento back-end</strong></u><br>O\r\n estudante será selecionado para a execução de atividades na área \r\ndesenvolvimento web back-end, com ênfase em arquitetura de software (20h\r\n ou 30h semanais).<br>Requisito obrigatório:<br>- Ser estudante \r\nregularmente matriculado em curso pós-graduação (mestrado ou doutorado) \r\nem Ciência da Computação, Engenharia da Computação, Sistemas de \r\nInformação ou áreas afins.<br>Conhecimentos necessários:<br>- Java Web / JSF<br>- Linux<br>Diferenciais (não obrigatórios):<br>- Experiência em projetos Java Web<br>- PrimeFaces<br>- UML<br>Início das atividades: Abril de 2017.<br>Interessados devem enviar currículo para&nbsp;<a href="http://www.sabertecnologias.com.br/ferramenta/saber_suporte/scp/l.php?url=mailto%3Ainfraestrutura.saber%40gmail.com&amp;auth=bc765ff22a4931024ddf90d1448a8eb1" style="color:rgb(43,170,223)" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=pt-BR&amp;q=http://www.sabertecnologias.com.br/ferramenta/saber_suporte/scp/l.php?url%3Dmailto%253Ainfraestrutura.saber%2540gmail.com%26auth%3Dbc765ff22a4931024ddf90d1448a8eb1&amp;source=gmail&amp;ust=1490723953770000&amp;usg=AFQjCNGtX_OnyYjga2HlvnFSWEEjrcUbSg">infraestrutura.saber@<wbr>gmail.com</a>&nbsp;até dia 30/03/2017.<br>Após análise do currículo, alguns candidatos serão notificados para a segunda fase da seleção.</div></div></div></div><table class="m_-1999532191817545618gmail-m_6992700307380375007mcnDividerBlock" style="border-collapse: collapse; min-width: 100%; table-layout: fixed;" cellspacing="0" cellpadding="0" height="48" border="0" width="458"><tbody class="m_-1999532191817545618gmail-m_6992700307380375007mcnDividerBlockOuter"><tr><td class="m_-1999532191817545618gmail-m_6992700307380375007mcnDividerBlockInner" style="min-width:100%;padding:18px"><br></td></tr></tbody></table><table class="m_-1999532191817545618gmail-m_6992700307380375007mcnFollowBlock" style="border-collapse: collapse; min-width: 100%;" cellspacing="0" cellpadding="0" height="30" border="0" width="458"><tbody class="m_-1999532191817545618gmail-m_6992700307380375007mcnFollowBlockOuter"><tr><td class="m_-1999532191817545618gmail-m_6992700307380375007mcnFollowBlockInner" style="padding:9px" valign="top" align="center"><br></td></tr></tbody></table>	17	2017-03-27 20:02:32.570828	2017-03-27 20:04:45.299899	\N	\N	\N	\N
\.


--
-- Name: oportunities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oportunities_id_seq', 9, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20160419144311
20160419144437
20160419144650
20160419145421
20160419145900
20160420222553
20160420222609
20160420222618
20160420223617
20160420224426
20160421034434
20160421174946
20160510191407
20160510191744
20161105220549
20161008032428
\.


--
-- Data for Name: user_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_profiles (id, is_teacher, phone, degree, lattes, link, role, interests, created_at, updated_at) FROM stdin;
13	t	2119-4006	Doutor	http://lattes.cnpq.br/1934903225521860		Professor Adjunto I	Processamento de Sinais (voz e imagem), Inteligência Computacional, Tecnologias da Informação e da Comunicação Aplicadas às Ciências da Linguagem	2016-11-21 17:07:36.8451	2016-11-24 12:41:19.867711
31	t	\N	Mestre	http://lattes.cnpq.br/0508472049376625		Professor Assistente I		2017-03-06 12:49:52.631039	2017-03-06 12:49:52.631039
3	t	81-9-9976-3903	Especialista	http://lattes.cnpq.br/5131043311706098	www.c3.unicap.br/~almir/	Professor adjunto I	Rede de Computadores	2016-11-21 17:07:35.302817	2017-03-08 15:29:09.403195
17	t	2119-4006	Doutor	http://lattes.cnpq.br/8623118472645092		Professor Adjunto I	Sistemas Multimídia. Processamento Digital de Imagem e Vídeo. Computação Gráfica.	2016-11-21 17:07:37.467247	2017-03-10 12:15:36.95485
14	t	2119-4240	Mestre	http://lattes.cnpq.br/1853704699093817	http://marciobueno.com	Professor Assistente II	Realidade Virtual e Aumentada, Reconstrução 3D	2016-11-21 17:07:37.002999	2017-03-10 13:11:38.284709
27	t	\N	Mestre	http://lattes.cnpq.br/5525266668545102		Professor Assistente I		2017-02-23 12:36:32.845636	2017-02-23 12:36:32.845636
28	t	\N	Mestre	http://lattes.cnpq.br/5677428057873087		Professor adjunto I		2017-02-23 13:39:33.500819	2017-02-23 13:39:33.500819
4	t	2119-4175	Mestre	http://lattes.cnpq.br/1684154610199074		Professora Adjunta I	Linguagens de Programação	2016-11-21 17:07:35.46004	2017-03-10 13:23:14.391866
24	f	\N	Graduado			Aluno		2017-02-19 17:39:43.69124	2017-02-26 20:19:39.260255
2	f	null	Técnico	null			null	2016-11-21 17:07:35.151209	2017-03-06 12:03:32.506266
5	t	2119-4175	Mestre	http://lattes.cnpq.br/0292565364688015		Professor Assistente I	Dispositivos Móveis, Sistemas Embarcados	2016-11-21 17:07:35.617545	2017-03-10 13:23:47.159139
7	t	2119-4175	Especialista	http://lattes.cnpq.br/2635021175631237		Professor adjunto I	Redes de Computadores	2016-11-21 17:07:35.92453	2017-03-10 13:24:04.340479
25	t	\N	Doutor	http://lattes.cnpq.br/0650141288927562		Professor Adjunto III		2017-02-22 17:56:18.084543	2017-03-10 13:25:06.049387
9	t	2119-4175	Mestre	http://lattes.cnpq.br/1337583822386227		Professora Adjunta II	Computação Bioinspirada, Biotecnologia	2016-11-21 17:07:36.239635	2017-03-10 13:25:44.284449
26	t	\N	Especialista	http://lattes.cnpq.br/2589115552086641		Professora Adjunta I		2017-02-23 12:31:05.939022	2017-03-10 13:26:10.876788
11	t	2119-4175	Mestre	http://lattes.cnpq.br/2589115552086641		Professor Adjunto I	Probabilidade e Estatística	2016-11-21 17:07:36.546608	2017-03-10 13:28:10.100018
19	t	2119-4175	Mestre	http://lattes.cnpq.br/2561271245586035		Professora Adjunta I	Sistemas de Informação, Engenharia de Software	2016-11-21 17:07:37.774437	2017-03-10 13:30:58.148228
15	t	2191-4006	Especialista	http://lattes.cnpq.br/0943480521170578		Professor Adjunto I	Arquitetura de Sistemas de Computação, Linguagens de Programação	2016-11-21 17:07:37.15209	2017-03-10 13:31:53.382321
16	t	2119-4175	Doutor	http://lattes.cnpq.br/1781254939281428	http://www.sergiogaldino.pbworks.com	Professor Adjunto I	Cálculo Numérico, Probabilidade e Estatística	2016-11-21 17:07:37.309791	2017-03-10 13:32:51.446584
18	t	2119-4006	Doutor	http://lattes.cnpq.br/4520293519781462		Professor Adjunto II	Tolerância a Falhas, Sistemas Embarcados	2016-11-21 17:07:37.616511	2017-03-10 13:33:18.392742
6	t	2191-4006	Mestre	http://lattes.cnpq.br/7465551031556094		Professor Adjunto I	Redes de Computadores, Sistemas Distribuídos	2016-11-21 17:07:35.775207	2017-03-10 13:34:05.252651
\.


--
-- Name: user_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_profiles_id_seq', 32, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, name, role, user_profile_id, created_at, updated_at, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, enrollment, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip) FROM stdin;
15	Mozart Gomes da Silva	1	15	2016-11-21 17:07:37.298547	2017-03-13 09:27:54.71787	\N	\N	\N	\N	302060	mozart@unicap.br	$2a$11$2UkjmqhaLpdHFnO5xYRQ3On3nTWJ0V12x1Qyt1MxbrANZK8TsDh0K	\N	\N	\N	1	2017-03-13 09:27:54.715983	2017-03-13 09:27:54.715983	150.161.1.5	150.161.1.5
11	Fernando José Bertino de Figueiredo	1	11	2016-11-21 17:07:36.688662	2017-03-08 16:18:52.080416	\N	\N	\N	\N	327840	fbertino@unicap.br	$2a$11$5TnjF4WN6MHvDWC.z3xiUOf1JIc8318Q/qXlv1YduSgen5sO/I7Cy	\N	\N	\N	0	\N	\N	\N	\N
31	Fernando José Araújo Wanderley	1	31	2017-03-06 12:49:52.633206	2017-03-09 11:54:27.925335	foto3x4.png	image/png	104646	2017-03-09 11:54:27.304716	513500	fernando@unicap.br	$2a$11$OKHHCWPekPGE0iDEfnA8COwilx1KwifR6w3jJYXET1YAidrorVTkO	\N	\N	\N	2	2017-03-09 11:53:17.114921	2017-03-09 11:51:24.360876	127.0.0.1	127.0.0.1
7	Antônio Rubens Lapa Coelho	1	7	2016-11-21 17:07:36.071908	2017-03-13 11:59:30.971994	\N	\N	\N	\N	376000	rubens@c3.unicap.br	$2a$11$dZGsWWHBp25UaQDyleLcXOw77IrKwMCUz953uBcd4YemLbC57wUDC	\N	\N	\N	4	2017-03-13 11:59:30.970694	2017-03-13 11:59:15.190623	190.15.108.220	190.15.108.220
5	Antônio Luiz de Oliveira Cavalcanti Júnior	1	5	2016-11-21 17:07:35.763047	2017-03-14 09:13:20.834032	\N	\N	\N	\N	494500	tj@unicap.br	$2a$11$M/dwOSRqUFggcziHX7pk/ucuYKkXrTIf0NI/Z00UN.FPxm6RVOUmm	\N	\N	\N	4	2017-03-14 09:13:20.832757	2017-03-10 08:46:17.448998	187.59.126.195	186.212.131.227
3	Almir Pires Ferreira Neto	1	3	2016-11-21 17:07:35.447833	2017-03-27 11:24:36.746798	\N	\N	\N	\N	342790	almir.pires@gmail.com	$2a$11$1GSplWVvPLqhafhAX4AjAOvEAxAuev6RRFV5x1zHnrFlDfeuxxhJC	\N	\N	\N	8	2017-03-27 11:24:36.74528	2016-12-02 18:40:27.189413	127.0.0.1	127.0.0.1
2	Gilberto Pereira de Campos	0	2	2016-11-21 17:07:35.295728	2017-03-27 12:31:13.246051	Giba02.JPG	image/jpeg	3523005	2017-03-06 12:03:31.17799	442750	gcampos@unicap.br	$2a$11$dIyXxnFicKPsQCm8JygerOkUwTvgTZS3l7aJ6CXllFjIgP7m.3Ib.	\N	\N	\N	14	2017-03-27 12:31:13.244634	2017-03-10 13:15:49.948925	127.0.0.1	127.0.0.1
24	Davino Junior	0	24	2017-02-19 17:39:43.693604	2017-03-27 19:38:44.296742	\N	\N	\N	\N	2013107757	davinomaurojr@gmail.com	$2a$11$y8FfFhe8d4bJTuB19Gy5eOUkBCMgYV0YHLZusNgPeHtsInhG.YhGm	\N	\N	\N	25	2017-03-27 19:38:44.29542	2017-03-27 19:13:23.778659	187.78.218.162	187.78.218.162
14	Márcio Augusto Silva Bueno	0	14	2016-11-21 17:07:37.13997	2017-03-27 11:27:05.505059	\N	\N	\N	\N	455770	masb@unicap.br	$2a$11$nRVHfuz9nJ9G2AX1vgXXh.8zVGh1RJVIZpLDIdOHs5r8zgvt704cy	\N	\N	\N	3	2017-03-27 11:27:05.503721	2017-03-09 06:02:18.570483	127.0.0.1	127.0.0.1
4	Ana Eliza Lopes Moura	1	4	2016-11-21 17:07:35.606118	2017-03-29 21:03:27.647115	\N	\N	\N	\N	406790	aelm@c3.unicap.br	$2a$11$XLI.wDxJn82FsVB.WVdsE.lR0O37ZWiZd8Xw8CXgs5Gw5BoSdQJT.	\N	\N	\N	40	2017-03-29 21:03:27.645992	2017-03-29 21:03:17.163983	200.249.25.14	200.249.25.14
17	Robson Cavalcanti Lins	0	17	2016-11-21 17:07:37.609488	2017-03-30 14:36:40.442845	foto4_portal_C3.png	image/png	1681345	2017-03-28 12:16:18.183716	396500	rcl@c3.unicap.br	$2a$11$7Fk1T0D9H8GaNjMW7ZJ9JOV2K50Fn3PC8RNekucZGgWkQxeKU.ssC	\N	\N	\N	70	2017-03-30 14:36:40.441292	2017-03-28 12:10:38.829904	127.0.0.1	127.0.0.1
13	Francisco Madeiro Bernardino Junior	1	13	2016-11-21 17:07:36.994386	2017-03-30 21:02:56.615367	\N	\N	\N	\N	428890	madeiro@c3.unicap.br	$2a$11$OHiCmKMYUw6q5zb7boY2tei9Kecgd9HnUafq7B15A4d7N1GNn5l16	\N	\N	\N	4	2017-03-30 21:02:24.468172	2016-12-13 13:03:40.453385	127.0.0.1	200.133.1.60
19	Gilka Rocha Barbosa	1	19	2016-11-21 17:07:37.919992	2017-03-08 16:20:08.543424	\N	\N	\N	\N	335940	gilkabarbosa@yahoo.com.br	$2a$11$BJMUzWelKS96uI4L0T5lruQxFelSaJ06t3dfo/Qif8scPjME/NYAO	\N	\N	\N	0	\N	\N	\N	\N
16	Sérgio Mário Lins Galdino	1	16	2016-11-21 17:07:37.454995	2017-03-08 16:21:11.725777	\N	\N	\N	\N	335110	galdino.sergio@gmail.com	$2a$11$HwSPLRDzaDeHoDz.PMc.kOWB1tbTYa4Ijy2T0rBmgRinnkl7xpiPa	\N	\N	\N	0	\N	\N	\N	\N
28	Célio Costa Souto Maior	1	28	2017-02-23 13:39:33.502649	2017-03-08 16:14:24.497563	\N	\N	\N	\N	067840	celio@unicap.br	$2a$11$BG9b1tJUvcBVGc17g.wWPOTc1kzV.pc5HjWbz3iGQGu8prey3GlUa	\N	\N	\N	0	\N	\N	\N	\N
26	Cristina Maria Alves Morais Albuquerque	1	26	2017-02-23 12:31:05.940688	2017-03-08 16:16:11.18583	\N	\N	\N	\N	343680	cmorais@unicap.br	$2a$11$bO14IemVbkFNDsKVDBZuROHMNvK999h.sdf91K6O446okvRV7/1Zm	\N	\N	\N	0	\N	\N	\N	\N
27	Fernando César Brito Santos	1	27	2017-02-23 12:36:32.847238	2017-03-08 16:17:22.746247	\N	\N	\N	\N	279350	fcesar@dei.unicap.br	$2a$11$.VKy3yp8fB9xn9RXmMKuOO9f0xDLwuvZgP6/ODQkFC4x8IurGNmYK	\N	\N	\N	0	\N	\N	\N	\N
18	Sérgio Murilo Maciel Fernandes	1	18	2016-11-21 17:07:37.763681	2017-03-08 16:21:42.553284	\N	\N	\N	\N	399450	smmfast@gmail.com	$2a$11$fPlkdDgyE0lrkBcZ/Dfvs.72gIzqsCMCgdapjQhQJnzZe/U6hWTPS	\N	\N	\N	0	\N	\N	\N	\N
6	Silvio Soares Bandeira	1	6	2016-11-21 17:07:35.912099	2017-03-08 16:22:18.004496	\N	\N	\N	\N	384290	silvio@c3.unicap.br	$2a$11$7/0YjGWzbvxgUYqMD1yrzu0yqbt.y1XRYeXC.qVU76J3FM872FzEu	\N	\N	\N	3	2017-02-20 11:21:53.584782	2017-02-20 11:20:26.692346	127.0.0.1	127.0.0.1
25	Cezar Augusto Cerqueira	1	25	2017-02-22 17:56:18.101499	2017-03-08 16:24:00.247939	\N	\N	\N	\N	334500	cezar@dei.unicap.br	$2a$11$tm1CMiIJ5Hedt0IeF0kMxeuBWbeus5yMZIaZAkcwyOyZXpiJhfqKa	\N	\N	\N	2	2017-03-08 16:24:00.246613	2017-03-08 16:02:56.773202	200.133.1.60	127.0.0.1
9	Clarissa Daisy da Costa Albuquerque	1	9	2016-11-21 17:07:36.380311	2017-03-08 16:24:30.563046	\N	\N	\N	\N	311600	cdaisy@unicap.br	$2a$11$OOp8ax7bcdugKW/8mhMJbOJutth9jwmxbUvJIwLaCkjvHfOyjaIAq	\N	\N	\N	1	2017-03-08 16:24:30.561904	2017-03-08 16:24:30.561904	200.133.1.60	200.133.1.60
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 32, true);


--
-- Name: articles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: class_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY class_files
    ADD CONSTRAINT class_files_pkey PRIMARY KEY (id);


--
-- Name: discipline_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY discipline_classes
    ADD CONSTRAINT discipline_classes_pkey PRIMARY KEY (id);


--
-- Name: disciplines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY disciplines
    ADD CONSTRAINT disciplines_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: materials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY materials
    ADD CONSTRAINT materials_pkey PRIMARY KEY (id);


--
-- Name: oportunities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oportunities
    ADD CONSTRAINT oportunities_pkey PRIMARY KEY (id);


--
-- Name: user_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_profiles
    ADD CONSTRAINT user_profiles_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_articles_on_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_articles_on_user_id ON articles USING btree (user_id);


--
-- Name: index_discipline_classes_on_discipline_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_discipline_classes_on_discipline_id ON discipline_classes USING btree (discipline_id);


--
-- Name: index_discipline_classes_on_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_discipline_classes_on_user_id ON discipline_classes USING btree (user_id);


--
-- Name: index_disciplines_users_on_discipline_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_disciplines_users_on_discipline_id ON disciplines_users USING btree (discipline_id);


--
-- Name: index_disciplines_users_on_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_disciplines_users_on_user_id ON disciplines_users USING btree (user_id);


--
-- Name: index_events_on_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_events_on_user_id ON events USING btree (user_id);


--
-- Name: index_materials_on_discipline_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_materials_on_discipline_id ON materials USING btree (discipline_id);


--
-- Name: index_materials_on_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_materials_on_user_id ON materials USING btree (user_id);


--
-- Name: index_oportunities_on_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_oportunities_on_user_id ON oportunities USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_enrollment; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_enrollment ON users USING btree (enrollment);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_user_profile_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_users_on_user_profile_id ON users USING btree (user_profile_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_0cb5590091; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT fk_rails_0cb5590091 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_3d31dad1cc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT fk_rails_3d31dad1cc FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_4f30ed77b8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_rails_4f30ed77b8 FOREIGN KEY (user_profile_id) REFERENCES user_profiles(id);


--
-- Name: fk_rails_5b88d42c9a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materials
    ADD CONSTRAINT fk_rails_5b88d42c9a FOREIGN KEY (discipline_id) REFERENCES disciplines(id);


--
-- Name: fk_rails_cf58c42728; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materials
    ADD CONSTRAINT fk_rails_cf58c42728 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_e40e97cfd5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oportunities
    ADD CONSTRAINT fk_rails_e40e97cfd5 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

