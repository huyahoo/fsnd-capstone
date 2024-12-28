--
-- PostgreSQL database dump
--

-- Dumped from database version 14.15 (Homebrew)
-- Dumped by pg_dump version 14.15 (Homebrew)

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: book_rental_user
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO book_rental_user;

--
-- Name: books; Type: TABLE; Schema: public; Owner: book_rental_user
--

CREATE TABLE public.books (
    id integer NOT NULL,
    title character varying(120) NOT NULL,
    author character varying(80) NOT NULL,
    published_date date NOT NULL
);


ALTER TABLE public.books OWNER TO book_rental_user;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: book_rental_user
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO book_rental_user;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: book_rental_user
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: rentals; Type: TABLE; Schema: public; Owner: book_rental_user
--

CREATE TABLE public.rentals (
    id integer NOT NULL,
    user_name character varying(80) NOT NULL,
    rental_date date NOT NULL,
    book_id integer NOT NULL
);


ALTER TABLE public.rentals OWNER TO book_rental_user;

--
-- Name: rentals_id_seq; Type: SEQUENCE; Schema: public; Owner: book_rental_user
--

CREATE SEQUENCE public.rentals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rentals_id_seq OWNER TO book_rental_user;

--
-- Name: rentals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: book_rental_user
--

ALTER SEQUENCE public.rentals_id_seq OWNED BY public.rentals.id;


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: book_rental_user
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Name: rentals id; Type: DEFAULT; Schema: public; Owner: book_rental_user
--

ALTER TABLE ONLY public.rentals ALTER COLUMN id SET DEFAULT nextval('public.rentals_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: book_rental_user
--

COPY public.alembic_version (version_num) FROM stdin;
<latest_revision_id>
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: book_rental_user
--

COPY public.books (id, title, author, published_date) FROM stdin;
\.


--
-- Data for Name: rentals; Type: TABLE DATA; Schema: public; Owner: book_rental_user
--

COPY public.rentals (id, user_name, rental_date, book_id) FROM stdin;
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: book_rental_user
--

SELECT pg_catalog.setval('public.books_id_seq', 1, false);


--
-- Name: rentals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: book_rental_user
--

SELECT pg_catalog.setval('public.rentals_id_seq', 1, false);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: book_rental_user
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: book_rental_user
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: rentals rentals_pkey; Type: CONSTRAINT; Schema: public; Owner: book_rental_user
--

ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_pkey PRIMARY KEY (id);


--
-- Name: rentals rentals_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: book_rental_user
--

ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- PostgreSQL database dump complete
--

