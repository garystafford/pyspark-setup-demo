DROP TABLE IF EXISTS "bakery_basket";
DROP SEQUENCE IF EXISTS bakery_basket_id_seq;
CREATE SEQUENCE bakery_basket_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."bakery_basket"
(
    "id"          integer DEFAULT nextval('bakery_basket_id_seq') NOT NULL,
    "date"        character varying(10)                           NOT NULL,
    "time"        character varying(8)                            NOT NULL,
    "transaction" integer                                         NOT NULL,
    "item"        character varying(50)                           NOT NULL
) WITH (oids = false);