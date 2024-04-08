--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-04-03 23:44:06

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
-- TOC entry 6 (class 2615 OID 16399)
-- Name: stg; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA stg;


ALTER SCHEMA stg OWNER TO postgres;

--
-- TOC entry 234 (class 1255 OID 110084)
-- Name: shopify_track_delete_trigger(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.shopify_track_delete_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	DECLARE
	col_name VARCHAR(100);
	current_ts timestamp without time zone;
BEGIN
	SELECT NOW() INTO current_ts;
	
	IF (OLD.host IS NOT NULL and  OLD.shopifyid IS NOT NULL 
			and OLD.variantid IS NOT NULL and OLD.producturl IS NOT NULL) THEN

		IF (OLD.sku IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'delete', OLD.host, OLD.shopifyid, OLD.variantid, OLD.producturl, current_ts, 
				'sku', OLD.sku, NULL);
		END IF;

		IF (OLD.collection1 IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'delete', OLD.host, OLD.shopifyid, OLD.variantid, OLD.producturl, current_ts, 
				'collection1', OLD.collection1, NULL);
		 END IF;

	    IF (OLD.collection2 IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'delete', OLD.host, OLD.shopifyid, OLD.variantid, OLD.producturl, current_ts, 
				'collection2', OLD.collection2, NULL);
		 END IF;

		IF (OLD.collection3 IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'delete', OLD.host, OLD.shopifyid, OLD.variantid, OLD.producturl, current_ts, 
				'collection3', OLD.collection3, NULL);
		 END IF;

		IF (OLD.collection4 IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'delete', OLD.host, OLD.shopifyid, OLD.variantid, OLD.producturl, current_ts, 
				'collection4', OLD.collection4, NULL);
		 END IF;

		IF (OLD.collection5 IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'delete', OLD.host, OLD.shopifyid, OLD.variantid, OLD.producturl, current_ts, 
				'collection5', OLD.collection5, NULL);
		 END IF;

		IF (OLD.tags IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'delete', OLD.host, OLD.shopifyid, OLD.variantid, OLD.producturl, current_ts, 
				'tags', OLD.tags, NULL);
		 END IF;

		IF (OLD.producttitle IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'delete', OLD.host, OLD.shopifyid, OLD.variantid, OLD.producturl, current_ts, 
				'producttitle', OLD.producttitle, NULL);
		 END IF;

		IF (OLD.varianttitle IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'delete', OLD.host, OLD.shopifyid, OLD.variantid, OLD.producturl, current_ts, 
				'varianttitle', OLD.varianttitle, NULL);
		 END IF;

		IF (OLD.price IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'delete', OLD.host, OLD.shopifyid, OLD.variantid, OLD.producturl, current_ts, 
				'price', OLD.price, NULL);
		 END IF;

		IF (OLD.compareatprice IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'delete', OLD.host, OLD.shopifyid, OLD.variantid, OLD.producturl, current_ts, 
				'compareatprice', OLD.compareatprice, NULL);
		 END IF;

		IF (OLD.instock IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'delete', OLD.host, OLD.shopifyid, OLD.variantid, OLD.producturl, current_ts, 
				'instock', OLD.instock, NULL);
		 END IF;

		IF (OLD.producturl IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'delete', OLD.host, OLD.shopifyid, OLD.variantid, OLD.producturl, current_ts, 
				'producturl', OLD.producturl, NULL);
		 END IF;

		IF (OLD.imageurl IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'delete', OLD.host, OLD.shopifyid, OLD.variantid, OLD.producturl, current_ts, 
				'imageurl', OLD.imageurl, NULL);
		 END IF;

		IF (OLD.description IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'delete', OLD.host, OLD.shopifyid, OLD.variantid, OLD.producturl, current_ts, 
				'description', OLD.description, NULL);
		 END IF;

		IF (OLD.descriptionnohtml IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'delete', OLD.host, OLD.shopifyid, OLD.variantid, OLD.producturl, current_ts, 
				'descriptionnohtml', OLD.descriptionnohtml, NULL);
		 END IF;
		
	END IF;
	
    RETURN OLD;
END;
$$;


ALTER FUNCTION public.shopify_track_delete_trigger() OWNER TO postgres;

--
-- TOC entry 235 (class 1255 OID 69310)
-- Name: shopify_track_insert_trigger(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.shopify_track_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	DECLARE
	col_name VARCHAR(100);
	current_ts timestamp without time zone;
BEGIN
	SELECT NOW() INTO current_ts;
	
	IF (NEW.host IS NOT NULL and  NEW.shopifyid IS NOT NULL 
			and NEW.variantid IS NOT NULL and NEW.producturl IS NOT NULL) THEN

		IF (NEW.sku IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'insert', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'sku', NULL, NEW.sku);
		END IF;

		IF (NEW.collection1 IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'insert', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'collection1', NULL, NEW.collection1);
		 END IF;

	    IF (NEW.collection2 IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'insert', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'collection2', NULL, NEW.collection2);
		 END IF;

		IF (NEW.collection3 IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'insert', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'collection3', NULL, NEW.collection3);
		 END IF;

		IF (NEW.collection4 IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'insert', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'collection4', NULL, NEW.collection4);
		 END IF;

		IF (NEW.collection5 IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'insert', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'collection5', NULL, NEW.collection5);
		 END IF;

		IF (NEW.tags IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'insert', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'tags', NULL, NEW.tags);
		 END IF;

		IF (NEW.producttitle IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'insert', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'producttitle', NULL, NEW.producttitle);
		 END IF;

		IF (NEW.varianttitle IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'insert', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'varianttitle', NULL, NEW.varianttitle);
		 END IF;

		IF (NEW.price IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'insert', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'price', NULL, NEW.price);
		 END IF;

		IF (NEW.compareatprice IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'insert', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'compareatprice', NULL, NEW.compareatprice);
		 END IF;

		IF (NEW.instock IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'insert', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'instock', NULL, NEW.instock);
		 END IF;

		IF (NEW.producturl IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'insert', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'producturl', NULL, NEW.producturl);
		 END IF;

		IF (NEW.imageurl IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'insert', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'imageurl', NULL, NEW.imageurl);
		 END IF;

		IF (NEW.description IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'insert', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'description', NULL, NEW.description);
		 END IF;

		IF (NEW.descriptionnohtml IS NOT NULL) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'insert', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'descriptionnohtml', NULL, NEW.descriptionnohtml);
		 END IF;
		
	END IF;
	
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.shopify_track_insert_trigger() OWNER TO postgres;

--
-- TOC entry 236 (class 1255 OID 110082)
-- Name: shopify_track_update_trigger(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.shopify_track_update_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	DECLARE
	col_name VARCHAR(100);
	current_ts timestamp without time zone;
BEGIN
	SELECT NOW() INTO current_ts;
	
	IF (NEW.host IS NOT NULL and  NEW.shopifyid IS NOT NULL 
			and NEW.variantid IS NOT NULL and NEW.producturl IS NOT NULL) THEN

		IF (NEW.sku IS NOT NULL and NEW.sku<>OLD.sku) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'update', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'sku', OLD.sku, NEW.sku);
		END IF;

		IF (NEW.collection1 IS NOT NULL AND NEW.collection1<>OLD.collection1) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'update', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'collection1', OLD.collection1, NEW.collection1);
		 END IF;

	    IF (NEW.collection2 IS NOT NULL AND NEW.collection2<> OLD.collection2) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'update', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'collection2', OLD.collection2, NEW.collection2);
		 END IF;

		IF (NEW.collection3 IS NOT NULL AND NEW.collection3<>OLD.collection3) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'update', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'collection3', OLD.collection3, NEW.collection3);
		 END IF;

		IF (NEW.collection4 IS NOT NULL AND NEW.collection4<>OLD.collection4) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'update', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'collection4', OLD.collection4, NEW.collection4);
		 END IF;

		IF (NEW.collection5 IS NOT NULL AND NEW.collection5<>OLD.collection5) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'update', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'collection5', OLD.collection5, NEW.collection5);
		 END IF;

		IF (NEW.tags IS NOT NULL AND NEW.tags<>OLD.tags) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'update', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'tags', OLD.tags, NEW.tags);
		 END IF;

		IF (NEW.producttitle IS NOT NULL AND NEW.producttitle<>OLD.producttitle) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'update', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'producttitle', OLD.producttitle, NEW.producttitle);
		 END IF;

		IF (NEW.varianttitle IS NOT NULL AND NEW.varianttitle<>OLD.varianttitle) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'update', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'varianttitle', OLD.varianttitle, NEW.varianttitle);
		 END IF;

		IF (NEW.price IS NOT NULL AND NEW.price<>OLD.price) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'update', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'price', OLD.price, NEW.price);
		 END IF;

		IF (NEW.compareatprice IS NOT NULL AND NEW.compareatprice<>OLD.compareatprice) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'update', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'compareatprice', OLD.compareatprice, NEW.compareatprice);
		 END IF;

		IF (NEW.instock IS NOT NULL AND NEW.instock<>OLD.instock) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'update', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'instock', OLD.instock, NEW.instock);
		 END IF;

		IF (NEW.producturl IS NOT NULL AND NEW.producturl<>OLD.producturl) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'update', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'producturl', OLD.producturl, NEW.producturl);
		 END IF;

		IF (NEW.imageurl IS NOT NULL AND NEW.imageurl<>OLD.imageurl) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'update', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'imageurl', OLD.imageurl, NEW.imageurl);
		 END IF;

		IF (NEW.description IS NOT NULL and NEW.description<>OLD.description) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'update', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'description', OLD.description, NEW.description);
		 END IF;

		IF (NEW.descriptionnohtml IS NOT NULL and NEW.descriptionnohtml<>OLD.descriptionnohtml) THEN
			INSERT INTO product_changes_log(
			change_type, host, shopifyid, variantid, producturl, change_timestamp, 
				field_changed, old_value, new_value  )
			VALUES ( 'update', NEW.host, NEW.shopifyid, NEW.variantid, NEW.producturl, current_ts, 
				'descriptionnohtml', OLD.descriptionnohtml, NEW.descriptionnohtml);
		 END IF;
		
	END IF;
	
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.shopify_track_update_trigger() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 16426)
-- Name: product_changes_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_changes_log (
    id integer NOT NULL,
    change_type character varying(255),
    host character varying(255),
    field_changed character varying(255),
    old_value text,
    new_value text,
    change_timestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    producturl character varying(2048),
    shopifyid bigint,
    variantid bigint,
    CONSTRAINT product_changes_log_change_type_check CHECK (((change_type)::text = ANY (ARRAY[('insert'::character varying)::text, ('update'::character varying)::text, ('delete'::character varying)::text, ('sale'::character varying)::text])))
);


ALTER TABLE public.product_changes_log OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16425)
-- Name: product_changes_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_changes_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_changes_log_id_seq OWNER TO postgres;

--
-- TOC entry 4820 (class 0 OID 0)
-- Dependencies: 219
-- Name: product_changes_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_changes_log_id_seq OWNED BY public.product_changes_log.id;


--
-- TOC entry 218 (class 1259 OID 16413)
-- Name: sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales (
    id integer NOT NULL,
    date date DEFAULT CURRENT_DATE,
    url character varying(255),
    sales integer
);


ALTER TABLE public.sales OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16412)
-- Name: sales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sales_id_seq OWNER TO postgres;

--
-- TOC entry 4821 (class 0 OID 0)
-- Dependencies: 217
-- Name: sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_id_seq OWNED BY public.sales.id;


--
-- TOC entry 216 (class 1259 OID 16400)
-- Name: shopify_track; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shopify_track (
    id uuid,
    shopifyid bigint NOT NULL,
    variantid bigint NOT NULL,
    host character varying(255),
    sku character varying(255),
    collection1 character varying(255),
    collection2 character varying(255),
    collection3 character varying(255),
    collection4 character varying(255),
    collection5 character varying(255),
    tags text,
    producttitle character varying(255),
    varianttitle character varying(255),
    price numeric(21,2),
    compareatprice numeric(21,2),
    instock boolean,
    producturl text,
    imageurl text,
    description text,
    descriptionnohtml text,
    updatedat timestamp without time zone
);


ALTER TABLE public.shopify_track OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 192070)
-- Name: shopify_track_new; Type: TABLE; Schema: stg; Owner: postgres
--

CREATE TABLE stg.shopify_track_new (
    id character varying(100),
    shopifyid bigint NOT NULL,
    variantid bigint NOT NULL,
    host character varying(255),
    sku character varying(255),
    collection1 character varying(255),
    collection2 character varying(255),
    collection3 character varying(255),
    collection4 character varying(255),
    collection5 character varying(255),
    tags text,
    producttitle character varying(255),
    varianttitle character varying(255),
    price numeric(21,2),
    compareatprice numeric(21,2),
    instock boolean,
    producturl text,
    imageurl text,
    description text,
    descriptionnohtml text,
    updatedat timestamp without time zone
);


ALTER TABLE stg.shopify_track_new OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 192076)
-- Name: shopify_track_old; Type: TABLE; Schema: stg; Owner: postgres
--

CREATE TABLE stg.shopify_track_old (
    id character varying(100),
    shopifyid bigint NOT NULL,
    variantid bigint NOT NULL,
    host character varying(255),
    sku character varying(255),
    collection1 character varying(255),
    collection2 character varying(255),
    collection3 character varying(255),
    collection4 character varying(255),
    collection5 character varying(255),
    tags text,
    producttitle character varying(255),
    varianttitle character varying(255),
    price numeric(21,2),
    compareatprice numeric(21,2),
    instock boolean,
    producturl text,
    imageurl text,
    description text,
    descriptionnohtml text,
    updatedat timestamp without time zone
);


ALTER TABLE stg.shopify_track_old OWNER TO postgres;

--
-- TOC entry 4657 (class 2604 OID 16429)
-- Name: product_changes_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_changes_log ALTER COLUMN id SET DEFAULT nextval('public.product_changes_log_id_seq'::regclass);


--
-- TOC entry 4655 (class 2604 OID 16416)
-- Name: sales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales ALTER COLUMN id SET DEFAULT nextval('public.sales_id_seq'::regclass);


--
-- TOC entry 4666 (class 2606 OID 16435)
-- Name: product_changes_log product_changes_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_changes_log
    ADD CONSTRAINT product_changes_log_pkey PRIMARY KEY (id);


--
-- TOC entry 4662 (class 2606 OID 16419)
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);


--
-- TOC entry 4664 (class 2606 OID 16421)
-- Name: sales sales_unique_url_date; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_unique_url_date UNIQUE (url, date);


--
-- TOC entry 4660 (class 1259 OID 16405)
-- Name: shopify_track_host_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shopify_track_host_idx ON public.shopify_track USING btree (host, shopifyid, variantid);


--
-- TOC entry 4667 (class 1259 OID 192075)
-- Name: stg_shopify_track_new_host_idx; Type: INDEX; Schema: stg; Owner: postgres
--

CREATE INDEX stg_shopify_track_new_host_idx ON stg.shopify_track_new USING btree (host, shopifyid, variantid);


--
-- TOC entry 4668 (class 1259 OID 192081)
-- Name: stg_shopify_track_old_host_idx; Type: INDEX; Schema: stg; Owner: postgres
--

CREATE INDEX stg_shopify_track_old_host_idx ON stg.shopify_track_old USING btree (host, shopifyid, variantid);


--
-- TOC entry 4669 (class 2620 OID 110085)
-- Name: shopify_track after_shopify_track_delete; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER after_shopify_track_delete AFTER DELETE ON public.shopify_track FOR EACH ROW EXECUTE FUNCTION public.shopify_track_delete_trigger();


--
-- TOC entry 4670 (class 2620 OID 69311)
-- Name: shopify_track after_shopify_track_insert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER after_shopify_track_insert AFTER INSERT ON public.shopify_track FOR EACH ROW EXECUTE FUNCTION public.shopify_track_insert_trigger();


--
-- TOC entry 4671 (class 2620 OID 110083)
-- Name: shopify_track after_shopify_track_update; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER after_shopify_track_update AFTER UPDATE ON public.shopify_track FOR EACH ROW EXECUTE FUNCTION public.shopify_track_update_trigger();


-- Completed on 2024-04-03 23:44:08

--
-- PostgreSQL database dump complete
--

