-- Adminer 4.6.3 PostgreSQL dump

-- \connect "demo";

DROP TABLE IF EXISTS "bakery_basket";
DROP SEQUENCE IF EXISTS bakery_basket_id_seq;
CREATE SEQUENCE bakery_basket_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."bakery_basket" (
    "id" integer DEFAULT nextval('bakery_basket_id_seq') NOT NULL,
    "date" character varying(10) NOT NULL,
    "time" character varying(8) NOT NULL,
    "transaction" integer NOT NULL,
    "item" character varying(50) NOT NULL
) WITH (oids = false);

INSERT INTO "bakery_basket" ("date", "time", "transaction", "item", "id") VALUES
('2016-10-30',	'09:58:11',	1,	'Bread',	1),
('2016-10-30',	'10:05:34',	2,	'Scandinavian',	2),
('2016-10-30',	'10:07:57',	3,	'Hot chocolate',	3);

-- 2018-11-11 01:56:22.445205+00
