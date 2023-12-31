PGDMP     (    0                {            db_bootcamp_m8    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    125916    db_bootcamp_m8    DATABASE     �   CREATE DATABASE db_bootcamp_m8 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE db_bootcamp_m8;
                postgres    false            �            1259    180437 	   bootcamps    TABLE       CREATE TABLE public.bootcamps (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    cue integer NOT NULL,
    description character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.bootcamps;
       public         heap    postgres    false            �            1259    180436    bootcamps_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bootcamps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.bootcamps_id_seq;
       public          postgres    false    217                       0    0    bootcamps_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.bootcamps_id_seq OWNED BY public.bootcamps.id;
          public          postgres    false    216            �            1259    180445    user_bootcamp    TABLE     �   CREATE TABLE public.user_bootcamp (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    bootcamp_id integer NOT NULL
);
 !   DROP TABLE public.user_bootcamp;
       public         heap    postgres    false            �            1259    180426    users    TABLE     U  CREATE TABLE public.users (
    id integer NOT NULL,
    "firstName" character varying(50) NOT NULL,
    "lastName" character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    180425    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    215                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    214            o           2604    180440    bootcamps id    DEFAULT     l   ALTER TABLE ONLY public.bootcamps ALTER COLUMN id SET DEFAULT nextval('public.bootcamps_id_seq'::regclass);
 ;   ALTER TABLE public.bootcamps ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            n           2604    180429    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215                      0    180437 	   bootcamps 
   TABLE DATA           Z   COPY public.bootcamps (id, title, cue, description, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    217   �                 0    180445    user_bootcamp 
   TABLE DATA           W   COPY public.user_bootcamp ("createdAt", "updatedAt", user_id, bootcamp_id) FROM stdin;
    public          postgres    false    218   "!                 0    180426    users 
   TABLE DATA           g   COPY public.users (id, "firstName", "lastName", email, password, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    215   �!                  0    0    bootcamps_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.bootcamps_id_seq', 3, true);
          public          postgres    false    216                       0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 4, true);
          public          postgres    false    214            {           2606    180444    bootcamps bootcamps_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.bootcamps
    ADD CONSTRAINT bootcamps_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.bootcamps DROP CONSTRAINT bootcamps_pkey;
       public            postgres    false    217            }           2606    180449     user_bootcamp user_bootcamp_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.user_bootcamp
    ADD CONSTRAINT user_bootcamp_pkey PRIMARY KEY (user_id, bootcamp_id);
 J   ALTER TABLE ONLY public.user_bootcamp DROP CONSTRAINT user_bootcamp_pkey;
       public            postgres    false    218    218            q           2606    180479    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    215            s           2606    180481    users users_email_key1 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key1 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key1;
       public            postgres    false    215            u           2606    180477    users users_email_key2 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key2 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key2;
       public            postgres    false    215            w           2606    180483    users users_email_key3 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key3 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key3;
       public            postgres    false    215            y           2606    180433    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            ~           2606    180455 ,   user_bootcamp user_bootcamp_bootcamp_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_bootcamp
    ADD CONSTRAINT user_bootcamp_bootcamp_id_fkey FOREIGN KEY (bootcamp_id) REFERENCES public.bootcamps(id) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.user_bootcamp DROP CONSTRAINT user_bootcamp_bootcamp_id_fkey;
       public          postgres    false    217    218    3195                       2606    180450 (   user_bootcamp user_bootcamp_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_bootcamp
    ADD CONSTRAINT user_bootcamp_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.user_bootcamp DROP CONSTRAINT user_bootcamp_user_id_fkey;
       public          postgres    false    215    218    3193               z  x���MN�@��է��U�=��i����Sq�S��*�݆p
.6N��HH,XŊ�]��?!G�:�*�S��j�شP\��n�%��H���y{I�%�(�����-F�%�!a�*��2��=%7�����������|�\���������h�>��w���5�u"Pf�w�;�������G����ɺ���؃
&�䃊�ƒ�	�B��i0#�P���v��j��~"- hE���c�5Ij]�
8}lm"m���w�+�a���H����8f޲U{p�������;rkm8�0	e�'�j�yM�25�G�C��Sg����?�	��h� �����#<c��������]��_,��0W��������         b   x�u���0ѳ�"��x�%�ב\"[29���Ҳ�K1S�{�,%�?iR:2��z(���6b�M8�U��p%Mv��\j��R$]f�\�^y3=�#@h         +  x����r�0��u��.ܚ� J]��h�TO�MQ��(���^@��+L��8n�y��7�\R2	��o��hƜ��H�yݑ��iKG-�}Jv�s�r���WUuBw~���d�P��,J�(�D�� F�h�n[��t�3P�2�e�md���0HVr���eim+@�7@�RN�����{R����b8��Wu�9�c�%'~#� �*�U�L�k�M_��,��ӈx5�����z�|��^���2��DUK0`yv��b���w��z"�r5�e��}���"�l�di���������PӴ���     