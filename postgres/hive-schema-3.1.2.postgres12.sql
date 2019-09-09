--
-- PostgreSQL database dump
--

-- Dumped from database version 12beta3 (Debian 12~beta3-1.pgdg100+1)
-- Dumped by pg_dump version 12beta3 (Debian 12~beta3-1.pgdg100+1)

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
-- Name: BUCKETING_COLS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."BUCKETING_COLS" (
    "SD_ID" bigint NOT NULL,
    "BUCKET_COL_NAME" character varying(256) DEFAULT NULL::character varying,
    "INTEGER_IDX" bigint NOT NULL
);


ALTER TABLE public."BUCKETING_COLS" OWNER TO hive;

--
-- Name: CDS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."CDS" (
    "CD_ID" bigint NOT NULL
);


ALTER TABLE public."CDS" OWNER TO hive;

--
-- Name: COLUMNS_V2; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."COLUMNS_V2" (
    "CD_ID" bigint NOT NULL,
    "COMMENT" character varying(4000),
    "COLUMN_NAME" character varying(767) NOT NULL,
    "TYPE_NAME" text,
    "INTEGER_IDX" integer NOT NULL
);


ALTER TABLE public."COLUMNS_V2" OWNER TO hive;

--
-- Name: CTLGS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."CTLGS" (
    "CTLG_ID" bigint NOT NULL,
    "NAME" character varying(256),
    "DESC" character varying(4000),
    "LOCATION_URI" character varying(4000) NOT NULL
);


ALTER TABLE public."CTLGS" OWNER TO hive;

--
-- Name: DATABASE_PARAMS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."DATABASE_PARAMS" (
    "DB_ID" bigint NOT NULL,
    "PARAM_KEY" character varying(180) NOT NULL,
    "PARAM_VALUE" character varying(4000) DEFAULT NULL::character varying
);


ALTER TABLE public."DATABASE_PARAMS" OWNER TO hive;

--
-- Name: DBS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."DBS" (
    "DB_ID" bigint NOT NULL,
    "DESC" character varying(4000) DEFAULT NULL::character varying,
    "DB_LOCATION_URI" character varying(4000) NOT NULL,
    "NAME" character varying(128) DEFAULT NULL::character varying,
    "OWNER_NAME" character varying(128) DEFAULT NULL::character varying,
    "OWNER_TYPE" character varying(10) DEFAULT NULL::character varying,
    "CTLG_NAME" character varying(256) DEFAULT 'hive'::character varying
);


ALTER TABLE public."DBS" OWNER TO hive;

--
-- Name: DB_PRIVS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."DB_PRIVS" (
    "DB_GRANT_ID" bigint NOT NULL,
    "CREATE_TIME" bigint NOT NULL,
    "DB_ID" bigint,
    "GRANT_OPTION" smallint NOT NULL,
    "GRANTOR" character varying(128) DEFAULT NULL::character varying,
    "GRANTOR_TYPE" character varying(128) DEFAULT NULL::character varying,
    "PRINCIPAL_NAME" character varying(128) DEFAULT NULL::character varying,
    "PRINCIPAL_TYPE" character varying(128) DEFAULT NULL::character varying,
    "DB_PRIV" character varying(128) DEFAULT NULL::character varying,
    "AUTHORIZER" character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public."DB_PRIVS" OWNER TO hive;

--
-- Name: DELEGATION_TOKENS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."DELEGATION_TOKENS" (
    "TOKEN_IDENT" character varying(767) NOT NULL,
    "TOKEN" character varying(767)
);


ALTER TABLE public."DELEGATION_TOKENS" OWNER TO hive;

--
-- Name: FUNCS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."FUNCS" (
    "FUNC_ID" bigint NOT NULL,
    "CLASS_NAME" character varying(4000),
    "CREATE_TIME" integer NOT NULL,
    "DB_ID" bigint,
    "FUNC_NAME" character varying(128),
    "FUNC_TYPE" integer NOT NULL,
    "OWNER_NAME" character varying(128),
    "OWNER_TYPE" character varying(10)
);


ALTER TABLE public."FUNCS" OWNER TO hive;

--
-- Name: FUNC_RU; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."FUNC_RU" (
    "FUNC_ID" bigint NOT NULL,
    "RESOURCE_TYPE" integer NOT NULL,
    "RESOURCE_URI" character varying(4000),
    "INTEGER_IDX" integer NOT NULL
);


ALTER TABLE public."FUNC_RU" OWNER TO hive;

--
-- Name: GLOBAL_PRIVS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."GLOBAL_PRIVS" (
    "USER_GRANT_ID" bigint NOT NULL,
    "CREATE_TIME" bigint NOT NULL,
    "GRANT_OPTION" smallint NOT NULL,
    "GRANTOR" character varying(128) DEFAULT NULL::character varying,
    "GRANTOR_TYPE" character varying(128) DEFAULT NULL::character varying,
    "PRINCIPAL_NAME" character varying(128) DEFAULT NULL::character varying,
    "PRINCIPAL_TYPE" character varying(128) DEFAULT NULL::character varying,
    "USER_PRIV" character varying(128) DEFAULT NULL::character varying,
    "AUTHORIZER" character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public."GLOBAL_PRIVS" OWNER TO hive;

--
-- Name: IDXS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."IDXS" (
    "INDEX_ID" bigint NOT NULL,
    "CREATE_TIME" bigint NOT NULL,
    "DEFERRED_REBUILD" boolean NOT NULL,
    "INDEX_HANDLER_CLASS" character varying(4000) DEFAULT NULL::character varying,
    "INDEX_NAME" character varying(128) DEFAULT NULL::character varying,
    "INDEX_TBL_ID" bigint,
    "LAST_ACCESS_TIME" bigint NOT NULL,
    "ORIG_TBL_ID" bigint,
    "SD_ID" bigint
);


ALTER TABLE public."IDXS" OWNER TO hive;

--
-- Name: INDEX_PARAMS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."INDEX_PARAMS" (
    "INDEX_ID" bigint NOT NULL,
    "PARAM_KEY" character varying(256) NOT NULL,
    "PARAM_VALUE" character varying(4000) DEFAULT NULL::character varying
);


ALTER TABLE public."INDEX_PARAMS" OWNER TO hive;

--
-- Name: I_SCHEMA; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."I_SCHEMA" (
    "SCHEMA_ID" bigint NOT NULL,
    "SCHEMA_TYPE" integer NOT NULL,
    "NAME" character varying(256),
    "DB_ID" bigint,
    "COMPATIBILITY" integer NOT NULL,
    "VALIDATION_LEVEL" integer NOT NULL,
    "CAN_EVOLVE" boolean NOT NULL,
    "SCHEMA_GROUP" character varying(256),
    "DESCRIPTION" character varying(4000)
);


ALTER TABLE public."I_SCHEMA" OWNER TO hive;

--
-- Name: KEY_CONSTRAINTS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."KEY_CONSTRAINTS" (
    "CHILD_CD_ID" bigint,
    "CHILD_INTEGER_IDX" bigint,
    "CHILD_TBL_ID" bigint,
    "PARENT_CD_ID" bigint,
    "PARENT_INTEGER_IDX" bigint NOT NULL,
    "PARENT_TBL_ID" bigint NOT NULL,
    "POSITION" bigint NOT NULL,
    "CONSTRAINT_NAME" character varying(400) NOT NULL,
    "CONSTRAINT_TYPE" smallint NOT NULL,
    "UPDATE_RULE" smallint,
    "DELETE_RULE" smallint,
    "ENABLE_VALIDATE_RELY" smallint NOT NULL,
    "DEFAULT_VALUE" character varying(400)
);


ALTER TABLE public."KEY_CONSTRAINTS" OWNER TO hive;

--
-- Name: MASTER_KEYS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."MASTER_KEYS" (
    "KEY_ID" integer NOT NULL,
    "MASTER_KEY" character varying(767)
);


ALTER TABLE public."MASTER_KEYS" OWNER TO hive;

--
-- Name: MASTER_KEYS_KEY_ID_seq; Type: SEQUENCE; Schema: public; Owner: hive
--

CREATE SEQUENCE public."MASTER_KEYS_KEY_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MASTER_KEYS_KEY_ID_seq" OWNER TO hive;

--
-- Name: MASTER_KEYS_KEY_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hive
--

ALTER SEQUENCE public."MASTER_KEYS_KEY_ID_seq" OWNED BY public."MASTER_KEYS"."KEY_ID";


--
-- Name: METASTORE_DB_PROPERTIES; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."METASTORE_DB_PROPERTIES" (
    "PROPERTY_KEY" character varying(255) NOT NULL,
    "PROPERTY_VALUE" character varying(1000) NOT NULL,
    "DESCRIPTION" character varying(1000)
);


ALTER TABLE public."METASTORE_DB_PROPERTIES" OWNER TO hive;

--
-- Name: MV_CREATION_METADATA; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."MV_CREATION_METADATA" (
    "MV_CREATION_METADATA_ID" bigint NOT NULL,
    "CAT_NAME" character varying(256) NOT NULL,
    "DB_NAME" character varying(128) NOT NULL,
    "TBL_NAME" character varying(256) NOT NULL,
    "TXN_LIST" text,
    "MATERIALIZATION_TIME" bigint NOT NULL
);


ALTER TABLE public."MV_CREATION_METADATA" OWNER TO hive;

--
-- Name: MV_TABLES_USED; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."MV_TABLES_USED" (
    "MV_CREATION_METADATA_ID" bigint NOT NULL,
    "TBL_ID" bigint NOT NULL
);


ALTER TABLE public."MV_TABLES_USED" OWNER TO hive;

--
-- Name: NOTIFICATION_LOG; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."NOTIFICATION_LOG" (
    "NL_ID" bigint NOT NULL,
    "EVENT_ID" bigint NOT NULL,
    "EVENT_TIME" integer NOT NULL,
    "EVENT_TYPE" character varying(32) NOT NULL,
    "CAT_NAME" character varying(256),
    "DB_NAME" character varying(128),
    "TBL_NAME" character varying(256),
    "MESSAGE" text,
    "MESSAGE_FORMAT" character varying(16)
);


ALTER TABLE public."NOTIFICATION_LOG" OWNER TO hive;

--
-- Name: NOTIFICATION_SEQUENCE; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."NOTIFICATION_SEQUENCE" (
    "NNI_ID" bigint NOT NULL,
    "NEXT_EVENT_ID" bigint NOT NULL
);


ALTER TABLE public."NOTIFICATION_SEQUENCE" OWNER TO hive;

--
-- Name: NUCLEUS_TABLES; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."NUCLEUS_TABLES" (
    "CLASS_NAME" character varying(128) NOT NULL,
    "TABLE_NAME" character varying(128) NOT NULL,
    "TYPE" character varying(4) NOT NULL,
    "OWNER" character varying(2) NOT NULL,
    "VERSION" character varying(20) NOT NULL,
    "INTERFACE_NAME" character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public."NUCLEUS_TABLES" OWNER TO hive;

--
-- Name: PARTITIONS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."PARTITIONS" (
    "PART_ID" bigint NOT NULL,
    "CREATE_TIME" bigint NOT NULL,
    "LAST_ACCESS_TIME" bigint NOT NULL,
    "PART_NAME" character varying(767) DEFAULT NULL::character varying,
    "SD_ID" bigint,
    "TBL_ID" bigint
);


ALTER TABLE public."PARTITIONS" OWNER TO hive;

--
-- Name: PARTITION_EVENTS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."PARTITION_EVENTS" (
    "PART_NAME_ID" bigint NOT NULL,
    "CAT_NAME" character varying(256),
    "DB_NAME" character varying(128),
    "EVENT_TIME" bigint NOT NULL,
    "EVENT_TYPE" integer NOT NULL,
    "PARTITION_NAME" character varying(767),
    "TBL_NAME" character varying(256)
);


ALTER TABLE public."PARTITION_EVENTS" OWNER TO hive;

--
-- Name: PARTITION_KEYS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."PARTITION_KEYS" (
    "TBL_ID" bigint NOT NULL,
    "PKEY_COMMENT" character varying(4000) DEFAULT NULL::character varying,
    "PKEY_NAME" character varying(128) NOT NULL,
    "PKEY_TYPE" character varying(767) NOT NULL,
    "INTEGER_IDX" bigint NOT NULL
);


ALTER TABLE public."PARTITION_KEYS" OWNER TO hive;

--
-- Name: PARTITION_KEY_VALS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."PARTITION_KEY_VALS" (
    "PART_ID" bigint NOT NULL,
    "PART_KEY_VAL" character varying(256) DEFAULT NULL::character varying,
    "INTEGER_IDX" bigint NOT NULL
);


ALTER TABLE public."PARTITION_KEY_VALS" OWNER TO hive;

--
-- Name: PARTITION_PARAMS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."PARTITION_PARAMS" (
    "PART_ID" bigint NOT NULL,
    "PARAM_KEY" character varying(256) NOT NULL,
    "PARAM_VALUE" character varying(4000) DEFAULT NULL::character varying
);


ALTER TABLE public."PARTITION_PARAMS" OWNER TO hive;

--
-- Name: PART_COL_PRIVS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."PART_COL_PRIVS" (
    "PART_COLUMN_GRANT_ID" bigint NOT NULL,
    "COLUMN_NAME" character varying(767) DEFAULT NULL::character varying,
    "CREATE_TIME" bigint NOT NULL,
    "GRANT_OPTION" smallint NOT NULL,
    "GRANTOR" character varying(128) DEFAULT NULL::character varying,
    "GRANTOR_TYPE" character varying(128) DEFAULT NULL::character varying,
    "PART_ID" bigint,
    "PRINCIPAL_NAME" character varying(128) DEFAULT NULL::character varying,
    "PRINCIPAL_TYPE" character varying(128) DEFAULT NULL::character varying,
    "PART_COL_PRIV" character varying(128) DEFAULT NULL::character varying,
    "AUTHORIZER" character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public."PART_COL_PRIVS" OWNER TO hive;

--
-- Name: PART_COL_STATS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."PART_COL_STATS" (
    "CS_ID" bigint NOT NULL,
    "CAT_NAME" character varying(256) DEFAULT NULL::character varying,
    "DB_NAME" character varying(128) DEFAULT NULL::character varying,
    "TABLE_NAME" character varying(256) DEFAULT NULL::character varying,
    "PARTITION_NAME" character varying(767) DEFAULT NULL::character varying,
    "COLUMN_NAME" character varying(767) DEFAULT NULL::character varying,
    "COLUMN_TYPE" character varying(128) DEFAULT NULL::character varying,
    "PART_ID" bigint NOT NULL,
    "LONG_LOW_VALUE" bigint,
    "LONG_HIGH_VALUE" bigint,
    "DOUBLE_LOW_VALUE" double precision,
    "DOUBLE_HIGH_VALUE" double precision,
    "BIG_DECIMAL_LOW_VALUE" character varying(4000) DEFAULT NULL::character varying,
    "BIG_DECIMAL_HIGH_VALUE" character varying(4000) DEFAULT NULL::character varying,
    "NUM_NULLS" bigint NOT NULL,
    "NUM_DISTINCTS" bigint,
    "BIT_VECTOR" bytea,
    "AVG_COL_LEN" double precision,
    "MAX_COL_LEN" bigint,
    "NUM_TRUES" bigint,
    "NUM_FALSES" bigint,
    "LAST_ANALYZED" bigint NOT NULL
);


ALTER TABLE public."PART_COL_STATS" OWNER TO hive;

--
-- Name: PART_PRIVS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."PART_PRIVS" (
    "PART_GRANT_ID" bigint NOT NULL,
    "CREATE_TIME" bigint NOT NULL,
    "GRANT_OPTION" smallint NOT NULL,
    "GRANTOR" character varying(128) DEFAULT NULL::character varying,
    "GRANTOR_TYPE" character varying(128) DEFAULT NULL::character varying,
    "PART_ID" bigint,
    "PRINCIPAL_NAME" character varying(128) DEFAULT NULL::character varying,
    "PRINCIPAL_TYPE" character varying(128) DEFAULT NULL::character varying,
    "PART_PRIV" character varying(128) DEFAULT NULL::character varying,
    "AUTHORIZER" character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public."PART_PRIVS" OWNER TO hive;

--
-- Name: ROLES; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."ROLES" (
    "ROLE_ID" bigint NOT NULL,
    "CREATE_TIME" bigint NOT NULL,
    "OWNER_NAME" character varying(128) DEFAULT NULL::character varying,
    "ROLE_NAME" character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public."ROLES" OWNER TO hive;

--
-- Name: ROLE_MAP; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."ROLE_MAP" (
    "ROLE_GRANT_ID" bigint NOT NULL,
    "ADD_TIME" bigint NOT NULL,
    "GRANT_OPTION" smallint NOT NULL,
    "GRANTOR" character varying(128) DEFAULT NULL::character varying,
    "GRANTOR_TYPE" character varying(128) DEFAULT NULL::character varying,
    "PRINCIPAL_NAME" character varying(128) DEFAULT NULL::character varying,
    "PRINCIPAL_TYPE" character varying(128) DEFAULT NULL::character varying,
    "ROLE_ID" bigint
);


ALTER TABLE public."ROLE_MAP" OWNER TO hive;

--
-- Name: SCHEMA_VERSION; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."SCHEMA_VERSION" (
    "SCHEMA_VERSION_ID" bigint NOT NULL,
    "SCHEMA_ID" bigint,
    "VERSION" integer NOT NULL,
    "CREATED_AT" bigint NOT NULL,
    "CD_ID" bigint,
    "STATE" integer NOT NULL,
    "DESCRIPTION" character varying(4000),
    "SCHEMA_TEXT" text,
    "FINGERPRINT" character varying(256),
    "SCHEMA_VERSION_NAME" character varying(256),
    "SERDE_ID" bigint
);


ALTER TABLE public."SCHEMA_VERSION" OWNER TO hive;

--
-- Name: SDS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."SDS" (
    "SD_ID" bigint NOT NULL,
    "INPUT_FORMAT" character varying(4000) DEFAULT NULL::character varying,
    "IS_COMPRESSED" boolean NOT NULL,
    "LOCATION" character varying(4000) DEFAULT NULL::character varying,
    "NUM_BUCKETS" bigint NOT NULL,
    "OUTPUT_FORMAT" character varying(4000) DEFAULT NULL::character varying,
    "SERDE_ID" bigint,
    "CD_ID" bigint,
    "IS_STOREDASSUBDIRECTORIES" boolean NOT NULL
);


ALTER TABLE public."SDS" OWNER TO hive;

--
-- Name: SD_PARAMS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."SD_PARAMS" (
    "SD_ID" bigint NOT NULL,
    "PARAM_KEY" character varying(256) NOT NULL,
    "PARAM_VALUE" text
);


ALTER TABLE public."SD_PARAMS" OWNER TO hive;

--
-- Name: SEQUENCE_TABLE; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."SEQUENCE_TABLE" (
    "SEQUENCE_NAME" character varying(255) NOT NULL,
    "NEXT_VAL" bigint NOT NULL
);


ALTER TABLE public."SEQUENCE_TABLE" OWNER TO hive;

--
-- Name: SERDES; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."SERDES" (
    "SERDE_ID" bigint NOT NULL,
    "NAME" character varying(128) DEFAULT NULL::character varying,
    "SLIB" character varying(4000) DEFAULT NULL::character varying,
    "DESCRIPTION" character varying(4000),
    "SERIALIZER_CLASS" character varying(4000),
    "DESERIALIZER_CLASS" character varying(4000),
    "SERDE_TYPE" integer
);


ALTER TABLE public."SERDES" OWNER TO hive;

--
-- Name: SERDE_PARAMS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."SERDE_PARAMS" (
    "SERDE_ID" bigint NOT NULL,
    "PARAM_KEY" character varying(256) NOT NULL,
    "PARAM_VALUE" text
);


ALTER TABLE public."SERDE_PARAMS" OWNER TO hive;

--
-- Name: SKEWED_COL_NAMES; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."SKEWED_COL_NAMES" (
    "SD_ID" bigint NOT NULL,
    "SKEWED_COL_NAME" character varying(256) DEFAULT NULL::character varying,
    "INTEGER_IDX" bigint NOT NULL
);


ALTER TABLE public."SKEWED_COL_NAMES" OWNER TO hive;

--
-- Name: SKEWED_COL_VALUE_LOC_MAP; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."SKEWED_COL_VALUE_LOC_MAP" (
    "SD_ID" bigint NOT NULL,
    "STRING_LIST_ID_KID" bigint NOT NULL,
    "LOCATION" character varying(4000) DEFAULT NULL::character varying
);


ALTER TABLE public."SKEWED_COL_VALUE_LOC_MAP" OWNER TO hive;

--
-- Name: SKEWED_STRING_LIST; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."SKEWED_STRING_LIST" (
    "STRING_LIST_ID" bigint NOT NULL
);


ALTER TABLE public."SKEWED_STRING_LIST" OWNER TO hive;

--
-- Name: SKEWED_STRING_LIST_VALUES; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."SKEWED_STRING_LIST_VALUES" (
    "STRING_LIST_ID" bigint NOT NULL,
    "STRING_LIST_VALUE" character varying(256) DEFAULT NULL::character varying,
    "INTEGER_IDX" bigint NOT NULL
);


ALTER TABLE public."SKEWED_STRING_LIST_VALUES" OWNER TO hive;

--
-- Name: SKEWED_VALUES; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."SKEWED_VALUES" (
    "SD_ID_OID" bigint NOT NULL,
    "STRING_LIST_ID_EID" bigint NOT NULL,
    "INTEGER_IDX" bigint NOT NULL
);


ALTER TABLE public."SKEWED_VALUES" OWNER TO hive;

--
-- Name: SORT_COLS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."SORT_COLS" (
    "SD_ID" bigint NOT NULL,
    "COLUMN_NAME" character varying(767) DEFAULT NULL::character varying,
    "ORDER" bigint NOT NULL,
    "INTEGER_IDX" bigint NOT NULL
);


ALTER TABLE public."SORT_COLS" OWNER TO hive;

--
-- Name: TABLE_PARAMS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."TABLE_PARAMS" (
    "TBL_ID" bigint NOT NULL,
    "PARAM_KEY" character varying(256) NOT NULL,
    "PARAM_VALUE" text
);


ALTER TABLE public."TABLE_PARAMS" OWNER TO hive;

--
-- Name: TAB_COL_STATS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."TAB_COL_STATS" (
    "CS_ID" bigint NOT NULL,
    "CAT_NAME" character varying(256) DEFAULT NULL::character varying,
    "DB_NAME" character varying(128) DEFAULT NULL::character varying,
    "TABLE_NAME" character varying(256) DEFAULT NULL::character varying,
    "COLUMN_NAME" character varying(767) DEFAULT NULL::character varying,
    "COLUMN_TYPE" character varying(128) DEFAULT NULL::character varying,
    "TBL_ID" bigint NOT NULL,
    "LONG_LOW_VALUE" bigint,
    "LONG_HIGH_VALUE" bigint,
    "DOUBLE_LOW_VALUE" double precision,
    "DOUBLE_HIGH_VALUE" double precision,
    "BIG_DECIMAL_LOW_VALUE" character varying(4000) DEFAULT NULL::character varying,
    "BIG_DECIMAL_HIGH_VALUE" character varying(4000) DEFAULT NULL::character varying,
    "NUM_NULLS" bigint NOT NULL,
    "NUM_DISTINCTS" bigint,
    "BIT_VECTOR" bytea,
    "AVG_COL_LEN" double precision,
    "MAX_COL_LEN" bigint,
    "NUM_TRUES" bigint,
    "NUM_FALSES" bigint,
    "LAST_ANALYZED" bigint NOT NULL
);


ALTER TABLE public."TAB_COL_STATS" OWNER TO hive;

--
-- Name: TBLS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."TBLS" (
    "TBL_ID" bigint NOT NULL,
    "CREATE_TIME" bigint NOT NULL,
    "DB_ID" bigint,
    "LAST_ACCESS_TIME" bigint NOT NULL,
    "OWNER" character varying(767) DEFAULT NULL::character varying,
    "OWNER_TYPE" character varying(10) DEFAULT NULL::character varying,
    "RETENTION" bigint NOT NULL,
    "SD_ID" bigint,
    "TBL_NAME" character varying(256) DEFAULT NULL::character varying,
    "TBL_TYPE" character varying(128) DEFAULT NULL::character varying,
    "VIEW_EXPANDED_TEXT" text,
    "VIEW_ORIGINAL_TEXT" text,
    "IS_REWRITE_ENABLED" boolean DEFAULT false NOT NULL
);


ALTER TABLE public."TBLS" OWNER TO hive;

--
-- Name: TBL_COL_PRIVS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."TBL_COL_PRIVS" (
    "TBL_COLUMN_GRANT_ID" bigint NOT NULL,
    "COLUMN_NAME" character varying(767) DEFAULT NULL::character varying,
    "CREATE_TIME" bigint NOT NULL,
    "GRANT_OPTION" smallint NOT NULL,
    "GRANTOR" character varying(128) DEFAULT NULL::character varying,
    "GRANTOR_TYPE" character varying(128) DEFAULT NULL::character varying,
    "PRINCIPAL_NAME" character varying(128) DEFAULT NULL::character varying,
    "PRINCIPAL_TYPE" character varying(128) DEFAULT NULL::character varying,
    "TBL_COL_PRIV" character varying(128) DEFAULT NULL::character varying,
    "TBL_ID" bigint,
    "AUTHORIZER" character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public."TBL_COL_PRIVS" OWNER TO hive;

--
-- Name: TBL_PRIVS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."TBL_PRIVS" (
    "TBL_GRANT_ID" bigint NOT NULL,
    "CREATE_TIME" bigint NOT NULL,
    "GRANT_OPTION" smallint NOT NULL,
    "GRANTOR" character varying(128) DEFAULT NULL::character varying,
    "GRANTOR_TYPE" character varying(128) DEFAULT NULL::character varying,
    "PRINCIPAL_NAME" character varying(128) DEFAULT NULL::character varying,
    "PRINCIPAL_TYPE" character varying(128) DEFAULT NULL::character varying,
    "TBL_PRIV" character varying(128) DEFAULT NULL::character varying,
    "TBL_ID" bigint,
    "AUTHORIZER" character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public."TBL_PRIVS" OWNER TO hive;

--
-- Name: TYPES; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."TYPES" (
    "TYPES_ID" bigint NOT NULL,
    "TYPE_NAME" character varying(128) DEFAULT NULL::character varying,
    "TYPE1" character varying(767) DEFAULT NULL::character varying,
    "TYPE2" character varying(767) DEFAULT NULL::character varying
);


ALTER TABLE public."TYPES" OWNER TO hive;

--
-- Name: TYPE_FIELDS; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."TYPE_FIELDS" (
    "TYPE_NAME" bigint NOT NULL,
    "COMMENT" character varying(256) DEFAULT NULL::character varying,
    "FIELD_NAME" character varying(128) NOT NULL,
    "FIELD_TYPE" character varying(767) NOT NULL,
    "INTEGER_IDX" bigint NOT NULL
);


ALTER TABLE public."TYPE_FIELDS" OWNER TO hive;

--
-- Name: VERSION; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."VERSION" (
    "VER_ID" bigint NOT NULL,
    "SCHEMA_VERSION" character varying(127) NOT NULL,
    "VERSION_COMMENT" character varying(255) NOT NULL
);


ALTER TABLE public."VERSION" OWNER TO hive;

--
-- Name: WM_MAPPING; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."WM_MAPPING" (
    "MAPPING_ID" bigint NOT NULL,
    "RP_ID" bigint NOT NULL,
    "ENTITY_TYPE" character varying(128) NOT NULL,
    "ENTITY_NAME" character varying(128) NOT NULL,
    "POOL_ID" bigint,
    "ORDERING" integer
);


ALTER TABLE public."WM_MAPPING" OWNER TO hive;

--
-- Name: WM_POOL; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."WM_POOL" (
    "POOL_ID" bigint NOT NULL,
    "RP_ID" bigint NOT NULL,
    "PATH" character varying(1024) NOT NULL,
    "ALLOC_FRACTION" double precision,
    "QUERY_PARALLELISM" integer,
    "SCHEDULING_POLICY" character varying(1024)
);


ALTER TABLE public."WM_POOL" OWNER TO hive;

--
-- Name: WM_POOL_TO_TRIGGER; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."WM_POOL_TO_TRIGGER" (
    "POOL_ID" bigint NOT NULL,
    "TRIGGER_ID" bigint NOT NULL
);


ALTER TABLE public."WM_POOL_TO_TRIGGER" OWNER TO hive;

--
-- Name: WM_RESOURCEPLAN; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."WM_RESOURCEPLAN" (
    "RP_ID" bigint NOT NULL,
    "NAME" character varying(128) NOT NULL,
    "QUERY_PARALLELISM" integer,
    "STATUS" character varying(20) NOT NULL,
    "DEFAULT_POOL_ID" bigint
);


ALTER TABLE public."WM_RESOURCEPLAN" OWNER TO hive;

--
-- Name: WM_TRIGGER; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public."WM_TRIGGER" (
    "TRIGGER_ID" bigint NOT NULL,
    "RP_ID" bigint NOT NULL,
    "NAME" character varying(128) NOT NULL,
    "TRIGGER_EXPRESSION" character varying(1024) DEFAULT NULL::character varying,
    "ACTION_EXPRESSION" character varying(1024) DEFAULT NULL::character varying,
    "IS_IN_UNMANAGED" smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public."WM_TRIGGER" OWNER TO hive;

--
-- Name: aux_table; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public.aux_table (
    mt_key1 character varying(128) NOT NULL,
    mt_key2 bigint NOT NULL,
    mt_comment character varying(255)
);


ALTER TABLE public.aux_table OWNER TO hive;

--
-- Name: compaction_queue; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public.compaction_queue (
    cq_id bigint NOT NULL,
    cq_database character varying(128) NOT NULL,
    cq_table character varying(128) NOT NULL,
    cq_partition character varying(767),
    cq_state character(1) NOT NULL,
    cq_type character(1) NOT NULL,
    cq_tblproperties character varying(2048),
    cq_worker_id character varying(128),
    cq_start bigint,
    cq_run_as character varying(128),
    cq_highest_write_id bigint,
    cq_meta_info bytea,
    cq_hadoop_job_id character varying(32)
);


ALTER TABLE public.compaction_queue OWNER TO hive;

--
-- Name: completed_compactions; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public.completed_compactions (
    cc_id bigint NOT NULL,
    cc_database character varying(128) NOT NULL,
    cc_table character varying(128) NOT NULL,
    cc_partition character varying(767),
    cc_state character(1) NOT NULL,
    cc_type character(1) NOT NULL,
    cc_tblproperties character varying(2048),
    cc_worker_id character varying(128),
    cc_start bigint,
    cc_end bigint,
    cc_run_as character varying(128),
    cc_highest_write_id bigint,
    cc_meta_info bytea,
    cc_hadoop_job_id character varying(32)
);


ALTER TABLE public.completed_compactions OWNER TO hive;

--
-- Name: completed_txn_components; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public.completed_txn_components (
    ctc_txnid bigint NOT NULL,
    ctc_database character varying(128) NOT NULL,
    ctc_table character varying(256),
    ctc_partition character varying(767),
    ctc_timestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ctc_writeid bigint,
    ctc_update_delete character(1) NOT NULL
);


ALTER TABLE public.completed_txn_components OWNER TO hive;

--
-- Name: hive_locks; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public.hive_locks (
    hl_lock_ext_id bigint NOT NULL,
    hl_lock_int_id bigint NOT NULL,
    hl_txnid bigint NOT NULL,
    hl_db character varying(128) NOT NULL,
    hl_table character varying(128),
    hl_partition character varying(767) DEFAULT NULL::character varying,
    hl_lock_state character(1) NOT NULL,
    hl_lock_type character(1) NOT NULL,
    hl_last_heartbeat bigint NOT NULL,
    hl_acquired_at bigint,
    hl_user character varying(128) NOT NULL,
    hl_host character varying(128) NOT NULL,
    hl_heartbeat_count integer,
    hl_agent_info character varying(128),
    hl_blockedby_ext_id bigint,
    hl_blockedby_int_id bigint
);


ALTER TABLE public.hive_locks OWNER TO hive;

--
-- Name: materialization_rebuild_locks; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public.materialization_rebuild_locks (
    mrl_txn_id bigint NOT NULL,
    mrl_db_name character varying(128) NOT NULL,
    mrl_tbl_name character varying(256) NOT NULL,
    mrl_last_heartbeat bigint NOT NULL
);


ALTER TABLE public.materialization_rebuild_locks OWNER TO hive;

--
-- Name: min_history_level; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public.min_history_level (
    mhl_txnid bigint NOT NULL,
    mhl_min_open_txnid bigint NOT NULL
);


ALTER TABLE public.min_history_level OWNER TO hive;

--
-- Name: next_compaction_queue_id; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public.next_compaction_queue_id (
    ncq_next bigint NOT NULL
);


ALTER TABLE public.next_compaction_queue_id OWNER TO hive;

--
-- Name: next_lock_id; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public.next_lock_id (
    nl_next bigint NOT NULL
);


ALTER TABLE public.next_lock_id OWNER TO hive;

--
-- Name: next_txn_id; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public.next_txn_id (
    ntxn_next bigint NOT NULL
);


ALTER TABLE public.next_txn_id OWNER TO hive;

--
-- Name: next_write_id; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public.next_write_id (
    nwi_database character varying(128) NOT NULL,
    nwi_table character varying(256) NOT NULL,
    nwi_next bigint NOT NULL
);


ALTER TABLE public.next_write_id OWNER TO hive;

--
-- Name: repl_txn_map; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public.repl_txn_map (
    rtm_repl_policy character varying(256) NOT NULL,
    rtm_src_txn_id bigint NOT NULL,
    rtm_target_txn_id bigint NOT NULL
);


ALTER TABLE public.repl_txn_map OWNER TO hive;

--
-- Name: runtime_stats; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public.runtime_stats (
    rs_id bigint NOT NULL,
    create_time bigint NOT NULL,
    weight bigint NOT NULL,
    payload bytea
);


ALTER TABLE public.runtime_stats OWNER TO hive;

--
-- Name: txn_components; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public.txn_components (
    tc_txnid bigint NOT NULL,
    tc_database character varying(128) NOT NULL,
    tc_table character varying(128),
    tc_partition character varying(767) DEFAULT NULL::character varying,
    tc_operation_type character(1) NOT NULL,
    tc_writeid bigint
);


ALTER TABLE public.txn_components OWNER TO hive;

--
-- Name: txn_to_write_id; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public.txn_to_write_id (
    t2w_txnid bigint NOT NULL,
    t2w_database character varying(128) NOT NULL,
    t2w_table character varying(256) NOT NULL,
    t2w_writeid bigint NOT NULL
);


ALTER TABLE public.txn_to_write_id OWNER TO hive;

--
-- Name: txns; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public.txns (
    txn_id bigint NOT NULL,
    txn_state character(1) NOT NULL,
    txn_started bigint NOT NULL,
    txn_last_heartbeat bigint NOT NULL,
    txn_user character varying(128) NOT NULL,
    txn_host character varying(128) NOT NULL,
    txn_agent_info character varying(128),
    txn_meta_info character varying(128),
    txn_heartbeat_count integer,
    txn_type integer
);


ALTER TABLE public.txns OWNER TO hive;

--
-- Name: write_set; Type: TABLE; Schema: public; Owner: hive
--

CREATE TABLE public.write_set (
    ws_database character varying(128) NOT NULL,
    ws_table character varying(128) NOT NULL,
    ws_partition character varying(767),
    ws_txnid bigint NOT NULL,
    ws_commit_id bigint NOT NULL,
    ws_operation_type character(1) NOT NULL
);


ALTER TABLE public.write_set OWNER TO hive;

--
-- Name: MASTER_KEYS KEY_ID; Type: DEFAULT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."MASTER_KEYS" ALTER COLUMN "KEY_ID" SET DEFAULT nextval('public."MASTER_KEYS_KEY_ID_seq"'::regclass);


--
-- Data for Name: BUCKETING_COLS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."BUCKETING_COLS" ("SD_ID", "BUCKET_COL_NAME", "INTEGER_IDX") FROM stdin;
\.


--
-- Data for Name: CDS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."CDS" ("CD_ID") FROM stdin;
\.


--
-- Data for Name: COLUMNS_V2; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."COLUMNS_V2" ("CD_ID", "COMMENT", "COLUMN_NAME", "TYPE_NAME", "INTEGER_IDX") FROM stdin;
\.


--
-- Data for Name: CTLGS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."CTLGS" ("CTLG_ID", "NAME", "DESC", "LOCATION_URI") FROM stdin;
1	hive	Default catalog for Hive	TBD
\.


--
-- Data for Name: DATABASE_PARAMS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."DATABASE_PARAMS" ("DB_ID", "PARAM_KEY", "PARAM_VALUE") FROM stdin;
\.


--
-- Data for Name: DBS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."DBS" ("DB_ID", "DESC", "DB_LOCATION_URI", "NAME", "OWNER_NAME", "OWNER_TYPE", "CTLG_NAME") FROM stdin;
\.


--
-- Data for Name: DB_PRIVS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."DB_PRIVS" ("DB_GRANT_ID", "CREATE_TIME", "DB_ID", "GRANT_OPTION", "GRANTOR", "GRANTOR_TYPE", "PRINCIPAL_NAME", "PRINCIPAL_TYPE", "DB_PRIV", "AUTHORIZER") FROM stdin;
\.


--
-- Data for Name: DELEGATION_TOKENS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."DELEGATION_TOKENS" ("TOKEN_IDENT", "TOKEN") FROM stdin;
\.


--
-- Data for Name: FUNCS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."FUNCS" ("FUNC_ID", "CLASS_NAME", "CREATE_TIME", "DB_ID", "FUNC_NAME", "FUNC_TYPE", "OWNER_NAME", "OWNER_TYPE") FROM stdin;
\.


--
-- Data for Name: FUNC_RU; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."FUNC_RU" ("FUNC_ID", "RESOURCE_TYPE", "RESOURCE_URI", "INTEGER_IDX") FROM stdin;
\.


--
-- Data for Name: GLOBAL_PRIVS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."GLOBAL_PRIVS" ("USER_GRANT_ID", "CREATE_TIME", "GRANT_OPTION", "GRANTOR", "GRANTOR_TYPE", "PRINCIPAL_NAME", "PRINCIPAL_TYPE", "USER_PRIV", "AUTHORIZER") FROM stdin;
\.


--
-- Data for Name: IDXS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."IDXS" ("INDEX_ID", "CREATE_TIME", "DEFERRED_REBUILD", "INDEX_HANDLER_CLASS", "INDEX_NAME", "INDEX_TBL_ID", "LAST_ACCESS_TIME", "ORIG_TBL_ID", "SD_ID") FROM stdin;
\.


--
-- Data for Name: INDEX_PARAMS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."INDEX_PARAMS" ("INDEX_ID", "PARAM_KEY", "PARAM_VALUE") FROM stdin;
\.


--
-- Data for Name: I_SCHEMA; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."I_SCHEMA" ("SCHEMA_ID", "SCHEMA_TYPE", "NAME", "DB_ID", "COMPATIBILITY", "VALIDATION_LEVEL", "CAN_EVOLVE", "SCHEMA_GROUP", "DESCRIPTION") FROM stdin;
\.


--
-- Data for Name: KEY_CONSTRAINTS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."KEY_CONSTRAINTS" ("CHILD_CD_ID", "CHILD_INTEGER_IDX", "CHILD_TBL_ID", "PARENT_CD_ID", "PARENT_INTEGER_IDX", "PARENT_TBL_ID", "POSITION", "CONSTRAINT_NAME", "CONSTRAINT_TYPE", "UPDATE_RULE", "DELETE_RULE", "ENABLE_VALIDATE_RELY", "DEFAULT_VALUE") FROM stdin;
\.


--
-- Data for Name: MASTER_KEYS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."MASTER_KEYS" ("KEY_ID", "MASTER_KEY") FROM stdin;
\.


--
-- Data for Name: METASTORE_DB_PROPERTIES; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."METASTORE_DB_PROPERTIES" ("PROPERTY_KEY", "PROPERTY_VALUE", "DESCRIPTION") FROM stdin;
\.


--
-- Data for Name: MV_CREATION_METADATA; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."MV_CREATION_METADATA" ("MV_CREATION_METADATA_ID", "CAT_NAME", "DB_NAME", "TBL_NAME", "TXN_LIST", "MATERIALIZATION_TIME") FROM stdin;
\.


--
-- Data for Name: MV_TABLES_USED; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."MV_TABLES_USED" ("MV_CREATION_METADATA_ID", "TBL_ID") FROM stdin;
\.


--
-- Data for Name: NOTIFICATION_LOG; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."NOTIFICATION_LOG" ("NL_ID", "EVENT_ID", "EVENT_TIME", "EVENT_TYPE", "CAT_NAME", "DB_NAME", "TBL_NAME", "MESSAGE", "MESSAGE_FORMAT") FROM stdin;
\.


--
-- Data for Name: NOTIFICATION_SEQUENCE; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."NOTIFICATION_SEQUENCE" ("NNI_ID", "NEXT_EVENT_ID") FROM stdin;
1	1
\.


--
-- Data for Name: NUCLEUS_TABLES; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."NUCLEUS_TABLES" ("CLASS_NAME", "TABLE_NAME", "TYPE", "OWNER", "VERSION", "INTERFACE_NAME") FROM stdin;
\.


--
-- Data for Name: PARTITIONS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."PARTITIONS" ("PART_ID", "CREATE_TIME", "LAST_ACCESS_TIME", "PART_NAME", "SD_ID", "TBL_ID") FROM stdin;
\.


--
-- Data for Name: PARTITION_EVENTS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."PARTITION_EVENTS" ("PART_NAME_ID", "CAT_NAME", "DB_NAME", "EVENT_TIME", "EVENT_TYPE", "PARTITION_NAME", "TBL_NAME") FROM stdin;
\.


--
-- Data for Name: PARTITION_KEYS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."PARTITION_KEYS" ("TBL_ID", "PKEY_COMMENT", "PKEY_NAME", "PKEY_TYPE", "INTEGER_IDX") FROM stdin;
\.


--
-- Data for Name: PARTITION_KEY_VALS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."PARTITION_KEY_VALS" ("PART_ID", "PART_KEY_VAL", "INTEGER_IDX") FROM stdin;
\.


--
-- Data for Name: PARTITION_PARAMS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."PARTITION_PARAMS" ("PART_ID", "PARAM_KEY", "PARAM_VALUE") FROM stdin;
\.


--
-- Data for Name: PART_COL_PRIVS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."PART_COL_PRIVS" ("PART_COLUMN_GRANT_ID", "COLUMN_NAME", "CREATE_TIME", "GRANT_OPTION", "GRANTOR", "GRANTOR_TYPE", "PART_ID", "PRINCIPAL_NAME", "PRINCIPAL_TYPE", "PART_COL_PRIV", "AUTHORIZER") FROM stdin;
\.


--
-- Data for Name: PART_COL_STATS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."PART_COL_STATS" ("CS_ID", "CAT_NAME", "DB_NAME", "TABLE_NAME", "PARTITION_NAME", "COLUMN_NAME", "COLUMN_TYPE", "PART_ID", "LONG_LOW_VALUE", "LONG_HIGH_VALUE", "DOUBLE_LOW_VALUE", "DOUBLE_HIGH_VALUE", "BIG_DECIMAL_LOW_VALUE", "BIG_DECIMAL_HIGH_VALUE", "NUM_NULLS", "NUM_DISTINCTS", "BIT_VECTOR", "AVG_COL_LEN", "MAX_COL_LEN", "NUM_TRUES", "NUM_FALSES", "LAST_ANALYZED") FROM stdin;
\.


--
-- Data for Name: PART_PRIVS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."PART_PRIVS" ("PART_GRANT_ID", "CREATE_TIME", "GRANT_OPTION", "GRANTOR", "GRANTOR_TYPE", "PART_ID", "PRINCIPAL_NAME", "PRINCIPAL_TYPE", "PART_PRIV", "AUTHORIZER") FROM stdin;
\.


--
-- Data for Name: ROLES; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."ROLES" ("ROLE_ID", "CREATE_TIME", "OWNER_NAME", "ROLE_NAME") FROM stdin;
\.


--
-- Data for Name: ROLE_MAP; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."ROLE_MAP" ("ROLE_GRANT_ID", "ADD_TIME", "GRANT_OPTION", "GRANTOR", "GRANTOR_TYPE", "PRINCIPAL_NAME", "PRINCIPAL_TYPE", "ROLE_ID") FROM stdin;
\.


--
-- Data for Name: SCHEMA_VERSION; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."SCHEMA_VERSION" ("SCHEMA_VERSION_ID", "SCHEMA_ID", "VERSION", "CREATED_AT", "CD_ID", "STATE", "DESCRIPTION", "SCHEMA_TEXT", "FINGERPRINT", "SCHEMA_VERSION_NAME", "SERDE_ID") FROM stdin;
\.


--
-- Data for Name: SDS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."SDS" ("SD_ID", "INPUT_FORMAT", "IS_COMPRESSED", "LOCATION", "NUM_BUCKETS", "OUTPUT_FORMAT", "SERDE_ID", "CD_ID", "IS_STOREDASSUBDIRECTORIES") FROM stdin;
\.


--
-- Data for Name: SD_PARAMS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."SD_PARAMS" ("SD_ID", "PARAM_KEY", "PARAM_VALUE") FROM stdin;
\.


--
-- Data for Name: SEQUENCE_TABLE; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."SEQUENCE_TABLE" ("SEQUENCE_NAME", "NEXT_VAL") FROM stdin;
org.apache.hadoop.hive.metastore.model.MNotificationLog	1
\.


--
-- Data for Name: SERDES; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."SERDES" ("SERDE_ID", "NAME", "SLIB", "DESCRIPTION", "SERIALIZER_CLASS", "DESERIALIZER_CLASS", "SERDE_TYPE") FROM stdin;
\.


--
-- Data for Name: SERDE_PARAMS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."SERDE_PARAMS" ("SERDE_ID", "PARAM_KEY", "PARAM_VALUE") FROM stdin;
\.


--
-- Data for Name: SKEWED_COL_NAMES; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."SKEWED_COL_NAMES" ("SD_ID", "SKEWED_COL_NAME", "INTEGER_IDX") FROM stdin;
\.


--
-- Data for Name: SKEWED_COL_VALUE_LOC_MAP; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."SKEWED_COL_VALUE_LOC_MAP" ("SD_ID", "STRING_LIST_ID_KID", "LOCATION") FROM stdin;
\.


--
-- Data for Name: SKEWED_STRING_LIST; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."SKEWED_STRING_LIST" ("STRING_LIST_ID") FROM stdin;
\.


--
-- Data for Name: SKEWED_STRING_LIST_VALUES; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."SKEWED_STRING_LIST_VALUES" ("STRING_LIST_ID", "STRING_LIST_VALUE", "INTEGER_IDX") FROM stdin;
\.


--
-- Data for Name: SKEWED_VALUES; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."SKEWED_VALUES" ("SD_ID_OID", "STRING_LIST_ID_EID", "INTEGER_IDX") FROM stdin;
\.


--
-- Data for Name: SORT_COLS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."SORT_COLS" ("SD_ID", "COLUMN_NAME", "ORDER", "INTEGER_IDX") FROM stdin;
\.


--
-- Data for Name: TABLE_PARAMS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."TABLE_PARAMS" ("TBL_ID", "PARAM_KEY", "PARAM_VALUE") FROM stdin;
\.


--
-- Data for Name: TAB_COL_STATS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."TAB_COL_STATS" ("CS_ID", "CAT_NAME", "DB_NAME", "TABLE_NAME", "COLUMN_NAME", "COLUMN_TYPE", "TBL_ID", "LONG_LOW_VALUE", "LONG_HIGH_VALUE", "DOUBLE_LOW_VALUE", "DOUBLE_HIGH_VALUE", "BIG_DECIMAL_LOW_VALUE", "BIG_DECIMAL_HIGH_VALUE", "NUM_NULLS", "NUM_DISTINCTS", "BIT_VECTOR", "AVG_COL_LEN", "MAX_COL_LEN", "NUM_TRUES", "NUM_FALSES", "LAST_ANALYZED") FROM stdin;
\.


--
-- Data for Name: TBLS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."TBLS" ("TBL_ID", "CREATE_TIME", "DB_ID", "LAST_ACCESS_TIME", "OWNER", "OWNER_TYPE", "RETENTION", "SD_ID", "TBL_NAME", "TBL_TYPE", "VIEW_EXPANDED_TEXT", "VIEW_ORIGINAL_TEXT", "IS_REWRITE_ENABLED") FROM stdin;
\.


--
-- Data for Name: TBL_COL_PRIVS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."TBL_COL_PRIVS" ("TBL_COLUMN_GRANT_ID", "COLUMN_NAME", "CREATE_TIME", "GRANT_OPTION", "GRANTOR", "GRANTOR_TYPE", "PRINCIPAL_NAME", "PRINCIPAL_TYPE", "TBL_COL_PRIV", "TBL_ID", "AUTHORIZER") FROM stdin;
\.


--
-- Data for Name: TBL_PRIVS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."TBL_PRIVS" ("TBL_GRANT_ID", "CREATE_TIME", "GRANT_OPTION", "GRANTOR", "GRANTOR_TYPE", "PRINCIPAL_NAME", "PRINCIPAL_TYPE", "TBL_PRIV", "TBL_ID", "AUTHORIZER") FROM stdin;
\.


--
-- Data for Name: TYPES; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."TYPES" ("TYPES_ID", "TYPE_NAME", "TYPE1", "TYPE2") FROM stdin;
\.


--
-- Data for Name: TYPE_FIELDS; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."TYPE_FIELDS" ("TYPE_NAME", "COMMENT", "FIELD_NAME", "FIELD_TYPE", "INTEGER_IDX") FROM stdin;
\.


--
-- Data for Name: VERSION; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."VERSION" ("VER_ID", "SCHEMA_VERSION", "VERSION_COMMENT") FROM stdin;
1	3.1.0	Hive release version 3.1.0
\.


--
-- Data for Name: WM_MAPPING; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."WM_MAPPING" ("MAPPING_ID", "RP_ID", "ENTITY_TYPE", "ENTITY_NAME", "POOL_ID", "ORDERING") FROM stdin;
\.


--
-- Data for Name: WM_POOL; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."WM_POOL" ("POOL_ID", "RP_ID", "PATH", "ALLOC_FRACTION", "QUERY_PARALLELISM", "SCHEDULING_POLICY") FROM stdin;
\.


--
-- Data for Name: WM_POOL_TO_TRIGGER; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."WM_POOL_TO_TRIGGER" ("POOL_ID", "TRIGGER_ID") FROM stdin;
\.


--
-- Data for Name: WM_RESOURCEPLAN; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."WM_RESOURCEPLAN" ("RP_ID", "NAME", "QUERY_PARALLELISM", "STATUS", "DEFAULT_POOL_ID") FROM stdin;
\.


--
-- Data for Name: WM_TRIGGER; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public."WM_TRIGGER" ("TRIGGER_ID", "RP_ID", "NAME", "TRIGGER_EXPRESSION", "ACTION_EXPRESSION", "IS_IN_UNMANAGED") FROM stdin;
\.


--
-- Data for Name: aux_table; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public.aux_table (mt_key1, mt_key2, mt_comment) FROM stdin;
\.


--
-- Data for Name: compaction_queue; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public.compaction_queue (cq_id, cq_database, cq_table, cq_partition, cq_state, cq_type, cq_tblproperties, cq_worker_id, cq_start, cq_run_as, cq_highest_write_id, cq_meta_info, cq_hadoop_job_id) FROM stdin;
\.


--
-- Data for Name: completed_compactions; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public.completed_compactions (cc_id, cc_database, cc_table, cc_partition, cc_state, cc_type, cc_tblproperties, cc_worker_id, cc_start, cc_end, cc_run_as, cc_highest_write_id, cc_meta_info, cc_hadoop_job_id) FROM stdin;
\.


--
-- Data for Name: completed_txn_components; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public.completed_txn_components (ctc_txnid, ctc_database, ctc_table, ctc_partition, ctc_timestamp, ctc_writeid, ctc_update_delete) FROM stdin;
\.


--
-- Data for Name: hive_locks; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public.hive_locks (hl_lock_ext_id, hl_lock_int_id, hl_txnid, hl_db, hl_table, hl_partition, hl_lock_state, hl_lock_type, hl_last_heartbeat, hl_acquired_at, hl_user, hl_host, hl_heartbeat_count, hl_agent_info, hl_blockedby_ext_id, hl_blockedby_int_id) FROM stdin;
\.


--
-- Data for Name: materialization_rebuild_locks; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public.materialization_rebuild_locks (mrl_txn_id, mrl_db_name, mrl_tbl_name, mrl_last_heartbeat) FROM stdin;
\.


--
-- Data for Name: min_history_level; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public.min_history_level (mhl_txnid, mhl_min_open_txnid) FROM stdin;
\.


--
-- Data for Name: next_compaction_queue_id; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public.next_compaction_queue_id (ncq_next) FROM stdin;
1
\.


--
-- Data for Name: next_lock_id; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public.next_lock_id (nl_next) FROM stdin;
1
\.


--
-- Data for Name: next_txn_id; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public.next_txn_id (ntxn_next) FROM stdin;
1
\.


--
-- Data for Name: next_write_id; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public.next_write_id (nwi_database, nwi_table, nwi_next) FROM stdin;
\.


--
-- Data for Name: repl_txn_map; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public.repl_txn_map (rtm_repl_policy, rtm_src_txn_id, rtm_target_txn_id) FROM stdin;
\.


--
-- Data for Name: runtime_stats; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public.runtime_stats (rs_id, create_time, weight, payload) FROM stdin;
\.


--
-- Data for Name: txn_components; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public.txn_components (tc_txnid, tc_database, tc_table, tc_partition, tc_operation_type, tc_writeid) FROM stdin;
\.


--
-- Data for Name: txn_to_write_id; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public.txn_to_write_id (t2w_txnid, t2w_database, t2w_table, t2w_writeid) FROM stdin;
\.


--
-- Data for Name: txns; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public.txns (txn_id, txn_state, txn_started, txn_last_heartbeat, txn_user, txn_host, txn_agent_info, txn_meta_info, txn_heartbeat_count, txn_type) FROM stdin;
\.


--
-- Data for Name: write_set; Type: TABLE DATA; Schema: public; Owner: hive
--

COPY public.write_set (ws_database, ws_table, ws_partition, ws_txnid, ws_commit_id, ws_operation_type) FROM stdin;
\.


--
-- Name: MASTER_KEYS_KEY_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: hive
--

SELECT pg_catalog.setval('public."MASTER_KEYS_KEY_ID_seq"', 1, false);


--
-- Name: BUCKETING_COLS BUCKETING_COLS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."BUCKETING_COLS"
    ADD CONSTRAINT "BUCKETING_COLS_pkey" PRIMARY KEY ("SD_ID", "INTEGER_IDX");


--
-- Name: CDS CDS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."CDS"
    ADD CONSTRAINT "CDS_pkey" PRIMARY KEY ("CD_ID");


--
-- Name: COLUMNS_V2 COLUMNS_V2_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."COLUMNS_V2"
    ADD CONSTRAINT "COLUMNS_V2_pkey" PRIMARY KEY ("CD_ID", "COLUMN_NAME");


--
-- Name: CTLGS CTLGS_NAME_key; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."CTLGS"
    ADD CONSTRAINT "CTLGS_NAME_key" UNIQUE ("NAME");


--
-- Name: CTLGS CTLGS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."CTLGS"
    ADD CONSTRAINT "CTLGS_pkey" PRIMARY KEY ("CTLG_ID");


--
-- Name: DATABASE_PARAMS DATABASE_PARAMS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."DATABASE_PARAMS"
    ADD CONSTRAINT "DATABASE_PARAMS_pkey" PRIMARY KEY ("DB_ID", "PARAM_KEY");


--
-- Name: DB_PRIVS DBPRIVILEGEINDEX; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."DB_PRIVS"
    ADD CONSTRAINT "DBPRIVILEGEINDEX" UNIQUE ("AUTHORIZER", "DB_ID", "PRINCIPAL_NAME", "PRINCIPAL_TYPE", "DB_PRIV", "GRANTOR", "GRANTOR_TYPE");


--
-- Name: DBS DBS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."DBS"
    ADD CONSTRAINT "DBS_pkey" PRIMARY KEY ("DB_ID");


--
-- Name: DB_PRIVS DB_PRIVS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."DB_PRIVS"
    ADD CONSTRAINT "DB_PRIVS_pkey" PRIMARY KEY ("DB_GRANT_ID");


--
-- Name: DELEGATION_TOKENS DELEGATION_TOKENS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."DELEGATION_TOKENS"
    ADD CONSTRAINT "DELEGATION_TOKENS_pkey" PRIMARY KEY ("TOKEN_IDENT");


--
-- Name: FUNCS FUNCS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."FUNCS"
    ADD CONSTRAINT "FUNCS_pkey" PRIMARY KEY ("FUNC_ID");


--
-- Name: FUNC_RU FUNC_RU_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."FUNC_RU"
    ADD CONSTRAINT "FUNC_RU_pkey" PRIMARY KEY ("FUNC_ID", "INTEGER_IDX");


--
-- Name: GLOBAL_PRIVS GLOBALPRIVILEGEINDEX; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."GLOBAL_PRIVS"
    ADD CONSTRAINT "GLOBALPRIVILEGEINDEX" UNIQUE ("AUTHORIZER", "PRINCIPAL_NAME", "PRINCIPAL_TYPE", "USER_PRIV", "GRANTOR", "GRANTOR_TYPE");


--
-- Name: GLOBAL_PRIVS GLOBAL_PRIVS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."GLOBAL_PRIVS"
    ADD CONSTRAINT "GLOBAL_PRIVS_pkey" PRIMARY KEY ("USER_GRANT_ID");


--
-- Name: IDXS IDXS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."IDXS"
    ADD CONSTRAINT "IDXS_pkey" PRIMARY KEY ("INDEX_ID");


--
-- Name: INDEX_PARAMS INDEX_PARAMS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."INDEX_PARAMS"
    ADD CONSTRAINT "INDEX_PARAMS_pkey" PRIMARY KEY ("INDEX_ID", "PARAM_KEY");


--
-- Name: I_SCHEMA I_SCHEMA_NAME_key; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."I_SCHEMA"
    ADD CONSTRAINT "I_SCHEMA_NAME_key" UNIQUE ("NAME");


--
-- Name: I_SCHEMA I_SCHEMA_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."I_SCHEMA"
    ADD CONSTRAINT "I_SCHEMA_pkey" PRIMARY KEY ("SCHEMA_ID");


--
-- Name: KEY_CONSTRAINTS KEY_CONSTRAINTS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."KEY_CONSTRAINTS"
    ADD CONSTRAINT "KEY_CONSTRAINTS_pkey" PRIMARY KEY ("CONSTRAINT_NAME", "POSITION");


--
-- Name: MASTER_KEYS MASTER_KEYS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."MASTER_KEYS"
    ADD CONSTRAINT "MASTER_KEYS_pkey" PRIMARY KEY ("KEY_ID");


--
-- Name: MV_CREATION_METADATA MV_CREATION_METADATA_PK; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."MV_CREATION_METADATA"
    ADD CONSTRAINT "MV_CREATION_METADATA_PK" PRIMARY KEY ("MV_CREATION_METADATA_ID");


--
-- Name: NOTIFICATION_LOG NOTIFICATION_LOG_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."NOTIFICATION_LOG"
    ADD CONSTRAINT "NOTIFICATION_LOG_pkey" PRIMARY KEY ("NL_ID");


--
-- Name: NOTIFICATION_SEQUENCE NOTIFICATION_SEQUENCE_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."NOTIFICATION_SEQUENCE"
    ADD CONSTRAINT "NOTIFICATION_SEQUENCE_pkey" PRIMARY KEY ("NNI_ID");


--
-- Name: NUCLEUS_TABLES NUCLEUS_TABLES_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."NUCLEUS_TABLES"
    ADD CONSTRAINT "NUCLEUS_TABLES_pkey" PRIMARY KEY ("CLASS_NAME");


--
-- Name: PARTITIONS PARTITIONS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."PARTITIONS"
    ADD CONSTRAINT "PARTITIONS_pkey" PRIMARY KEY ("PART_ID");


--
-- Name: PARTITION_EVENTS PARTITION_EVENTS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."PARTITION_EVENTS"
    ADD CONSTRAINT "PARTITION_EVENTS_pkey" PRIMARY KEY ("PART_NAME_ID");


--
-- Name: PARTITION_KEYS PARTITION_KEYS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."PARTITION_KEYS"
    ADD CONSTRAINT "PARTITION_KEYS_pkey" PRIMARY KEY ("TBL_ID", "PKEY_NAME");


--
-- Name: PARTITION_KEY_VALS PARTITION_KEY_VALS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."PARTITION_KEY_VALS"
    ADD CONSTRAINT "PARTITION_KEY_VALS_pkey" PRIMARY KEY ("PART_ID", "INTEGER_IDX");


--
-- Name: PARTITION_PARAMS PARTITION_PARAMS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."PARTITION_PARAMS"
    ADD CONSTRAINT "PARTITION_PARAMS_pkey" PRIMARY KEY ("PART_ID", "PARAM_KEY");


--
-- Name: PART_COL_PRIVS PART_COL_PRIVS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."PART_COL_PRIVS"
    ADD CONSTRAINT "PART_COL_PRIVS_pkey" PRIMARY KEY ("PART_COLUMN_GRANT_ID");


--
-- Name: PART_COL_STATS PART_COL_STATS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."PART_COL_STATS"
    ADD CONSTRAINT "PART_COL_STATS_pkey" PRIMARY KEY ("CS_ID");


--
-- Name: PART_PRIVS PART_PRIVS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."PART_PRIVS"
    ADD CONSTRAINT "PART_PRIVS_pkey" PRIMARY KEY ("PART_GRANT_ID");


--
-- Name: METASTORE_DB_PROPERTIES PROPERTY_KEY_PK; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."METASTORE_DB_PROPERTIES"
    ADD CONSTRAINT "PROPERTY_KEY_PK" PRIMARY KEY ("PROPERTY_KEY");


--
-- Name: ROLES ROLEENTITYINDEX; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."ROLES"
    ADD CONSTRAINT "ROLEENTITYINDEX" UNIQUE ("ROLE_NAME");


--
-- Name: ROLES ROLES_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."ROLES"
    ADD CONSTRAINT "ROLES_pkey" PRIMARY KEY ("ROLE_ID");


--
-- Name: ROLE_MAP ROLE_MAP_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."ROLE_MAP"
    ADD CONSTRAINT "ROLE_MAP_pkey" PRIMARY KEY ("ROLE_GRANT_ID");


--
-- Name: SCHEMA_VERSION SCHEMA_VERSION_SCHEMA_ID_VERSION_key; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SCHEMA_VERSION"
    ADD CONSTRAINT "SCHEMA_VERSION_SCHEMA_ID_VERSION_key" UNIQUE ("SCHEMA_ID", "VERSION");


--
-- Name: SCHEMA_VERSION SCHEMA_VERSION_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SCHEMA_VERSION"
    ADD CONSTRAINT "SCHEMA_VERSION_pkey" PRIMARY KEY ("SCHEMA_VERSION_ID");


--
-- Name: SDS SDS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SDS"
    ADD CONSTRAINT "SDS_pkey" PRIMARY KEY ("SD_ID");


--
-- Name: SD_PARAMS SD_PARAMS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SD_PARAMS"
    ADD CONSTRAINT "SD_PARAMS_pkey" PRIMARY KEY ("SD_ID", "PARAM_KEY");


--
-- Name: SEQUENCE_TABLE SEQUENCE_TABLE_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SEQUENCE_TABLE"
    ADD CONSTRAINT "SEQUENCE_TABLE_pkey" PRIMARY KEY ("SEQUENCE_NAME");


--
-- Name: SERDES SERDES_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SERDES"
    ADD CONSTRAINT "SERDES_pkey" PRIMARY KEY ("SERDE_ID");


--
-- Name: SERDE_PARAMS SERDE_PARAMS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SERDE_PARAMS"
    ADD CONSTRAINT "SERDE_PARAMS_pkey" PRIMARY KEY ("SERDE_ID", "PARAM_KEY");


--
-- Name: SKEWED_COL_NAMES SKEWED_COL_NAMES_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SKEWED_COL_NAMES"
    ADD CONSTRAINT "SKEWED_COL_NAMES_pkey" PRIMARY KEY ("SD_ID", "INTEGER_IDX");


--
-- Name: SKEWED_COL_VALUE_LOC_MAP SKEWED_COL_VALUE_LOC_MAP_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SKEWED_COL_VALUE_LOC_MAP"
    ADD CONSTRAINT "SKEWED_COL_VALUE_LOC_MAP_pkey" PRIMARY KEY ("SD_ID", "STRING_LIST_ID_KID");


--
-- Name: SKEWED_STRING_LIST_VALUES SKEWED_STRING_LIST_VALUES_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SKEWED_STRING_LIST_VALUES"
    ADD CONSTRAINT "SKEWED_STRING_LIST_VALUES_pkey" PRIMARY KEY ("STRING_LIST_ID", "INTEGER_IDX");


--
-- Name: SKEWED_STRING_LIST SKEWED_STRING_LIST_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SKEWED_STRING_LIST"
    ADD CONSTRAINT "SKEWED_STRING_LIST_pkey" PRIMARY KEY ("STRING_LIST_ID");


--
-- Name: SKEWED_VALUES SKEWED_VALUES_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SKEWED_VALUES"
    ADD CONSTRAINT "SKEWED_VALUES_pkey" PRIMARY KEY ("SD_ID_OID", "INTEGER_IDX");


--
-- Name: SORT_COLS SORT_COLS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SORT_COLS"
    ADD CONSTRAINT "SORT_COLS_pkey" PRIMARY KEY ("SD_ID", "INTEGER_IDX");


--
-- Name: TABLE_PARAMS TABLE_PARAMS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."TABLE_PARAMS"
    ADD CONSTRAINT "TABLE_PARAMS_pkey" PRIMARY KEY ("TBL_ID", "PARAM_KEY");


--
-- Name: TAB_COL_STATS TAB_COL_STATS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."TAB_COL_STATS"
    ADD CONSTRAINT "TAB_COL_STATS_pkey" PRIMARY KEY ("CS_ID");


--
-- Name: TBLS TBLS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."TBLS"
    ADD CONSTRAINT "TBLS_pkey" PRIMARY KEY ("TBL_ID");


--
-- Name: TBL_COL_PRIVS TBL_COL_PRIVS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."TBL_COL_PRIVS"
    ADD CONSTRAINT "TBL_COL_PRIVS_pkey" PRIMARY KEY ("TBL_COLUMN_GRANT_ID");


--
-- Name: TBL_PRIVS TBL_PRIVS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."TBL_PRIVS"
    ADD CONSTRAINT "TBL_PRIVS_pkey" PRIMARY KEY ("TBL_GRANT_ID");


--
-- Name: TYPES TYPES_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."TYPES"
    ADD CONSTRAINT "TYPES_pkey" PRIMARY KEY ("TYPES_ID");


--
-- Name: TYPE_FIELDS TYPE_FIELDS_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."TYPE_FIELDS"
    ADD CONSTRAINT "TYPE_FIELDS_pkey" PRIMARY KEY ("TYPE_NAME", "FIELD_NAME");


--
-- Name: IDXS UNIQUEINDEX; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."IDXS"
    ADD CONSTRAINT "UNIQUEINDEX" UNIQUE ("INDEX_NAME", "ORIG_TBL_ID");


--
-- Name: PARTITIONS UNIQUEPARTITION; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."PARTITIONS"
    ADD CONSTRAINT "UNIQUEPARTITION" UNIQUE ("PART_NAME", "TBL_ID");


--
-- Name: TBLS UNIQUETABLE; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."TBLS"
    ADD CONSTRAINT "UNIQUETABLE" UNIQUE ("TBL_NAME", "DB_ID");


--
-- Name: DBS UNIQUE_DATABASE; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."DBS"
    ADD CONSTRAINT "UNIQUE_DATABASE" UNIQUE ("NAME", "CTLG_NAME");


--
-- Name: TYPES UNIQUE_TYPE; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."TYPES"
    ADD CONSTRAINT "UNIQUE_TYPE" UNIQUE ("TYPE_NAME");


--
-- Name: WM_MAPPING UNIQUE_WM_MAPPING; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."WM_MAPPING"
    ADD CONSTRAINT "UNIQUE_WM_MAPPING" UNIQUE ("RP_ID", "ENTITY_TYPE", "ENTITY_NAME");


--
-- Name: WM_POOL UNIQUE_WM_POOL; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."WM_POOL"
    ADD CONSTRAINT "UNIQUE_WM_POOL" UNIQUE ("RP_ID", "PATH");


--
-- Name: WM_RESOURCEPLAN UNIQUE_WM_RESOURCEPLAN; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."WM_RESOURCEPLAN"
    ADD CONSTRAINT "UNIQUE_WM_RESOURCEPLAN" UNIQUE ("NAME");


--
-- Name: WM_TRIGGER UNIQUE_WM_TRIGGER; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."WM_TRIGGER"
    ADD CONSTRAINT "UNIQUE_WM_TRIGGER" UNIQUE ("RP_ID", "NAME");


--
-- Name: ROLE_MAP USERROLEMAPINDEX; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."ROLE_MAP"
    ADD CONSTRAINT "USERROLEMAPINDEX" UNIQUE ("PRINCIPAL_NAME", "ROLE_ID", "GRANTOR", "GRANTOR_TYPE");


--
-- Name: VERSION VERSION_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."VERSION"
    ADD CONSTRAINT "VERSION_pkey" PRIMARY KEY ("VER_ID");


--
-- Name: WM_MAPPING WM_MAPPING_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."WM_MAPPING"
    ADD CONSTRAINT "WM_MAPPING_pkey" PRIMARY KEY ("MAPPING_ID");


--
-- Name: WM_POOL_TO_TRIGGER WM_POOL_TO_TRIGGER_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."WM_POOL_TO_TRIGGER"
    ADD CONSTRAINT "WM_POOL_TO_TRIGGER_pkey" PRIMARY KEY ("POOL_ID", "TRIGGER_ID");


--
-- Name: WM_POOL WM_POOL_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."WM_POOL"
    ADD CONSTRAINT "WM_POOL_pkey" PRIMARY KEY ("POOL_ID");


--
-- Name: WM_RESOURCEPLAN WM_RESOURCEPLAN_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."WM_RESOURCEPLAN"
    ADD CONSTRAINT "WM_RESOURCEPLAN_pkey" PRIMARY KEY ("RP_ID");


--
-- Name: WM_TRIGGER WM_TRIGGER_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."WM_TRIGGER"
    ADD CONSTRAINT "WM_TRIGGER_pkey" PRIMARY KEY ("TRIGGER_ID");


--
-- Name: aux_table aux_table_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public.aux_table
    ADD CONSTRAINT aux_table_pkey PRIMARY KEY (mt_key1, mt_key2);


--
-- Name: compaction_queue compaction_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public.compaction_queue
    ADD CONSTRAINT compaction_queue_pkey PRIMARY KEY (cq_id);


--
-- Name: completed_compactions completed_compactions_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public.completed_compactions
    ADD CONSTRAINT completed_compactions_pkey PRIMARY KEY (cc_id);


--
-- Name: hive_locks hive_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public.hive_locks
    ADD CONSTRAINT hive_locks_pkey PRIMARY KEY (hl_lock_ext_id, hl_lock_int_id);


--
-- Name: materialization_rebuild_locks materialization_rebuild_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public.materialization_rebuild_locks
    ADD CONSTRAINT materialization_rebuild_locks_pkey PRIMARY KEY (mrl_txn_id);


--
-- Name: min_history_level min_history_level_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public.min_history_level
    ADD CONSTRAINT min_history_level_pkey PRIMARY KEY (mhl_txnid);


--
-- Name: repl_txn_map repl_txn_map_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public.repl_txn_map
    ADD CONSTRAINT repl_txn_map_pkey PRIMARY KEY (rtm_repl_policy, rtm_src_txn_id);


--
-- Name: runtime_stats runtime_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public.runtime_stats
    ADD CONSTRAINT runtime_stats_pkey PRIMARY KEY (rs_id);


--
-- Name: txns txns_pkey; Type: CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public.txns
    ADD CONSTRAINT txns_pkey PRIMARY KEY (txn_id);


--
-- Name: BUCKETING_COLS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "BUCKETING_COLS_N49" ON public."BUCKETING_COLS" USING btree ("SD_ID");


--
-- Name: CONSTRAINTS_CONSTRAINT_TYPE_INDEX; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "CONSTRAINTS_CONSTRAINT_TYPE_INDEX" ON public."KEY_CONSTRAINTS" USING btree ("CONSTRAINT_TYPE");


--
-- Name: CONSTRAINTS_PARENT_TBLID_INDEX; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "CONSTRAINTS_PARENT_TBLID_INDEX" ON public."KEY_CONSTRAINTS" USING btree ("PARENT_TBL_ID");


--
-- Name: DATABASE_PARAMS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "DATABASE_PARAMS_N49" ON public."DATABASE_PARAMS" USING btree ("DB_ID");


--
-- Name: DB_PRIVS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "DB_PRIVS_N49" ON public."DB_PRIVS" USING btree ("DB_ID");


--
-- Name: FUNCS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "FUNCS_N49" ON public."FUNCS" USING btree ("DB_ID");


--
-- Name: FUNC_RU_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "FUNC_RU_N49" ON public."FUNC_RU" USING btree ("FUNC_ID");


--
-- Name: IDXS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "IDXS_N49" ON public."IDXS" USING btree ("ORIG_TBL_ID");


--
-- Name: IDXS_N50; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "IDXS_N50" ON public."IDXS" USING btree ("INDEX_TBL_ID");


--
-- Name: IDXS_N51; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "IDXS_N51" ON public."IDXS" USING btree ("SD_ID");


--
-- Name: INDEX_PARAMS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "INDEX_PARAMS_N49" ON public."INDEX_PARAMS" USING btree ("INDEX_ID");


--
-- Name: MV_UNIQUE_TABLE; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "MV_UNIQUE_TABLE" ON public."MV_CREATION_METADATA" USING btree ("TBL_NAME", "DB_NAME");


--
-- Name: PARTITIONCOLUMNPRIVILEGEINDEX; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "PARTITIONCOLUMNPRIVILEGEINDEX" ON public."PART_COL_PRIVS" USING btree ("AUTHORIZER", "PART_ID", "COLUMN_NAME", "PRINCIPAL_NAME", "PRINCIPAL_TYPE", "PART_COL_PRIV", "GRANTOR", "GRANTOR_TYPE");


--
-- Name: PARTITIONEVENTINDEX; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "PARTITIONEVENTINDEX" ON public."PARTITION_EVENTS" USING btree ("PARTITION_NAME");


--
-- Name: PARTITIONS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "PARTITIONS_N49" ON public."PARTITIONS" USING btree ("TBL_ID");


--
-- Name: PARTITIONS_N50; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "PARTITIONS_N50" ON public."PARTITIONS" USING btree ("SD_ID");


--
-- Name: PARTITION_KEYS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "PARTITION_KEYS_N49" ON public."PARTITION_KEYS" USING btree ("TBL_ID");


--
-- Name: PARTITION_KEY_VALS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "PARTITION_KEY_VALS_N49" ON public."PARTITION_KEY_VALS" USING btree ("PART_ID");


--
-- Name: PARTITION_PARAMS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "PARTITION_PARAMS_N49" ON public."PARTITION_PARAMS" USING btree ("PART_ID");


--
-- Name: PARTPRIVILEGEINDEX; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "PARTPRIVILEGEINDEX" ON public."PART_PRIVS" USING btree ("AUTHORIZER", "PART_ID", "PRINCIPAL_NAME", "PRINCIPAL_TYPE", "PART_PRIV", "GRANTOR", "GRANTOR_TYPE");


--
-- Name: PART_COL_PRIVS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "PART_COL_PRIVS_N49" ON public."PART_COL_PRIVS" USING btree ("PART_ID");


--
-- Name: PART_COL_STATS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "PART_COL_STATS_N49" ON public."PART_COL_STATS" USING btree ("PART_ID");


--
-- Name: PART_PRIVS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "PART_PRIVS_N49" ON public."PART_PRIVS" USING btree ("PART_ID");


--
-- Name: PCS_STATS_IDX; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "PCS_STATS_IDX" ON public."PART_COL_STATS" USING btree ("CAT_NAME", "DB_NAME", "TABLE_NAME", "COLUMN_NAME", "PARTITION_NAME");


--
-- Name: ROLE_MAP_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "ROLE_MAP_N49" ON public."ROLE_MAP" USING btree ("ROLE_ID");


--
-- Name: SDS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "SDS_N49" ON public."SDS" USING btree ("SERDE_ID");


--
-- Name: SD_PARAMS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "SD_PARAMS_N49" ON public."SD_PARAMS" USING btree ("SD_ID");


--
-- Name: SERDE_PARAMS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "SERDE_PARAMS_N49" ON public."SERDE_PARAMS" USING btree ("SERDE_ID");


--
-- Name: SORT_COLS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "SORT_COLS_N49" ON public."SORT_COLS" USING btree ("SD_ID");


--
-- Name: TABLECOLUMNPRIVILEGEINDEX; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "TABLECOLUMNPRIVILEGEINDEX" ON public."TBL_COL_PRIVS" USING btree ("AUTHORIZER", "TBL_ID", "COLUMN_NAME", "PRINCIPAL_NAME", "PRINCIPAL_TYPE", "TBL_COL_PRIV", "GRANTOR", "GRANTOR_TYPE");


--
-- Name: TABLEPRIVILEGEINDEX; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "TABLEPRIVILEGEINDEX" ON public."TBL_PRIVS" USING btree ("AUTHORIZER", "TBL_ID", "PRINCIPAL_NAME", "PRINCIPAL_TYPE", "TBL_PRIV", "GRANTOR", "GRANTOR_TYPE");


--
-- Name: TABLE_PARAMS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "TABLE_PARAMS_N49" ON public."TABLE_PARAMS" USING btree ("TBL_ID");


--
-- Name: TAB_COL_STATS_IDX; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "TAB_COL_STATS_IDX" ON public."TAB_COL_STATS" USING btree ("CAT_NAME", "DB_NAME", "TABLE_NAME", "COLUMN_NAME");


--
-- Name: TAB_COL_STATS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "TAB_COL_STATS_N49" ON public."TAB_COL_STATS" USING btree ("TBL_ID");


--
-- Name: TBLS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "TBLS_N49" ON public."TBLS" USING btree ("DB_ID");


--
-- Name: TBLS_N50; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "TBLS_N50" ON public."TBLS" USING btree ("SD_ID");


--
-- Name: TBL_COL_PRIVS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "TBL_COL_PRIVS_N49" ON public."TBL_COL_PRIVS" USING btree ("TBL_ID");


--
-- Name: TBL_PRIVS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "TBL_PRIVS_N49" ON public."TBL_PRIVS" USING btree ("TBL_ID");


--
-- Name: TYPE_FIELDS_N49; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX "TYPE_FIELDS_N49" ON public."TYPE_FIELDS" USING btree ("TYPE_NAME");


--
-- Name: UNIQUEFUNCTION; Type: INDEX; Schema: public; Owner: hive
--

CREATE UNIQUE INDEX "UNIQUEFUNCTION" ON public."FUNCS" USING btree ("FUNC_NAME", "DB_ID");


--
-- Name: completed_txn_components_index; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX completed_txn_components_index ON public.completed_txn_components USING btree (ctc_database, ctc_table, ctc_partition);


--
-- Name: hl_txnid_index; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX hl_txnid_index ON public.hive_locks USING hash (hl_txnid);


--
-- Name: idx_runtime_stats_create_time; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX idx_runtime_stats_create_time ON public.runtime_stats USING btree (create_time);


--
-- Name: min_history_level_idx; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX min_history_level_idx ON public.min_history_level USING btree (mhl_min_open_txnid);


--
-- Name: next_write_id_idx; Type: INDEX; Schema: public; Owner: hive
--

CREATE UNIQUE INDEX next_write_id_idx ON public.next_write_id USING btree (nwi_database, nwi_table);


--
-- Name: tbl_to_txn_id_idx; Type: INDEX; Schema: public; Owner: hive
--

CREATE UNIQUE INDEX tbl_to_txn_id_idx ON public.txn_to_write_id USING btree (t2w_database, t2w_table, t2w_txnid);


--
-- Name: tbl_to_write_id_idx; Type: INDEX; Schema: public; Owner: hive
--

CREATE UNIQUE INDEX tbl_to_write_id_idx ON public.txn_to_write_id USING btree (t2w_database, t2w_table, t2w_writeid);


--
-- Name: tc_txnid_index; Type: INDEX; Schema: public; Owner: hive
--

CREATE INDEX tc_txnid_index ON public.txn_components USING hash (tc_txnid);


--
-- Name: BUCKETING_COLS BUCKETING_COLS_SD_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."BUCKETING_COLS"
    ADD CONSTRAINT "BUCKETING_COLS_SD_ID_fkey" FOREIGN KEY ("SD_ID") REFERENCES public."SDS"("SD_ID") DEFERRABLE;


--
-- Name: COLUMNS_V2 COLUMNS_V2_CD_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."COLUMNS_V2"
    ADD CONSTRAINT "COLUMNS_V2_CD_ID_fkey" FOREIGN KEY ("CD_ID") REFERENCES public."CDS"("CD_ID") DEFERRABLE;


--
-- Name: DATABASE_PARAMS DATABASE_PARAMS_DB_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."DATABASE_PARAMS"
    ADD CONSTRAINT "DATABASE_PARAMS_DB_ID_fkey" FOREIGN KEY ("DB_ID") REFERENCES public."DBS"("DB_ID") DEFERRABLE;


--
-- Name: DBS DBS_FK1; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."DBS"
    ADD CONSTRAINT "DBS_FK1" FOREIGN KEY ("CTLG_NAME") REFERENCES public."CTLGS"("NAME");


--
-- Name: DB_PRIVS DB_PRIVS_DB_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."DB_PRIVS"
    ADD CONSTRAINT "DB_PRIVS_DB_ID_fkey" FOREIGN KEY ("DB_ID") REFERENCES public."DBS"("DB_ID") DEFERRABLE;


--
-- Name: FUNCS FUNCS_FK1; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."FUNCS"
    ADD CONSTRAINT "FUNCS_FK1" FOREIGN KEY ("DB_ID") REFERENCES public."DBS"("DB_ID") DEFERRABLE;


--
-- Name: FUNC_RU FUNC_RU_FK1; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."FUNC_RU"
    ADD CONSTRAINT "FUNC_RU_FK1" FOREIGN KEY ("FUNC_ID") REFERENCES public."FUNCS"("FUNC_ID") DEFERRABLE;


--
-- Name: IDXS IDXS_INDEX_TBL_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."IDXS"
    ADD CONSTRAINT "IDXS_INDEX_TBL_ID_fkey" FOREIGN KEY ("INDEX_TBL_ID") REFERENCES public."TBLS"("TBL_ID") DEFERRABLE;


--
-- Name: IDXS IDXS_ORIG_TBL_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."IDXS"
    ADD CONSTRAINT "IDXS_ORIG_TBL_ID_fkey" FOREIGN KEY ("ORIG_TBL_ID") REFERENCES public."TBLS"("TBL_ID") DEFERRABLE;


--
-- Name: IDXS IDXS_SD_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."IDXS"
    ADD CONSTRAINT "IDXS_SD_ID_fkey" FOREIGN KEY ("SD_ID") REFERENCES public."SDS"("SD_ID") DEFERRABLE;


--
-- Name: INDEX_PARAMS INDEX_PARAMS_INDEX_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."INDEX_PARAMS"
    ADD CONSTRAINT "INDEX_PARAMS_INDEX_ID_fkey" FOREIGN KEY ("INDEX_ID") REFERENCES public."IDXS"("INDEX_ID") DEFERRABLE;


--
-- Name: I_SCHEMA I_SCHEMA_DB_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."I_SCHEMA"
    ADD CONSTRAINT "I_SCHEMA_DB_ID_fkey" FOREIGN KEY ("DB_ID") REFERENCES public."DBS"("DB_ID");


--
-- Name: MV_TABLES_USED MV_TABLES_USED_FK1; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."MV_TABLES_USED"
    ADD CONSTRAINT "MV_TABLES_USED_FK1" FOREIGN KEY ("MV_CREATION_METADATA_ID") REFERENCES public."MV_CREATION_METADATA"("MV_CREATION_METADATA_ID") DEFERRABLE;


--
-- Name: MV_TABLES_USED MV_TABLES_USED_FK2; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."MV_TABLES_USED"
    ADD CONSTRAINT "MV_TABLES_USED_FK2" FOREIGN KEY ("TBL_ID") REFERENCES public."TBLS"("TBL_ID") DEFERRABLE;


--
-- Name: PARTITIONS PARTITIONS_SD_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."PARTITIONS"
    ADD CONSTRAINT "PARTITIONS_SD_ID_fkey" FOREIGN KEY ("SD_ID") REFERENCES public."SDS"("SD_ID") DEFERRABLE;


--
-- Name: PARTITIONS PARTITIONS_TBL_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."PARTITIONS"
    ADD CONSTRAINT "PARTITIONS_TBL_ID_fkey" FOREIGN KEY ("TBL_ID") REFERENCES public."TBLS"("TBL_ID") DEFERRABLE;


--
-- Name: PARTITION_KEYS PARTITION_KEYS_TBL_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."PARTITION_KEYS"
    ADD CONSTRAINT "PARTITION_KEYS_TBL_ID_fkey" FOREIGN KEY ("TBL_ID") REFERENCES public."TBLS"("TBL_ID") DEFERRABLE;


--
-- Name: PARTITION_KEY_VALS PARTITION_KEY_VALS_PART_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."PARTITION_KEY_VALS"
    ADD CONSTRAINT "PARTITION_KEY_VALS_PART_ID_fkey" FOREIGN KEY ("PART_ID") REFERENCES public."PARTITIONS"("PART_ID") DEFERRABLE;


--
-- Name: PARTITION_PARAMS PARTITION_PARAMS_PART_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."PARTITION_PARAMS"
    ADD CONSTRAINT "PARTITION_PARAMS_PART_ID_fkey" FOREIGN KEY ("PART_ID") REFERENCES public."PARTITIONS"("PART_ID") DEFERRABLE;


--
-- Name: PART_COL_PRIVS PART_COL_PRIVS_PART_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."PART_COL_PRIVS"
    ADD CONSTRAINT "PART_COL_PRIVS_PART_ID_fkey" FOREIGN KEY ("PART_ID") REFERENCES public."PARTITIONS"("PART_ID") DEFERRABLE;


--
-- Name: PART_COL_STATS PART_COL_STATS_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."PART_COL_STATS"
    ADD CONSTRAINT "PART_COL_STATS_fkey" FOREIGN KEY ("PART_ID") REFERENCES public."PARTITIONS"("PART_ID") DEFERRABLE;


--
-- Name: PART_PRIVS PART_PRIVS_PART_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."PART_PRIVS"
    ADD CONSTRAINT "PART_PRIVS_PART_ID_fkey" FOREIGN KEY ("PART_ID") REFERENCES public."PARTITIONS"("PART_ID") DEFERRABLE;


--
-- Name: ROLE_MAP ROLE_MAP_ROLE_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."ROLE_MAP"
    ADD CONSTRAINT "ROLE_MAP_ROLE_ID_fkey" FOREIGN KEY ("ROLE_ID") REFERENCES public."ROLES"("ROLE_ID") DEFERRABLE;


--
-- Name: SCHEMA_VERSION SCHEMA_VERSION_CD_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SCHEMA_VERSION"
    ADD CONSTRAINT "SCHEMA_VERSION_CD_ID_fkey" FOREIGN KEY ("CD_ID") REFERENCES public."CDS"("CD_ID");


--
-- Name: SCHEMA_VERSION SCHEMA_VERSION_SCHEMA_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SCHEMA_VERSION"
    ADD CONSTRAINT "SCHEMA_VERSION_SCHEMA_ID_fkey" FOREIGN KEY ("SCHEMA_ID") REFERENCES public."I_SCHEMA"("SCHEMA_ID");


--
-- Name: SCHEMA_VERSION SCHEMA_VERSION_SERDE_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SCHEMA_VERSION"
    ADD CONSTRAINT "SCHEMA_VERSION_SERDE_ID_fkey" FOREIGN KEY ("SERDE_ID") REFERENCES public."SERDES"("SERDE_ID");


--
-- Name: SDS SDS_CD_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SDS"
    ADD CONSTRAINT "SDS_CD_ID_fkey" FOREIGN KEY ("CD_ID") REFERENCES public."CDS"("CD_ID") DEFERRABLE;


--
-- Name: SDS SDS_SERDE_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SDS"
    ADD CONSTRAINT "SDS_SERDE_ID_fkey" FOREIGN KEY ("SERDE_ID") REFERENCES public."SERDES"("SERDE_ID") DEFERRABLE;


--
-- Name: SD_PARAMS SD_PARAMS_SD_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SD_PARAMS"
    ADD CONSTRAINT "SD_PARAMS_SD_ID_fkey" FOREIGN KEY ("SD_ID") REFERENCES public."SDS"("SD_ID") DEFERRABLE;


--
-- Name: SERDE_PARAMS SERDE_PARAMS_SERDE_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SERDE_PARAMS"
    ADD CONSTRAINT "SERDE_PARAMS_SERDE_ID_fkey" FOREIGN KEY ("SERDE_ID") REFERENCES public."SERDES"("SERDE_ID") DEFERRABLE;


--
-- Name: SKEWED_COL_NAMES SKEWED_COL_NAMES_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SKEWED_COL_NAMES"
    ADD CONSTRAINT "SKEWED_COL_NAMES_fkey" FOREIGN KEY ("SD_ID") REFERENCES public."SDS"("SD_ID") DEFERRABLE;


--
-- Name: SKEWED_COL_VALUE_LOC_MAP SKEWED_COL_VALUE_LOC_MAP_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SKEWED_COL_VALUE_LOC_MAP"
    ADD CONSTRAINT "SKEWED_COL_VALUE_LOC_MAP_fkey1" FOREIGN KEY ("SD_ID") REFERENCES public."SDS"("SD_ID") DEFERRABLE;


--
-- Name: SKEWED_COL_VALUE_LOC_MAP SKEWED_COL_VALUE_LOC_MAP_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SKEWED_COL_VALUE_LOC_MAP"
    ADD CONSTRAINT "SKEWED_COL_VALUE_LOC_MAP_fkey2" FOREIGN KEY ("STRING_LIST_ID_KID") REFERENCES public."SKEWED_STRING_LIST"("STRING_LIST_ID") DEFERRABLE;


--
-- Name: SKEWED_STRING_LIST_VALUES SKEWED_STRING_LIST_VALUES_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SKEWED_STRING_LIST_VALUES"
    ADD CONSTRAINT "SKEWED_STRING_LIST_VALUES_fkey" FOREIGN KEY ("STRING_LIST_ID") REFERENCES public."SKEWED_STRING_LIST"("STRING_LIST_ID") DEFERRABLE;


--
-- Name: SKEWED_VALUES SKEWED_VALUES_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SKEWED_VALUES"
    ADD CONSTRAINT "SKEWED_VALUES_fkey1" FOREIGN KEY ("STRING_LIST_ID_EID") REFERENCES public."SKEWED_STRING_LIST"("STRING_LIST_ID") DEFERRABLE;


--
-- Name: SKEWED_VALUES SKEWED_VALUES_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SKEWED_VALUES"
    ADD CONSTRAINT "SKEWED_VALUES_fkey2" FOREIGN KEY ("SD_ID_OID") REFERENCES public."SDS"("SD_ID") DEFERRABLE;


--
-- Name: SORT_COLS SORT_COLS_SD_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."SORT_COLS"
    ADD CONSTRAINT "SORT_COLS_SD_ID_fkey" FOREIGN KEY ("SD_ID") REFERENCES public."SDS"("SD_ID") DEFERRABLE;


--
-- Name: TABLE_PARAMS TABLE_PARAMS_TBL_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."TABLE_PARAMS"
    ADD CONSTRAINT "TABLE_PARAMS_TBL_ID_fkey" FOREIGN KEY ("TBL_ID") REFERENCES public."TBLS"("TBL_ID") DEFERRABLE;


--
-- Name: TAB_COL_STATS TAB_COL_STATS_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."TAB_COL_STATS"
    ADD CONSTRAINT "TAB_COL_STATS_fkey" FOREIGN KEY ("TBL_ID") REFERENCES public."TBLS"("TBL_ID") DEFERRABLE;


--
-- Name: TBLS TBLS_DB_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."TBLS"
    ADD CONSTRAINT "TBLS_DB_ID_fkey" FOREIGN KEY ("DB_ID") REFERENCES public."DBS"("DB_ID") DEFERRABLE;


--
-- Name: TBLS TBLS_SD_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."TBLS"
    ADD CONSTRAINT "TBLS_SD_ID_fkey" FOREIGN KEY ("SD_ID") REFERENCES public."SDS"("SD_ID") DEFERRABLE;


--
-- Name: TBL_COL_PRIVS TBL_COL_PRIVS_TBL_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."TBL_COL_PRIVS"
    ADD CONSTRAINT "TBL_COL_PRIVS_TBL_ID_fkey" FOREIGN KEY ("TBL_ID") REFERENCES public."TBLS"("TBL_ID") DEFERRABLE;


--
-- Name: TBL_PRIVS TBL_PRIVS_TBL_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."TBL_PRIVS"
    ADD CONSTRAINT "TBL_PRIVS_TBL_ID_fkey" FOREIGN KEY ("TBL_ID") REFERENCES public."TBLS"("TBL_ID") DEFERRABLE;


--
-- Name: TYPE_FIELDS TYPE_FIELDS_TYPE_NAME_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."TYPE_FIELDS"
    ADD CONSTRAINT "TYPE_FIELDS_TYPE_NAME_fkey" FOREIGN KEY ("TYPE_NAME") REFERENCES public."TYPES"("TYPES_ID") DEFERRABLE;


--
-- Name: WM_MAPPING WM_MAPPING_FK1; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."WM_MAPPING"
    ADD CONSTRAINT "WM_MAPPING_FK1" FOREIGN KEY ("RP_ID") REFERENCES public."WM_RESOURCEPLAN"("RP_ID") DEFERRABLE;


--
-- Name: WM_MAPPING WM_MAPPING_FK2; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."WM_MAPPING"
    ADD CONSTRAINT "WM_MAPPING_FK2" FOREIGN KEY ("POOL_ID") REFERENCES public."WM_POOL"("POOL_ID") DEFERRABLE;


--
-- Name: WM_POOL WM_POOL_FK1; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."WM_POOL"
    ADD CONSTRAINT "WM_POOL_FK1" FOREIGN KEY ("RP_ID") REFERENCES public."WM_RESOURCEPLAN"("RP_ID") DEFERRABLE;


--
-- Name: WM_POOL_TO_TRIGGER WM_POOL_TO_TRIGGER_FK1; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."WM_POOL_TO_TRIGGER"
    ADD CONSTRAINT "WM_POOL_TO_TRIGGER_FK1" FOREIGN KEY ("POOL_ID") REFERENCES public."WM_POOL"("POOL_ID") DEFERRABLE;


--
-- Name: WM_POOL_TO_TRIGGER WM_POOL_TO_TRIGGER_FK2; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."WM_POOL_TO_TRIGGER"
    ADD CONSTRAINT "WM_POOL_TO_TRIGGER_FK2" FOREIGN KEY ("TRIGGER_ID") REFERENCES public."WM_TRIGGER"("TRIGGER_ID") DEFERRABLE;


--
-- Name: WM_RESOURCEPLAN WM_RESOURCEPLAN_FK1; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."WM_RESOURCEPLAN"
    ADD CONSTRAINT "WM_RESOURCEPLAN_FK1" FOREIGN KEY ("DEFAULT_POOL_ID") REFERENCES public."WM_POOL"("POOL_ID") DEFERRABLE;


--
-- Name: WM_TRIGGER WM_TRIGGER_FK1; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public."WM_TRIGGER"
    ADD CONSTRAINT "WM_TRIGGER_FK1" FOREIGN KEY ("RP_ID") REFERENCES public."WM_RESOURCEPLAN"("RP_ID") DEFERRABLE;


--
-- Name: txn_components txn_components_tc_txnid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hive
--

ALTER TABLE ONLY public.txn_components
    ADD CONSTRAINT txn_components_tc_txnid_fkey FOREIGN KEY (tc_txnid) REFERENCES public.txns(txn_id);


--
-- PostgreSQL database dump complete
--

