PGDMP                          x            CarbonTwitter    12.1    12.1     P           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            Q           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            R           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            S           1262    16393    CarbonTwitter    DATABASE     m   CREATE DATABASE "CarbonTwitter" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE "CarbonTwitter";
                postgres    false            T           0    0    DATABASE "CarbonTwitter"    ACL     {   REVOKE ALL ON DATABASE "CarbonTwitter" FROM postgres;
GRANT ALL ON DATABASE "CarbonTwitter" TO postgres WITH GRANT OPTION;
                   postgres    false    3155            �            1259    16394    tweets    TABLE     �   CREATE TABLE public.tweets (
    tweet character varying(280) NOT NULL,
    "from" character varying(50) NOT NULL,
    "createdAt" timestamp(6) without time zone NOT NULL,
    id integer NOT NULL,
    "updatedAt" date
);
    DROP TABLE public.tweets;
       public         heap    postgres    false            �            1259    16410    tweets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tweets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.tweets_id_seq;
       public          postgres    false    202            U           0    0    tweets_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.tweets_id_seq OWNED BY public.tweets.id;
          public          postgres    false    205            �            1259    16401    users    TABLE       CREATE TABLE public.users (
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
       public         heap    postgres    false            �            1259    16399    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    204            V           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    203            �           2604    16412 	   tweets id    DEFAULT     f   ALTER TABLE ONLY public.tweets ALTER COLUMN id SET DEFAULT nextval('public.tweets_id_seq'::regclass);
 8   ALTER TABLE public.tweets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    202            �           2604    16404    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    204    204            J          0    16394    tweets 
   TABLE DATA           M   COPY public.tweets (tweet, "from", "createdAt", id, "updatedAt") FROM stdin;
    public          postgres    false    202   �       L          0    16401    users 
   TABLE DATA           i   COPY public.users (id, username, "displayName", bio, email, photo, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    204   �       W           0    0    tweets_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.tweets_id_seq', 41, true);
          public          postgres    false    205            X           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 10, true);
          public          postgres    false    203            �           2606    16417    tweets tweets_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.tweets
    ADD CONSTRAINT tweets_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tweets DROP CONSTRAINT tweets_pkey;
       public            postgres    false    202            �           2606    16409    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    204            �           2606    16420    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    204            �           2606    16421     tweets foreign_key_from_username    FK CONSTRAINT     �   ALTER TABLE ONLY public.tweets
    ADD CONSTRAINT foreign_key_from_username FOREIGN KEY ("from") REFERENCES public.users(username) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 J   ALTER TABLE ONLY public.tweets DROP CONSTRAINT foreign_key_from_username;
       public          postgres    false    202    204    3018            J   (  x����n�0�g�)���ĎEQ��t(B0MT�%�-�훠�D%Bb���������:��ѹȊM�'F�E�9��$�B1b����B������7&�[��r�:��o`�Z(+_�}�Ƶlp�M���U�2��o�R�I��n����<]�@�Jm)�JC�_�?^3d������C����>|��ǥ2���m+��&��U����sg`��T�����}�z��X��_]#�3�]e��Ș̇�_�"�o�(m���q�S�JY�sA�)R�;A7FZ~��t�mk�$�����      L   �  x��Wɮ��]����W��LA{c�b�d��<�PP����{���}~��-��m�PNA�9�9`q��}.e�~�e�w���0����M�H�%��l�<�!���s��?d�e�u [9ES&u�Βbxc8��z�L��(T?K��|��\��f�7QE��R*�D܉Za�Yf�]މLu�E�7�bVzπ��y��V�4���*����=��N�N�{^N�~�o��_ ��hN��
(��r��L��L�)*:�����<Ei�����g$��O��)ѹ�C�cN=��\[���|p��q��;�趋(Vs��*L����~��D�}��)�6N4h}E�ʵ���N�ْ�[�i pNi�v�_|(��PoD��Qfw	M`z1�J#�4gV�����G����T��Y�"����mے=\	~��~�ǌ��ٞ��Q��(�sWB�����aL��=�yq����j�;�,�a7��������4��c\MXj��ԍ9� ��aZoW	�&��#�r���n�	��'�F�֠�5�Kvs��[��"%F��c� �B諕mG��9���\L�2]��s�<�I1I�Zw�\P"n����<�J7�I�>�Ь��ۈ���P�|���+�Wڈ�=&�Ƥ���;�_-��%_��	b�aCb�J^�il�*���D#L$�Px�nU�/{
��!NQ[_�k\OI��]s\�Y<�p�EPx`?��H@�ƷxW��gOF�i��;�]f$�,W��Y�*�*u�(pg�ڲ,GtΛt���^2��|�)�\c���(�RS���ԣ���L#�ڣ�p6�T�a|��>R������dc�-�+��L��i�I�����p��>zЯ8񃃥�㤗S�,���K�ov�g/������-2V��{O�o۫M����M��[d�s/��։n(Ó�����dK�۰��}Jݙ=ftF�V����0Dg�;��m���wu�J���6
��{�����$�R�g��4�\�C)�4=Z�vu�F����5>jg�ݷMKm���O�P��5��S��q��ر!��F��j��r�`NH��~� �B�������Lv���/(u�bl>ʄ�����7C&�A��P{�16(�jI����M�#N�S7��Ű�I��o���MfoD��4ψo�e1�q�/)��>5o���l�n
���w�JXU�c]U 7-sȉݢ�)�~�%�;H��M�c>|d��nV�H��+[e
�����[]�XP��<fB�ҳ�5�_k�[D�.%I���T�w�)�Y�Mf��aW�؏J��in <v��� dgg��N3aʑ���<��K�"��S{[���|�x�\=\�	/�F5{����0/bH�c��dFkv� �{]�� ��^��@�[�\�&�9b*�����] ��"�^vd:��XΉ��i��ӯ��{ ~8��V 8�Z<%]G
L�$zuEh�q�\6�ϭCu�m/ۑ97LM�]8�O=����M���{��7�]��]YU+�6q�Z�1�$�	�ʢ"+O�z���Y|������=H�?�*�,�8%m��B�/C���ն��f�뒭n���\���p]��v,ZQ1�i�Icf�m�����]YN8�=�����b�Bh�EH��¸�b�2���ʒ�772�ԺD�*uBБt�gs�������u�D� �p�$���Ţ5����p��bU�@^+_ޣ9���̿�0ITd��> ��Z����9�B���(��+��g�<��:�O�:;�Qڰ��.���n���l�Hz~�A�/Ws�+���VIQ��9s�%T�ҧnKd-��L���p��{��|�XrDn� h���L�%�(�{��zY�[B�Q,�HWQH�.�`� xT������`ำ��"���VY6s��.z�9;��A��!��o���t�X�y�Ц�������2�ӥI����%I���/_�ɴ��.N???�n�Ų�/ � e\,(8���&��:]�l��K`.O3@�f��,@V���/�߆�O�x������P�'�?=H�X�� ?�(����-E߽/����g�N����}�N�"m���/C�Mz�ֲI.Q�K���击�U1�k^\�4:�E�7}^�t���������E�¡0�/��q��8����V.?�}�_�C4.[��g/pz�����'�`0t��F"8��@N�X����~���;�x���~�7.}]M     