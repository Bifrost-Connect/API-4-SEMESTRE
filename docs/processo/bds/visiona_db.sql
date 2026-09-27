--
-- PostgreSQL database dump
--

\restrict qd4s1Iw3UjdPBFwfMZ8Lc4mbZNkyoeacI1dXw2a9u0AaucgoiruHoj2vE0PEQBx

-- Dumped from database version 15.4 (Debian 15.4-1.pgdg110+1)
-- Dumped by pg_dump version 17.6

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: arquivo_original; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.arquivo_original (
    id bigint NOT NULL,
    processo_id bigint NOT NULL,
    usuario_upload_id bigint NOT NULL,
    nome_original character varying(255) NOT NULL,
    extensao character varying(20),
    tipo_mime character varying(100),
    tamanho_bytes bigint,
    url_armazenamento text NOT NULL,
    hash_sha256 character varying(64) NOT NULL,
    imutavel boolean DEFAULT true NOT NULL,
    data_upload timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.arquivo_original OWNER TO root;

--
-- Name: TABLE arquivo_original; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.arquivo_original IS 'Tabela cofre (RN02): guarda o arquivo bruto tal como chegou. Protegida contra UPDATE/DELETE pelo trigger em V2.';


--
-- Name: arquivo_original_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.arquivo_original_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.arquivo_original_id_seq OWNER TO root;

--
-- Name: arquivo_original_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.arquivo_original_id_seq OWNED BY public.arquivo_original.id;


--
-- Name: arquivo_processado; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.arquivo_processado (
    id bigint NOT NULL,
    arquivo_original_id bigint NOT NULL,
    processo_id bigint NOT NULL,
    etapa_geracao_id bigint NOT NULL,
    nome_arquivo character varying(255) NOT NULL,
    formato character varying(20),
    url_armazenamento text NOT NULL,
    hash_sha256 character varying(64),
    epsg character varying(20),
    data_criacao timestamp without time zone DEFAULT now() NOT NULL,
    versao integer NOT NULL
);


ALTER TABLE public.arquivo_processado OWNER TO root;

--
-- Name: arquivo_processado_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.arquivo_processado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.arquivo_processado_id_seq OWNER TO root;

--
-- Name: arquivo_processado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.arquivo_processado_id_seq OWNED BY public.arquivo_processado.id;


--
-- Name: auditoria; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auditoria (
    id bigint NOT NULL,
    usuario_id bigint NOT NULL,
    processo_id bigint,
    acao character varying(100) NOT NULL,
    descricao text,
    detalhes text,
    data_hora timestamp without time zone DEFAULT now() NOT NULL,
    ip character varying(45)
);


ALTER TABLE public.auditoria OWNER TO root;

--
-- Name: auditoria_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auditoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auditoria_id_seq OWNER TO root;

--
-- Name: auditoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auditoria_id_seq OWNED BY public.auditoria.id;


--
-- Name: conjunto; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.conjunto (
    id bigint NOT NULL,
    nome character varying(100) NOT NULL,
    descricao character varying(255),
    ativo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.conjunto OWNER TO root;

--
-- Name: conjunto_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.conjunto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.conjunto_id_seq OWNER TO root;

--
-- Name: conjunto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.conjunto_id_seq OWNED BY public.conjunto.id;


--
-- Name: etapa; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.etapa (
    id bigint NOT NULL,
    nome character varying(50) NOT NULL,
    ordem integer NOT NULL,
    descricao character varying(255)
);


ALTER TABLE public.etapa OWNER TO root;

--
-- Name: etapa_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.etapa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.etapa_id_seq OWNER TO root;

--
-- Name: etapa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.etapa_id_seq OWNED BY public.etapa.id;


--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO root;

--
-- Name: log_processamento; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.log_processamento (
    id bigint NOT NULL,
    processo_id bigint,
    processo_etapa_id bigint NOT NULL,
    nivel character varying(20) NOT NULL,
    mensagem text NOT NULL,
    codigo_erro character varying(30),
    detalhes text,
    data_hora timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT ck_log_nivel CHECK (((nivel)::text = ANY ((ARRAY['INFO'::character varying, 'WARNING'::character varying, 'ERROR'::character varying])::text[])))
);


ALTER TABLE public.log_processamento OWNER TO root;

--
-- Name: log_processamento_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.log_processamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.log_processamento_id_seq OWNER TO root;

--
-- Name: log_processamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.log_processamento_id_seq OWNED BY public.log_processamento.id;


--
-- Name: log_validacao; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.log_validacao (
    id bigint NOT NULL,
    processo_id bigint NOT NULL,
    ocorrencia_validacao_id bigint,
    identificador_feicao character varying(100),
    geom public.geometry,
    srid_origem integer,
    geom_valida boolean,
    motivo_invalidez text,
    geom_bruta text,
    severidade character varying(20) NOT NULL,
    mensagem text NOT NULL,
    data_deteccao timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT ck_log_validacao_severidade CHECK (((severidade)::text = ANY ((ARRAY['BAIXA'::character varying, 'MEDIA'::character varying, 'ALTA'::character varying, 'CRITICA'::character varying])::text[]))),
    CONSTRAINT ck_log_validacao_srid CHECK (((geom IS NULL) OR (srid_origem IS NULL) OR (public.st_srid(geom) = srid_origem))),
    CONSTRAINT ck_log_validacao_tem_geom CHECK (((geom IS NOT NULL) OR (geom_bruta IS NOT NULL)))
);


ALTER TABLE public.log_validacao OWNER TO root;

--
-- Name: TABLE log_validacao; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.log_validacao IS 'Log espacial detalhado por carga: geometria (ou texto bruto) associada a cada problema espacial detectado durante a validação de uma carga (processo).';


--
-- Name: log_validacao_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.log_validacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.log_validacao_id_seq OWNER TO root;

--
-- Name: log_validacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.log_validacao_id_seq OWNED BY public.log_validacao.id;


--
-- Name: ocorrencia_validacao; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.ocorrencia_validacao (
    id bigint NOT NULL,
    mensagem text,
    data_criacao timestamp without time zone DEFAULT now() NOT NULL,
    processo_id bigint NOT NULL,
    processo_etapa_id bigint NOT NULL,
    regra_id bigint NOT NULL,
    severidade character varying(20) NOT NULL,
    status character varying(20) DEFAULT 'PENDENTE'::character varying NOT NULL,
    descricao text,
    detalhes text,
    data_deteccao timestamp without time zone DEFAULT now() NOT NULL,
    data_resolucao timestamp without time zone,
    auditor_id bigint,
    observacao_auditor text,
    CONSTRAINT ck_ocorrencia_severidade CHECK (((severidade)::text = ANY ((ARRAY['BAIXA'::character varying, 'MEDIA'::character varying, 'ALTA'::character varying, 'CRITICA'::character varying])::text[]))),
    CONSTRAINT ck_ocorrencia_status CHECK (((status)::text = ANY ((ARRAY['PENDENTE'::character varying, 'EM_ANALISE'::character varying, 'APROVADA'::character varying, 'REJEITADA'::character varying, 'CORRIGIDA'::character varying])::text[])))
);


ALTER TABLE public.ocorrencia_validacao OWNER TO root;

--
-- Name: ocorrencia_validacao_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.ocorrencia_validacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ocorrencia_validacao_id_seq OWNER TO root;

--
-- Name: ocorrencia_validacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.ocorrencia_validacao_id_seq OWNED BY public.ocorrencia_validacao.id;


--
-- Name: orgao; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.orgao (
    id bigint NOT NULL,
    nome character varying(150) NOT NULL,
    sigla character varying(20),
    descricao character varying(255),
    ativo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.orgao OWNER TO root;

--
-- Name: orgao_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.orgao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orgao_id_seq OWNER TO root;

--
-- Name: orgao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.orgao_id_seq OWNED BY public.orgao.id;


--
-- Name: perfil; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.perfil (
    id bigint NOT NULL,
    nome character varying(50) NOT NULL,
    descricao character varying(255)
);


ALTER TABLE public.perfil OWNER TO root;

--
-- Name: perfil_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.perfil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.perfil_id_seq OWNER TO root;

--
-- Name: perfil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.perfil_id_seq OWNED BY public.perfil.id;


--
-- Name: processo; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.processo (
    id bigint NOT NULL,
    operador_id bigint NOT NULL,
    conjunto_id bigint NOT NULL,
    orgao_id bigint NOT NULL,
    etapa_atual_id bigint,
    situacao_atual_id bigint,
    ano_safra character varying(10) NOT NULL,
    epsg_origem character varying(20) NOT NULL,
    epsg_destino character varying(20),
    data_criacao timestamp without time zone DEFAULT now() NOT NULL,
    data_inicio timestamp without time zone,
    data_fim timestamp without time zone
);


ALTER TABLE public.processo OWNER TO root;

--
-- Name: processo_etapa; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.processo_etapa (
    id bigint NOT NULL,
    processo_id bigint NOT NULL,
    etapa_id bigint NOT NULL,
    situacao_id bigint NOT NULL,
    data_inicio timestamp without time zone NOT NULL,
    data_fim timestamp without time zone,
    tentativa integer DEFAULT 1 NOT NULL,
    mensagem text,
    resultado text
);


ALTER TABLE public.processo_etapa OWNER TO root;

--
-- Name: processo_etapa_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.processo_etapa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.processo_etapa_id_seq OWNER TO root;

--
-- Name: processo_etapa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.processo_etapa_id_seq OWNED BY public.processo_etapa.id;


--
-- Name: processo_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.processo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.processo_id_seq OWNER TO root;

--
-- Name: processo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.processo_id_seq OWNED BY public.processo.id;


--
-- Name: publicacao; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.publicacao (
    id bigint NOT NULL,
    processo_id bigint NOT NULL,
    arquivo_processado_id bigint NOT NULL,
    data_publicacao timestamp without time zone DEFAULT now() NOT NULL,
    usuario_responsavel_id bigint NOT NULL,
    status character varying(30) NOT NULL,
    destino character varying(150),
    mensagem text
);


ALTER TABLE public.publicacao OWNER TO root;

--
-- Name: publicacao_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.publicacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.publicacao_id_seq OWNER TO root;

--
-- Name: publicacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.publicacao_id_seq OWNED BY public.publicacao.id;


--
-- Name: regra_validacao; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.regra_validacao (
    id bigint NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    nome character varying(100) NOT NULL,
    descricao character varying(255),
    tipo character varying(50),
    severidade character varying(20) NOT NULL,
    ativa boolean DEFAULT true NOT NULL,
    CONSTRAINT ck_regra_severidade CHECK (((severidade)::text = ANY ((ARRAY['BAIXA'::character varying, 'MEDIA'::character varying, 'ALTA'::character varying, 'CRITICA'::character varying])::text[])))
);


ALTER TABLE public.regra_validacao OWNER TO root;

--
-- Name: regra_validacao_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.regra_validacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.regra_validacao_id_seq OWNER TO root;

--
-- Name: regra_validacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.regra_validacao_id_seq OWNED BY public.regra_validacao.id;


--
-- Name: situacao; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.situacao (
    id bigint NOT NULL,
    nome character varying(50) NOT NULL,
    descricao character varying(255)
);


ALTER TABLE public.situacao OWNER TO root;

--
-- Name: situacao_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.situacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.situacao_id_seq OWNER TO root;

--
-- Name: situacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.situacao_id_seq OWNED BY public.situacao.id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.usuario (
    id bigint NOT NULL,
    nome character varying(150) NOT NULL,
    email character varying(150) NOT NULL,
    senha_hash character varying(255) NOT NULL,
    perfil_id bigint NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    data_criacao timestamp without time zone DEFAULT now() NOT NULL,
    data_atualizacao timestamp without time zone
);


ALTER TABLE public.usuario OWNER TO root;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_seq OWNER TO root;

--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- Name: arquivo_original id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.arquivo_original ALTER COLUMN id SET DEFAULT nextval('public.arquivo_original_id_seq'::regclass);


--
-- Name: arquivo_processado id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.arquivo_processado ALTER COLUMN id SET DEFAULT nextval('public.arquivo_processado_id_seq'::regclass);


--
-- Name: auditoria id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auditoria ALTER COLUMN id SET DEFAULT nextval('public.auditoria_id_seq'::regclass);


--
-- Name: conjunto id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.conjunto ALTER COLUMN id SET DEFAULT nextval('public.conjunto_id_seq'::regclass);


--
-- Name: etapa id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.etapa ALTER COLUMN id SET DEFAULT nextval('public.etapa_id_seq'::regclass);


--
-- Name: log_processamento id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.log_processamento ALTER COLUMN id SET DEFAULT nextval('public.log_processamento_id_seq'::regclass);


--
-- Name: log_validacao id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.log_validacao ALTER COLUMN id SET DEFAULT nextval('public.log_validacao_id_seq'::regclass);


--
-- Name: ocorrencia_validacao id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ocorrencia_validacao ALTER COLUMN id SET DEFAULT nextval('public.ocorrencia_validacao_id_seq'::regclass);


--
-- Name: orgao id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.orgao ALTER COLUMN id SET DEFAULT nextval('public.orgao_id_seq'::regclass);


--
-- Name: perfil id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.perfil ALTER COLUMN id SET DEFAULT nextval('public.perfil_id_seq'::regclass);


--
-- Name: processo id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.processo ALTER COLUMN id SET DEFAULT nextval('public.processo_id_seq'::regclass);


--
-- Name: processo_etapa id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.processo_etapa ALTER COLUMN id SET DEFAULT nextval('public.processo_etapa_id_seq'::regclass);


--
-- Name: publicacao id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.publicacao ALTER COLUMN id SET DEFAULT nextval('public.publicacao_id_seq'::regclass);


--
-- Name: regra_validacao id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.regra_validacao ALTER COLUMN id SET DEFAULT nextval('public.regra_validacao_id_seq'::regclass);


--
-- Name: situacao id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.situacao ALTER COLUMN id SET DEFAULT nextval('public.situacao_id_seq'::regclass);


--
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- Data for Name: arquivo_original; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.arquivo_original (id, processo_id, usuario_upload_id, nome_original, extensao, tipo_mime, tamanho_bytes, url_armazenamento, hash_sha256, imutavel, data_upload) FROM stdin;
2	4	1	Biomas_5000mil.zip	\N	\N	464653	/uploads/Biomas_5000mil.zip	8d677ecf885f7abfa672f5f3525a09e76854f0bcacec4c2a893c5a97ed4c0a70	t	2026-09-24 19:18:45.228046
3	5	1	Áreas de Quilombolas.zip	\N	\N	3063874	/uploads/Áreas de Quilombolas.zip	5af037950e2e04ba14f466f93c04f009d5f5f999b38863a67771640cc9abc724	t	2026-09-24 19:42:28.362412
4	6	1	PR_Municipios_2025.zip	\N	\N	12049154	/uploads/PR_Municipios_2025.zip	1a9b6ff7d1e2a42665dc3e9a9bde46a542d6609c7d775092c4e767d9899d3e6f	t	2026-09-24 19:59:45.383812
5	7	1	bdqueimadas_2025-09-01_2026-09-02.zip	\N	\N	3358587	/uploads/bdqueimadas_2025-09-01_2026-09-02.zip	19e4ff87f7ee0040e0dc06487622e9c8acd7a4fe34e2ca5f21dca0dd52842202	t	2026-09-24 20:01:52.939064
\.


--
-- Data for Name: arquivo_processado; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.arquivo_processado (id, arquivo_original_id, processo_id, etapa_geracao_id, nome_arquivo, formato, url_armazenamento, hash_sha256, epsg, data_criacao, versao) FROM stdin;
\.


--
-- Data for Name: auditoria; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auditoria (id, usuario_id, processo_id, acao, descricao, detalhes, data_hora, ip) FROM stdin;
1	1	\N	UPLOAD_ARQUIVO	\N	Upload realizado com sucesso para o Processo ID: 4, Arquivo: Biomas_5000mil.zip	2026-09-24 19:18:45.262316	\N
2	1	\N	UPLOAD_ARQUIVO	\N	Upload realizado com sucesso para o Processo ID: 5, Arquivo: Áreas de Quilombolas.zip	2026-09-24 19:42:28.517314	\N
3	1	\N	UPLOAD_ARQUIVO	\N	Upload realizado com sucesso para o Processo ID: 6, Arquivo: PR_Municipios_2025.zip	2026-09-24 19:59:45.540055	\N
4	1	\N	UPLOAD_ARQUIVO	\N	Upload realizado com sucesso para o Processo ID: 7, Arquivo: bdqueimadas_2025-09-01_2026-09-02.zip	2026-09-24 20:01:53.020648	\N
\.


--
-- Data for Name: conjunto; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.conjunto (id, nome, descricao, ativo) FROM stdin;
1	Malha municipal	Divisas geopolíticas para cruzamentos	t
2	Uso e cobertura do solo	Mapeamento de florestas e pastagens	t
\.


--
-- Data for Name: etapa; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.etapa (id, nome, ordem, descricao) FROM stdin;
1	INGESTAO	1	Recebimento e hash do arquivo
2	TRATAMENTO	2	Padronizacao e limpeza automatizada
3	VALIDACAO	3	Motor de regras / quarentena
4	CALCULO_ANALITICO	4	Geracao de metricas e cruzamentos
5	PUBLICACAO	5	Disponibilizacao no banco corporativo
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	create dominio	SQL	V1__create_dominio.sql	1192018345	root	2026-09-24 18:48:46.949498	49	t
2	2	create usuario	SQL	V2__create_usuario.sql	-952801067	root	2026-09-24 18:48:47.044423	20	t
3	3	create processo	SQL	V3__create_processo.sql	2025395073	root	2026-09-24 18:48:47.098061	171	t
4	4	create arquivo original	SQL	V4__create_arquivo_original.sql	1090643879	root	2026-09-24 18:48:47.294527	26	t
5	5	trigger bloqueio arquivo original	SQL	V5__trigger_bloqueio_arquivo_original.sql	1087398873	root	2026-09-24 18:48:47.343531	13	t
6	6	create arquivo processado	SQL	V6__create_arquivo_processado.sql	-1060255736	root	2026-09-24 18:48:47.378205	19	t
7	7	create processo etapa	SQL	V7__create_processo_etapa.sql	1321439952	root	2026-09-24 18:48:47.41528	14	t
8	8	create log processamento	SQL	V8__create_log_processamento.sql	247905014	root	2026-09-24 18:48:47.447112	16	t
9	9	create regra validacao	SQL	V9__create_regra_validacao.sql	628697758	root	2026-09-24 18:48:47.48138	13	t
10	10	create ocorrencia validacao	SQL	V10__create_ocorrencia_validacao.sql	48682947	root	2026-09-24 18:48:47.520366	20	t
11	11	create auditoria	SQL	V11__create_auditoria.sql	-912884367	root	2026-09-24 18:48:47.562187	22	t
12	12	create publicacao	SQL	V12__create_publicacao.sql	-1307101549	root	2026-09-24 18:48:47.603321	16	t
13	13	create log validacao	SQL	V13__create_log_validacao.sql	-1894230329	root	2026-09-24 18:48:47.637578	42	t
14	14	trigger bloqueio quarentena	SQL	V14__trigger_bloqueio_quarentena.sql	-621012957	root	2026-09-24 18:48:47.70427	8	t
15	15	insert dados iniciais teste	SQL	V15__insert_dados_iniciais_teste.sql	0	root	2026-09-24 18:48:47.729566	4	t
\.


--
-- Data for Name: log_processamento; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.log_processamento (id, processo_id, processo_etapa_id, nivel, mensagem, codigo_erro, detalhes, data_hora) FROM stdin;
\.


--
-- Data for Name: log_validacao; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.log_validacao (id, processo_id, ocorrencia_validacao_id, identificador_feicao, geom, srid_origem, geom_valida, motivo_invalidez, geom_bruta, severidade, mensagem, data_deteccao) FROM stdin;
\.


--
-- Data for Name: ocorrencia_validacao; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.ocorrencia_validacao (id, mensagem, data_criacao, processo_id, processo_etapa_id, regra_id, severidade, status, descricao, detalhes, data_deteccao, data_resolucao, auditor_id, observacao_auditor) FROM stdin;
\.


--
-- Data for Name: orgao; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.orgao (id, nome, sigla, descricao, ativo) FROM stdin;
1	Instituto Brasileiro de Geografia e Estatística	IBGE	Base de Malhas e Biomas	t
2	Instituto Nacional de Pesquisas Espaciais	INPE	Base de Desmatamento	t
\.


--
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.perfil (id, nome, descricao) FROM stdin;
1	OPERADOR	Responsavel pela entrada das cargas
2	AUDITOR	Responsavel por tratar problemas de validacao
3	ANALISTA	Consome dados publicados para analise
4	ADMINISTRADOR	Gerenciamento administrativo do sistema
\.


--
-- Data for Name: processo; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.processo (id, operador_id, conjunto_id, orgao_id, etapa_atual_id, situacao_atual_id, ano_safra, epsg_origem, epsg_destino, data_criacao, data_inicio, data_fim) FROM stdin;
4	1	1	1	\N	\N	2024	4674	\N	2026-09-24 19:13:09.609891	\N	\N
5	3	2	2	\N	\N	2025	4674	\N	2026-09-24 19:37:01.9392	\N	\N
6	1	1	1	\N	\N	2025	4674	\N	2026-09-24 19:58:49.259893	\N	\N
7	3	2	2	\N	\N	2026	4674	\N	2026-09-24 20:00:44.21194	\N	\N
8	1	2	1	\N	\N	2026	4674	\N	2026-09-24 20:02:28.123947	\N	\N
\.


--
-- Data for Name: processo_etapa; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.processo_etapa (id, processo_id, etapa_id, situacao_id, data_inicio, data_fim, tentativa, mensagem, resultado) FROM stdin;
\.


--
-- Data for Name: publicacao; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.publicacao (id, processo_id, arquivo_processado_id, data_publicacao, usuario_responsavel_id, status, destino, mensagem) FROM stdin;
\.


--
-- Data for Name: regra_validacao; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.regra_validacao (id, ativo, nome, descricao, tipo, severidade, ativa) FROM stdin;
1	t	CAR_DUPLICADO	CAR ja existente na base corporativa	DUPLICIDADE	CRITICA	t
2	t	GEOMETRIA_INVALIDA	Poligono com geometria invalida	GEOMETRIA	ALTA	t
3	t	SOBREPOSICAO_PROPRIEDADE	Poligono sobreposto a outra propriedade	TOPOLOGIA	CRITICA	t
4	t	SOBREPOSICAO_TERRA_INDIGENA	Poligono sobreposto a terra indigena	TOPOLOGIA	CRITICA	t
5	t	EPSG_INVALIDO	Sistema de coordenadas nao reconhecido	METADADO	MEDIA	t
\.


--
-- Data for Name: situacao; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.situacao (id, nome, descricao) FROM stdin;
1	EM_ANDAMENTO	Etapa sendo executada
2	EM_VALIDACAO	Aguardando intervencao do auditor
3	COM_RESSALVA	Concluida com aviso nao-impeditivo
4	FALHOU	Erro tecnico intransponivel
5	CONCLUIDA	Executada com exito
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.usuario (id, nome, email, senha_hash, perfil_id, ativo, data_criacao, data_atualizacao) FROM stdin;
3	Niuan Souza (Operador)	niuan@bifrost.com	senha123	1	t	2026-09-24 22:24:41.258018	\N
4	Guilherme Gomes (Auditor)	guilherme@bifrost.com	senha123	2	t	2026-09-24 22:24:41.258018	\N
5	Ana França (Analista)	ana@bifrost.com	senha123	3	t	2026-09-24 22:24:41.258018	\N
6	Luan (Analista)	luan@bifrost.com	senha123	3	t	2026-09-24 22:24:41.258018	\N
7	Leonardo Graciano (Admin)	leonardo@bifrost.com	senha123	4	t	2026-09-24 22:24:41.258018	\N
8	João Vinícius (Admin)	joao@bifrost.com	senha123	4	t	2026-09-24 22:24:41.258018	\N
1	Vitor Samuel (Operador)	vitor.operador@bifrost.com	senha123	1	t	2026-09-24 22:09:33.731838	\N
2	Daniel Natan (Auditor)	daniel.auditor@bifrost.com	senha123	2	t	2026-09-24 22:09:33.731838	\N
\.


--
-- Name: arquivo_original_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.arquivo_original_id_seq', 5, true);


--
-- Name: arquivo_processado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.arquivo_processado_id_seq', 1, false);


--
-- Name: auditoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auditoria_id_seq', 4, true);


--
-- Name: conjunto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.conjunto_id_seq', 2, true);


--
-- Name: etapa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.etapa_id_seq', 5, true);


--
-- Name: log_processamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.log_processamento_id_seq', 1, false);


--
-- Name: log_validacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.log_validacao_id_seq', 1, false);


--
-- Name: ocorrencia_validacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.ocorrencia_validacao_id_seq', 1, false);


--
-- Name: orgao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.orgao_id_seq', 2, true);


--
-- Name: perfil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.perfil_id_seq', 4, true);


--
-- Name: processo_etapa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.processo_etapa_id_seq', 1, false);


--
-- Name: processo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.processo_id_seq', 8, true);


--
-- Name: publicacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.publicacao_id_seq', 1, false);


--
-- Name: regra_validacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.regra_validacao_id_seq', 5, true);


--
-- Name: situacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.situacao_id_seq', 5, true);


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.usuario_id_seq', 8, true);


--
-- Name: arquivo_original arquivo_original_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.arquivo_original
    ADD CONSTRAINT arquivo_original_pkey PRIMARY KEY (id);


--
-- Name: arquivo_processado arquivo_processado_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.arquivo_processado
    ADD CONSTRAINT arquivo_processado_pkey PRIMARY KEY (id);


--
-- Name: auditoria auditoria_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auditoria
    ADD CONSTRAINT auditoria_pkey PRIMARY KEY (id);


--
-- Name: conjunto conjunto_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.conjunto
    ADD CONSTRAINT conjunto_pkey PRIMARY KEY (id);


--
-- Name: etapa etapa_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.etapa
    ADD CONSTRAINT etapa_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: log_processamento log_processamento_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.log_processamento
    ADD CONSTRAINT log_processamento_pkey PRIMARY KEY (id);


--
-- Name: log_validacao log_validacao_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.log_validacao
    ADD CONSTRAINT log_validacao_pkey PRIMARY KEY (id);


--
-- Name: ocorrencia_validacao ocorrencia_validacao_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ocorrencia_validacao
    ADD CONSTRAINT ocorrencia_validacao_pkey PRIMARY KEY (id);


--
-- Name: orgao orgao_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.orgao
    ADD CONSTRAINT orgao_pkey PRIMARY KEY (id);


--
-- Name: perfil perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT perfil_pkey PRIMARY KEY (id);


--
-- Name: processo_etapa processo_etapa_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.processo_etapa
    ADD CONSTRAINT processo_etapa_pkey PRIMARY KEY (id);


--
-- Name: processo processo_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.processo
    ADD CONSTRAINT processo_pkey PRIMARY KEY (id);


--
-- Name: publicacao publicacao_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.publicacao
    ADD CONSTRAINT publicacao_pkey PRIMARY KEY (id);


--
-- Name: regra_validacao regra_validacao_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.regra_validacao
    ADD CONSTRAINT regra_validacao_pkey PRIMARY KEY (id);


--
-- Name: situacao situacao_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.situacao
    ADD CONSTRAINT situacao_pkey PRIMARY KEY (id);


--
-- Name: arquivo_original uq_arquivo_original_hash; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.arquivo_original
    ADD CONSTRAINT uq_arquivo_original_hash UNIQUE (hash_sha256);


--
-- Name: conjunto uq_conjunto_nome; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.conjunto
    ADD CONSTRAINT uq_conjunto_nome UNIQUE (nome);


--
-- Name: etapa uq_etapa_nome; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.etapa
    ADD CONSTRAINT uq_etapa_nome UNIQUE (nome);


--
-- Name: orgao uq_orgao_nome; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.orgao
    ADD CONSTRAINT uq_orgao_nome UNIQUE (nome);


--
-- Name: perfil uq_perfil_nome; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT uq_perfil_nome UNIQUE (nome);


--
-- Name: regra_validacao uq_regra_validacao_nome; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.regra_validacao
    ADD CONSTRAINT uq_regra_validacao_nome UNIQUE (nome);


--
-- Name: situacao uq_situacao_nome; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.situacao
    ADD CONSTRAINT uq_situacao_nome UNIQUE (nome);


--
-- Name: usuario uq_usuario_email; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uq_usuario_email UNIQUE (email);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- Name: idx_arquivo_original_hash; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_arquivo_original_hash ON public.arquivo_original USING btree (hash_sha256);


--
-- Name: idx_arquivo_original_processo; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_arquivo_original_processo ON public.arquivo_original USING btree (processo_id);


--
-- Name: idx_arquivo_processado_original; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_arquivo_processado_original ON public.arquivo_processado USING btree (arquivo_original_id);


--
-- Name: idx_arquivo_processado_processo; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_arquivo_processado_processo ON public.arquivo_processado USING btree (processo_id);


--
-- Name: idx_auditoria_usuario_data; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_auditoria_usuario_data ON public.auditoria USING btree (usuario_id, data_hora);


--
-- Name: idx_log_processo_etapa; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_log_processo_etapa ON public.log_processamento USING btree (processo_etapa_id);


--
-- Name: idx_log_validacao_geom; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_log_validacao_geom ON public.log_validacao USING gist (geom);


--
-- Name: idx_log_validacao_ocorrencia; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_log_validacao_ocorrencia ON public.log_validacao USING btree (ocorrencia_validacao_id);


--
-- Name: idx_log_validacao_processo; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_log_validacao_processo ON public.log_validacao USING btree (processo_id);


--
-- Name: idx_ocorrencia_processo_status; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_ocorrencia_processo_status ON public.ocorrencia_validacao USING btree (processo_id, status);


--
-- Name: idx_processo_conjunto; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_processo_conjunto ON public.processo USING btree (conjunto_id);


--
-- Name: idx_processo_dashboard; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_processo_dashboard ON public.processo USING btree (conjunto_id, situacao_atual_id, data_criacao);


--
-- Name: idx_processo_etapa_processo; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_processo_etapa_processo ON public.processo_etapa USING btree (processo_id, etapa_id);


--
-- Name: idx_processo_operador; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_processo_operador ON public.processo USING btree (operador_id);


--
-- Name: idx_processo_orgao; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_processo_orgao ON public.processo USING btree (orgao_id);


--
-- Name: idx_publicacao_processo; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_publicacao_processo ON public.publicacao USING btree (processo_id);


--
-- Name: idx_usuario_perfil; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_usuario_perfil ON public.usuario USING btree (perfil_id);


--
-- Name: arquivo_original trg_bloquear_delete_arquivo_original; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER trg_bloquear_delete_arquivo_original BEFORE DELETE ON public.arquivo_original FOR EACH ROW EXECUTE FUNCTION public.fn_bloquear_alteracao_arquivo_original();


--
-- Name: arquivo_processado trg_bloquear_edicao_arquivo_processado; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER trg_bloquear_edicao_arquivo_processado BEFORE DELETE OR UPDATE ON public.arquivo_processado FOR EACH ROW EXECUTE FUNCTION public.fn_bloquear_edicao_quarentena();


--
-- Name: arquivo_original trg_bloquear_update_arquivo_original; Type: TRIGGER; Schema: public; Owner: root
--

CREATE TRIGGER trg_bloquear_update_arquivo_original BEFORE UPDATE ON public.arquivo_original FOR EACH ROW EXECUTE FUNCTION public.fn_bloquear_alteracao_arquivo_original();


--
-- Name: arquivo_original arquivo_original_processo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.arquivo_original
    ADD CONSTRAINT arquivo_original_processo_id_fkey FOREIGN KEY (processo_id) REFERENCES public.processo(id);


--
-- Name: arquivo_original arquivo_original_usuario_upload_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.arquivo_original
    ADD CONSTRAINT arquivo_original_usuario_upload_id_fkey FOREIGN KEY (usuario_upload_id) REFERENCES public.usuario(id);


--
-- Name: arquivo_processado arquivo_processado_arquivo_original_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.arquivo_processado
    ADD CONSTRAINT arquivo_processado_arquivo_original_id_fkey FOREIGN KEY (arquivo_original_id) REFERENCES public.arquivo_original(id);


--
-- Name: arquivo_processado arquivo_processado_etapa_geracao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.arquivo_processado
    ADD CONSTRAINT arquivo_processado_etapa_geracao_id_fkey FOREIGN KEY (etapa_geracao_id) REFERENCES public.etapa(id);


--
-- Name: arquivo_processado arquivo_processado_processo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.arquivo_processado
    ADD CONSTRAINT arquivo_processado_processo_id_fkey FOREIGN KEY (processo_id) REFERENCES public.processo(id);


--
-- Name: auditoria auditoria_processo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auditoria
    ADD CONSTRAINT auditoria_processo_id_fkey FOREIGN KEY (processo_id) REFERENCES public.processo(id);


--
-- Name: auditoria auditoria_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auditoria
    ADD CONSTRAINT auditoria_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- Name: log_processamento log_processamento_processo_etapa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.log_processamento
    ADD CONSTRAINT log_processamento_processo_etapa_id_fkey FOREIGN KEY (processo_etapa_id) REFERENCES public.processo_etapa(id);


--
-- Name: log_processamento log_processamento_processo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.log_processamento
    ADD CONSTRAINT log_processamento_processo_id_fkey FOREIGN KEY (processo_id) REFERENCES public.processo(id);


--
-- Name: log_validacao log_validacao_ocorrencia_validacao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.log_validacao
    ADD CONSTRAINT log_validacao_ocorrencia_validacao_id_fkey FOREIGN KEY (ocorrencia_validacao_id) REFERENCES public.ocorrencia_validacao(id);


--
-- Name: log_validacao log_validacao_processo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.log_validacao
    ADD CONSTRAINT log_validacao_processo_id_fkey FOREIGN KEY (processo_id) REFERENCES public.processo(id);


--
-- Name: ocorrencia_validacao ocorrencia_validacao_auditor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ocorrencia_validacao
    ADD CONSTRAINT ocorrencia_validacao_auditor_id_fkey FOREIGN KEY (auditor_id) REFERENCES public.usuario(id);


--
-- Name: ocorrencia_validacao ocorrencia_validacao_processo_etapa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ocorrencia_validacao
    ADD CONSTRAINT ocorrencia_validacao_processo_etapa_id_fkey FOREIGN KEY (processo_etapa_id) REFERENCES public.processo_etapa(id);


--
-- Name: ocorrencia_validacao ocorrencia_validacao_processo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ocorrencia_validacao
    ADD CONSTRAINT ocorrencia_validacao_processo_id_fkey FOREIGN KEY (processo_id) REFERENCES public.processo(id);


--
-- Name: ocorrencia_validacao ocorrencia_validacao_regra_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ocorrencia_validacao
    ADD CONSTRAINT ocorrencia_validacao_regra_id_fkey FOREIGN KEY (regra_id) REFERENCES public.regra_validacao(id);


--
-- Name: processo processo_conjunto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.processo
    ADD CONSTRAINT processo_conjunto_id_fkey FOREIGN KEY (conjunto_id) REFERENCES public.conjunto(id);


--
-- Name: processo processo_etapa_atual_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.processo
    ADD CONSTRAINT processo_etapa_atual_id_fkey FOREIGN KEY (etapa_atual_id) REFERENCES public.etapa(id);


--
-- Name: processo_etapa processo_etapa_etapa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.processo_etapa
    ADD CONSTRAINT processo_etapa_etapa_id_fkey FOREIGN KEY (etapa_id) REFERENCES public.etapa(id);


--
-- Name: processo_etapa processo_etapa_processo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.processo_etapa
    ADD CONSTRAINT processo_etapa_processo_id_fkey FOREIGN KEY (processo_id) REFERENCES public.processo(id);


--
-- Name: processo_etapa processo_etapa_situacao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.processo_etapa
    ADD CONSTRAINT processo_etapa_situacao_id_fkey FOREIGN KEY (situacao_id) REFERENCES public.situacao(id);


--
-- Name: processo processo_operador_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.processo
    ADD CONSTRAINT processo_operador_id_fkey FOREIGN KEY (operador_id) REFERENCES public.usuario(id);


--
-- Name: processo processo_orgao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.processo
    ADD CONSTRAINT processo_orgao_id_fkey FOREIGN KEY (orgao_id) REFERENCES public.orgao(id);


--
-- Name: processo processo_situacao_atual_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.processo
    ADD CONSTRAINT processo_situacao_atual_id_fkey FOREIGN KEY (situacao_atual_id) REFERENCES public.situacao(id);


--
-- Name: publicacao publicacao_arquivo_processado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.publicacao
    ADD CONSTRAINT publicacao_arquivo_processado_id_fkey FOREIGN KEY (arquivo_processado_id) REFERENCES public.arquivo_processado(id);


--
-- Name: publicacao publicacao_processo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.publicacao
    ADD CONSTRAINT publicacao_processo_id_fkey FOREIGN KEY (processo_id) REFERENCES public.processo(id);


--
-- Name: publicacao publicacao_usuario_responsavel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.publicacao
    ADD CONSTRAINT publicacao_usuario_responsavel_id_fkey FOREIGN KEY (usuario_responsavel_id) REFERENCES public.usuario(id);


--
-- Name: usuario usuario_perfil_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_perfil_id_fkey FOREIGN KEY (perfil_id) REFERENCES public.perfil(id);


--
-- PostgreSQL database dump complete
--

\unrestrict qd4s1Iw3UjdPBFwfMZ8Lc4mbZNkyoeacI1dXw2a9u0AaucgoiruHoj2vE0PEQBx

