--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

-- Started on 2021-11-05 11:17:54

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

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 40961)
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    id text NOT NULL,
    "user" text NOT NULL,
    account_type integer NOT NULL,
    balance numeric(10,2) NOT NULL,
    currency integer NOT NULL,
    bank integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 49152)
-- Name: catalogs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalogs (
    id integer NOT NULL,
    description text NOT NULL,
    parent_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE public.catalogs OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 49155)
-- Name: catalogs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.catalogs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogs_id_seq OWNER TO postgres;

--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 218
-- Name: catalogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.catalogs_id_seq OWNED BY public.catalogs.id;


--
-- TOC entry 210 (class 1259 OID 40978)
-- Name: currencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currencies (
    id integer NOT NULL,
    description text,
    iso_code character(3),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.currencies OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 40984)
-- Name: currency_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.currency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.currency_id_seq OWNER TO postgres;

--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 211
-- Name: currency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.currency_id_seq OWNED BY public.currencies.id;


--
-- TOC entry 212 (class 1259 OID 40985)
-- Name: exchanges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exchanges (
    id integer NOT NULL,
    id_source_currency integer NOT NULL,
    id_destin_currency integer NOT NULL,
    equivalence numeric,
    creation_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.exchanges OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 40991)
-- Name: exchange_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exchange_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exchange_id_seq OWNER TO postgres;

--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 213
-- Name: exchange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exchange_id_seq OWNED BY public.exchanges.id;


--
-- TOC entry 214 (class 1259 OID 40992)
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
    id integer NOT NULL,
    transaction_type integer NOT NULL,
    category integer NOT NULL,
    account text NOT NULL,
    amount numeric(10,2) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    reason text,
    balance numeric(10,2) NOT NULL,
    transfer_account text
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 40998)
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_id_seq OWNER TO postgres;

--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 215
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


--
-- TOC entry 216 (class 1259 OID 40999)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id text NOT NULL,
    user_name text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_DATE
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 3194 (class 2604 OID 49164)
-- Name: catalogs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalogs ALTER COLUMN id SET DEFAULT nextval('public.catalogs_id_seq'::regclass);


--
-- TOC entry 3189 (class 2604 OID 41007)
-- Name: currencies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currencies ALTER COLUMN id SET DEFAULT nextval('public.currency_id_seq'::regclass);


--
-- TOC entry 3191 (class 2604 OID 41008)
-- Name: exchanges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exchanges ALTER COLUMN id SET DEFAULT nextval('public.exchange_id_seq'::regclass);


--
-- TOC entry 3192 (class 2604 OID 41009)
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);


--
-- TOC entry 3358 (class 0 OID 40961)
-- Dependencies: 209
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.accounts VALUES ('100290491', 'tqvu0TCQl2RmTluQFC68J9QYIn23', 3, 1000.00, 1, 8, '2021-10-20 14:30:02.006157');
INSERT INTO public.accounts VALUES ('123', 'tqvu0TCQl2RmTluQFC68J9QYIn23', 2, 480.50, 2, 10, '2021-10-26 18:37:26.774989');
INSERT INTO public.accounts VALUES ('10022019101', 'tqvu0TCQl2RmTluQFC68J9QYIn23', 2, 2590.80, 3, 11, '2021-10-20 14:29:34.580469');


--
-- TOC entry 3366 (class 0 OID 49152)
-- Dependencies: 217
-- Data for Name: catalogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.catalogs VALUES (1, 'Account Types', NULL, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (2, 'Saving Account', 1, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (3, 'Current Account', 1, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (4, 'Banks', NULL, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (5, 'Banco Agricola', 4, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (6, 'Banco Azul', 4, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (7, 'BAC Credomatic', 4, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (8, 'Banco Cuscatlan', 4, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (9, 'Abanks', 4, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (10, 'Banco Promerica', 4, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (11, 'Banco G&T Continental', 4, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (12, 'Banco Davivienda', 4, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (13, 'Transaction Types', NULL, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (14, 'Income', 13, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (15, 'Expenses', 13, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (17, 'Incoming Transfer', 14, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (18, 'Salary', 14, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (19, 'Bonus', 14, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (21, 'Outgoing Transfer', 15, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (22, 'Gasoline', 15, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (23, 'Coffe Cup', 15, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (24, 'Fast Food', 15, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (25, 'Breakfast', 15, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (26, 'Lunch', 15, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (27, 'Dinner', 15, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (28, 'Cinema', 15, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (29, 'Rent', 15, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (30, 'Medicine', 15, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (31, 'Clothing', 15, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (32, 'Water Bill Payment', 15, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (33, 'Electricity Bill Payment', 15, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (34, 'Internet Bill Payment', 15, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (35, 'Netflix', 15, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (20, 'Phone Bill Payment', 15, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (16, 'Remittance', 14, '2021-10-15 00:00:00');
INSERT INTO public.catalogs VALUES (36, 'Account Opening Transaction', 14, '2021-10-26 00:00:00');


--
-- TOC entry 3359 (class 0 OID 40978)
-- Dependencies: 210
-- Data for Name: currencies; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.currencies VALUES (2, 'Euro', 'EUR', '2021-10-09 11:06:17.067437-06');
INSERT INTO public.currencies VALUES (1, 'Dolar Americano', 'USD', '2021-10-09 11:06:17.067437-06');
INSERT INTO public.currencies VALUES (3, 'Quetzal', 'GTQ', '2021-10-13 16:29:25.238417-06');


--
-- TOC entry 3361 (class 0 OID 40985)
-- Dependencies: 212
-- Data for Name: exchanges; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.exchanges VALUES (1, 1, 2, 0.86, '2021-10-09 11:08:43.758158-06');
INSERT INTO public.exchanges VALUES (2, 2, 1, 1.16, '2021-10-09 11:08:43.758158-06');
INSERT INTO public.exchanges VALUES (3, 1, 3, 7.75, '2021-10-14 19:06:16.716064-06');
INSERT INTO public.exchanges VALUES (4, 2, 3, 8.99, '2021-10-14 19:06:16.717996-06');
INSERT INTO public.exchanges VALUES (5, 3, 2, 0.11, '2021-10-14 19:06:16.718984-06');
INSERT INTO public.exchanges VALUES (7, 3, 1, 0.13, '2021-10-14 19:14:40.485234-06');


--
-- TOC entry 3363 (class 0 OID 40992)
-- Dependencies: 214
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.transactions VALUES (25, 15, 22, '10022019101', 35.00, '2021-10-15 00:00:00', NULL, 1965.00, NULL);
INSERT INTO public.transactions VALUES (26, 15, 28, '10022019101', 8.50, '2021-10-16 00:00:00', NULL, 1956.50, NULL);
INSERT INTO public.transactions VALUES (27, 15, 27, '10022019101', 25.00, '2021-10-17 00:00:00', NULL, 1931.50, NULL);
INSERT INTO public.transactions VALUES (34, 15, 21, '10022019101', 31.50, '2021-10-21 00:00:00', 'Exchange', 1900.00, '100290491');
INSERT INTO public.transactions VALUES (35, 14, 17, '100290491', 4.10, '2021-10-21 00:00:00', 'Exchange', 1004.10, '10022019101');
INSERT INTO public.transactions VALUES (36, 15, 21, '100290491', 4.10, '2021-10-21 00:00:00', 'Exchange Test', 1000.00, '10022019101');
INSERT INTO public.transactions VALUES (37, 14, 17, '10022019101', 31.78, '2021-10-21 00:00:00', 'Exchange Test', 1931.78, '100290491');
INSERT INTO public.transactions VALUES (38, 14, 36, '123', 500.00, '2021-10-26 00:00:00', NULL, 500.00, NULL);
INSERT INTO public.transactions VALUES (39, 15, 28, '123', 12.00, '2021-10-26 00:00:00', NULL, 488.00, NULL);
INSERT INTO public.transactions VALUES (40, 15, 21, '10022019101', 900.00, '2021-10-26 00:00:00', 'TO SAVE', 1031.78, '123');
INSERT INTO public.transactions VALUES (41, 14, 17, '123', 99.00, '2021-10-26 00:00:00', 'TO SAVE', 587.00, '10022019101');
INSERT INTO public.transactions VALUES (42, 15, 21, '123', 99.00, '2021-10-26 00:00:00', 'To RETURN', 488.00, '10022019101');
INSERT INTO public.transactions VALUES (43, 14, 17, '10022019101', 890.01, '2021-10-26 00:00:00', 'To RETURN', 1921.79, '123');
INSERT INTO public.transactions VALUES (44, 15, 23, '123', 7.50, '2021-10-26 00:00:00', NULL, 480.50, NULL);
INSERT INTO public.transactions VALUES (45, 14, 18, '10022019101', 700.00, '2021-10-29 00:00:00', NULL, 2621.79, NULL);
INSERT INTO public.transactions VALUES (46, 15, 35, '10022019101', 10.99, '2021-11-02 00:00:00', NULL, 2610.80, NULL);
INSERT INTO public.transactions VALUES (47, 15, 34, '10022019101', 20.00, '2021-11-02 00:00:00', NULL, 2590.80, NULL);


--
-- TOC entry 3365 (class 0 OID 40999)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES ('tqvu0TCQl2RmTluQFC68J9QYIn23', 'test@test.com', '2021-10-14 11:38:23.590324');


--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 218
-- Name: catalogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catalogs_id_seq', 36, true);


--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 211
-- Name: currency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.currency_id_seq', 4, true);


--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 213
-- Name: exchange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exchange_id_seq', 7, true);


--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 215
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transactions_id_seq', 47, true);


--
-- TOC entry 3197 (class 2606 OID 41011)
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 3209 (class 2606 OID 49166)
-- Name: catalogs catalogs_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalogs
    ADD CONSTRAINT catalogs_pk PRIMARY KEY (id);


--
-- TOC entry 3199 (class 2606 OID 41017)
-- Name: currencies currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currencies
    ADD CONSTRAINT currency_pkey PRIMARY KEY (id);


--
-- TOC entry 3201 (class 2606 OID 41019)
-- Name: exchanges exchange_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exchanges
    ADD CONSTRAINT exchange_pkey PRIMARY KEY (id);


--
-- TOC entry 3203 (class 2606 OID 57346)
-- Name: exchanges exchanges_ukey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exchanges
    ADD CONSTRAINT exchanges_ukey UNIQUE (id_source_currency, id_destin_currency);


--
-- TOC entry 3205 (class 2606 OID 41021)
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 3207 (class 2606 OID 41023)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 41034)
-- Name: accounts accounts_currency_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_currency_fkey FOREIGN KEY (currency) REFERENCES public.currencies(id);


--
-- TOC entry 3212 (class 2606 OID 57357)
-- Name: accounts accounts_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_fk FOREIGN KEY (account_type) REFERENCES public.catalogs(id);


--
-- TOC entry 3213 (class 2606 OID 57362)
-- Name: accounts accounts_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_fk_1 FOREIGN KEY (bank) REFERENCES public.catalogs(id);


--
-- TOC entry 3211 (class 2606 OID 41039)
-- Name: accounts accounts_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_user_fkey FOREIGN KEY ("user") REFERENCES public.users(id);


--
-- TOC entry 3214 (class 2606 OID 57347)
-- Name: exchanges exchanges_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exchanges
    ADD CONSTRAINT exchanges_fk FOREIGN KEY (id_source_currency) REFERENCES public.currencies(id);


--
-- TOC entry 3215 (class 2606 OID 57352)
-- Name: exchanges exchanges_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exchanges
    ADD CONSTRAINT exchanges_fk_1 FOREIGN KEY (id_destin_currency) REFERENCES public.currencies(id);


--
-- TOC entry 3218 (class 2606 OID 73728)
-- Name: transactions transactions_account_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_account_fkey FOREIGN KEY (account) REFERENCES public.accounts(id) ON DELETE CASCADE;


--
-- TOC entry 3216 (class 2606 OID 57367)
-- Name: transactions transactions_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_fk FOREIGN KEY (transaction_type) REFERENCES public.catalogs(id);


--
-- TOC entry 3217 (class 2606 OID 57372)
-- Name: transactions transactions_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_fk_1 FOREIGN KEY (category) REFERENCES public.catalogs(id);


-- Completed on 2021-11-05 11:17:54

--
-- PostgreSQL database dump complete
--

