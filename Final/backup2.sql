toc.dat                                                                                             0000600 0004000 0002000 00000013104 13612101774 0014440 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       4                     x            CarbonTwitter    12.1    12.1     P           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         Q           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         R           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         S           1262    16393    CarbonTwitter    DATABASE     m   CREATE DATABASE "CarbonTwitter" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE "CarbonTwitter";
                postgres    false         T           0    0    DATABASE "CarbonTwitter"    ACL     {   REVOKE ALL ON DATABASE "CarbonTwitter" FROM postgres;
GRANT ALL ON DATABASE "CarbonTwitter" TO postgres WITH GRANT OPTION;
                   postgres    false    3155         �            1259    16394    tweets    TABLE     �   CREATE TABLE public.tweets (
    tweet character varying(280) NOT NULL,
    "from" character varying(50) NOT NULL,
    "createdAt" timestamp(6) without time zone NOT NULL,
    id integer NOT NULL,
    "updatedAt" date
);
    DROP TABLE public.tweets;
       public         heap    postgres    false         �            1259    16410    tweets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tweets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.tweets_id_seq;
       public          postgres    false    202         U           0    0    tweets_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.tweets_id_seq OWNED BY public.tweets.id;
          public          postgres    false    205         �            1259    16401    users    TABLE       CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying NOT NULL,
    "displayName" character varying NOT NULL,
    bio character varying,
    email character varying,
    photo character varying,
    "createdAt" date NOT NULL,
    "updatedAt" date
);
    DROP TABLE public.users;
       public         heap    postgres    false         �            1259    16399    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    204         V           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    203         �           2604    16412 	   tweets id    DEFAULT     f   ALTER TABLE ONLY public.tweets ALTER COLUMN id SET DEFAULT nextval('public.tweets_id_seq'::regclass);
 8   ALTER TABLE public.tweets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    202         �           2604    16404    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    204    204         J          0    16394    tweets 
   TABLE DATA           M   COPY public.tweets (tweet, "from", "createdAt", id, "updatedAt") FROM stdin;
    public          postgres    false    202       3146.dat L          0    16401    users 
   TABLE DATA           i   COPY public.users (id, username, "displayName", bio, email, photo, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    204       3148.dat W           0    0    tweets_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.tweets_id_seq', 41, true);
          public          postgres    false    205         X           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 10, true);
          public          postgres    false    203         �           2606    16417    tweets tweets_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.tweets
    ADD CONSTRAINT tweets_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tweets DROP CONSTRAINT tweets_pkey;
       public            postgres    false    202         �           2606    16409    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    204         �           2606    16420    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    204         �           2606    16421     tweets foreign_key_from_username    FK CONSTRAINT     �   ALTER TABLE ONLY public.tweets
    ADD CONSTRAINT foreign_key_from_username FOREIGN KEY ("from") REFERENCES public.users(username) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 J   ALTER TABLE ONLY public.tweets DROP CONSTRAINT foreign_key_from_username;
       public          postgres    false    202    204    3018                                                                                                                                                                                                                                                                                                                                                                                                                                                                    3146.dat                                                                                            0000600 0004000 0002000 00000001242 13612101774 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        my first tweet	abardy	2019-10-19 10:23:54	2	\N
And the second one !!	abardy	2019-10-19 10:23:54	3	\N
c'est bon les chocolatines	chocolatine	2019-10-19 10:23:54	8	\N
truc	abardy	2019-10-19 10:23:54	15	2019-12-27
test	abardy	2019-10-19 10:23:54	17	2019-12-27
test	test	2019-12-27 20:37:29.442	18	2019-12-27
test now	test	2019-12-27 22:08:25.387	20	2019-12-27
it's working	abardy	2020-01-22 11:22:42.788	36	2020-01-22
[Re-tweet from <a href="/test">@test</a>] test now	abardy	2020-01-22 16:18:27.106	39	2020-01-22
Whatever	abardy	2020-01-22 17:03:16.878	40	2020-01-22
Whatever	abardy	2020-01-22 17:04:09.024	41	2020-01-22
hey hey	chocolatine	2019-12-27 20:37:29.442	22	\N
\.


                                                                                                                                                                                                                                                                                                                                                              3148.dat                                                                                            0000600 0004000 0002000 00000006437 13612101774 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        5	chocolatine	Simon Torradou	chocolatine	\N	data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxAQEBAQEA4NEBAKDRYNDRUJDRsIFQ4KIB0iIiAdHx8kKDQsJCYxJx8fLTMtMSw3RDhDIys/QT82QzQtMjcBCgoKDQ0NFQ4PFSsZFSUrLS0rKystKysrKysrKystKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrK//AABEIAGQAZAMBIgACEQEDEQH/xAAbAAABBQEBAAAAAAAAAAAAAAAFAAMEBgcCAf/EADgQAAIBAgQEAwQIBgMAAAAAAAECAAMRBAUSISIxQVEGMnETYYGxFCNSU3KRocEHQmKCovAWM5L/xAAYAQEBAQEBAAAAAAAAAAAAAAABAgADBP/EAB0RAQEAAgMBAQEAAAAAAAAAAAABAhESITFRQQP/2gAMAwEAAhEDEQA/AGcaNlH2nEnqJDxI4qQ/rvCCLB3dIsfRZ4iwX4mzf6LSutjUqbJfcD3zM6zzPEwwtfVUI2Vefx7Sqf8ANsSrXtTK9jvtK/WxLVGZnYksdy25JkRxc7Xt8zFFyWDMfENTEsGBanpHJGtZoQybxlXpMBVb2qcjr5j0MqqKBt1nqgDcH06bxG2w5P4kw+I0qG01G/lfbi7CHQJhWGxtSmysrEFW1Lbezek0Pwl4vNZxQxFg7bU2HAHbtBUq4Vxw/ER3B+RfwziuOE/CO4EcAmJ608ndoosodVPrKQ9T+knoshAH6QvZaR/O8JqJKnqLM98eY4VMR7Nb2wq6G7e05maMRYEi22+8xjMq5eo5JvqdiSOrExTUYjt1+U9vYW/288pozGw3t8p1iFIJB5rMjRkMT6/nHPadI9hKF99p7jaFtxe1obPHrbmk+9+ckrVIKsCQykEEbWaD6Zj6Hv8A6ZSW1+H81+lYRah8yjRU6fWCGsB5B6n5yifw1JNDEjoGQj8VjeXzAeT+4/ODokRRRTMpNEXrN/SkIoIPwe9Wqe1l+cJoJlIPiFiMLXIJBWkfLzmO6LsB3M1vxbizTw1QKupqyFdxqATqZmuR4P2tcL9lSxm8TZu6dYCotNNQRmdiemwWR/aaqjEobVBvcdYZzDA1k5EIvThkDCYeqzgBtZv07SdxfG+FhcOp3uwHXtJFapRZNOoXHc7wvmeXmnRFwLsL7bSqsoJOqmTb7G0J2rKXFFanpJH5ek7px9MOreUsDzs4tGqS7kS9uFxaH/C8nRix00of7t5oOX+U/jMA+FMqGGwYXbXWX2lQ8+IjYfAQ3lp4T+MzKiZeezmKBU/LxvUPd4RQQflY4SftOYSQRLmth1qKVYAhlK/AzPMloquPrhbaVBVOnDcTS1Eo+b4YUMbqUECpSPTa94XxsfR2u1LTxhSLdZDwb0mJ9nTCgGxIFt4AzLHcQVid97DtPMZmXs1Q0w1j5gB1kcXp5xZc5pKyjsq9JV1yym7HSbEHceUgyPiM5c2N2Pe+209XHAHXqszHi6Q42DlL6lHLQnMXPc7yttQJqsqgk6iABvLWMXqFz2/SPfw+wK1a9XEMLhC2nUL8Rjj65f11+L/gQRQpg8xRAPraOZYeE/i/YT3kLDlaN5Y2zfiHyluQheKcXimKrZRvSU/au36wkkD5ZiqfsqfGo4BsTaxk8Y+kAONR8byiIIJXPG9MLSFUKCUqAEltOlfSFkzSj96n5zjG18NWQpUZGVxYiYKRh8JTxDByxBCaeE9ZHxuFC3Htam3IPxAxmhU+jV2pFgVVuEjbVT6GF8Xg1qLfWD67Tn5XbC9K5oc8j+89fBMw30ntpGmxkhsLpJN4xicdpBHwmt+NlZpJsbCjTBaowFJAu5ZzNG8MZR9FoJTJBe13K8tZmXZPiClSlXN+GuoX06zT0z2kf5h/6A/eMcrdjBkbK28494+UH1s/oqpbUDbkFIJLTjwximqCozG5LdNrDtELFeKNaopmVxclofY/ytHBk2H+7/ykoNOKuLRfMwHu5mUTQyTD/dj85GzLD4HDJrrBUXpzYsfcOsG5v4oAvToX1L53YeX3Ad5R8zzOpUfdmdm2Go6tpk3LSRmmISufbUU9mNRFME6uEd5DOauuzX9/WScHRbhpqC9SodlQfzSPmgpoSjOKtRfMMOeBG7Fuvwhprl8NVM3Lbb3jFBGqtvcCRQwvyRfduYQw9cILki3QjeTZ8GN3exNsQtJsOptpFUaxz+q5H5zR18PUCLi9juDYHhmQpWLvr6JyvDdLG10FMivXVltcLVJFvSaddL3u2xoZ8O0uhP5Ayfl2CFEEA31e7TKvlniqpYCqgcctQ+raWTDZnSfk4BPR+AxGxC8Ua1xQZXMxxDatINgO20EYiuQrEWuATuLzyKdIKq4Y6Sep3PraD8L/ANrnqqi3uiimQdxWIdEUKxX6UWWoV2Jpg2037SwZ34fw9LJ8Bi0VhWxdV1qktqDAXtt8IopqKpVh2Hx3nhPba8UUAl5at336biHKS6m36coopP66TwUwtIe/YwhRiilsmUsU4Fg7gDsxiiimL//Z	2019-12-27	2019-12-27
7	test	Mr test	Passioné par les tests depuis mon enfance...	\N	https://d3icht40s6fxmd.cloudfront.net/sites/default/files/test-product-test.png	2019-12-27	2019-12-27
9	tet	Mr test	Passioné par les tests depuis mon enfance...	\N	https://d3icht40s6fxmd.cloudfront.net/sites/default/files/test-product-test.png	2019-12-27	2019-12-27
10	tt	Mr test	Passioné par les tests depuis mon enfance...	\N	https://d3icht40s6fxmd.cloudfront.net/sites/default/files/test-product-test.png	2019-12-27	2019-12-27
1	abardy	Anthony Bardy	Software Engineer helping people build beautiful products through web technologies · React, GraphQL...	abardy@carbon-it,com	https://pbs.twimg.com/profile_images/521753979366023168/k0r2_nHi_400x400.jpeg	2019-12-27	2019-12-27
\.


                                                                                                                                                                                                                                 restore.sql                                                                                         0000600 0004000 0002000 00000012005 13612101774 0015364 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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

DROP DATABASE "CarbonTwitter";
--
-- Name: CarbonTwitter; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "CarbonTwitter" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE "CarbonTwitter" OWNER TO postgres;

\connect "CarbonTwitter"

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
-- Name: tweets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tweets (
    tweet character varying(280) NOT NULL,
    "from" character varying(50) NOT NULL,
    "createdAt" timestamp(6) without time zone NOT NULL,
    id integer NOT NULL,
    "updatedAt" date
);


ALTER TABLE public.tweets OWNER TO postgres;

--
-- Name: tweets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tweets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tweets_id_seq OWNER TO postgres;

--
-- Name: tweets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tweets_id_seq OWNED BY public.tweets.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying NOT NULL,
    "displayName" character varying NOT NULL,
    bio character varying,
    email character varying,
    photo character varying,
    "createdAt" date NOT NULL,
    "updatedAt" date
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: tweets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tweets ALTER COLUMN id SET DEFAULT nextval('public.tweets_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: tweets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tweets (tweet, "from", "createdAt", id, "updatedAt") FROM stdin;
\.
COPY public.tweets (tweet, "from", "createdAt", id, "updatedAt") FROM '$$PATH$$/3146.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, "displayName", bio, email, photo, "createdAt", "updatedAt") FROM stdin;
\.
COPY public.users (id, username, "displayName", bio, email, photo, "createdAt", "updatedAt") FROM '$$PATH$$/3148.dat';

--
-- Name: tweets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tweets_id_seq', 41, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: tweets tweets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tweets
    ADD CONSTRAINT tweets_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: tweets foreign_key_from_username; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tweets
    ADD CONSTRAINT foreign_key_from_username FOREIGN KEY ("from") REFERENCES public.users(username) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: DATABASE "CarbonTwitter"; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON DATABASE "CarbonTwitter" FROM postgres;
GRANT ALL ON DATABASE "CarbonTwitter" TO postgres WITH GRANT OPTION;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           