DROP TABLE IF EXISTS "transactions";
DROP SEQUENCE IF EXISTS transactions_id_seq;
CREATE SEQUENCE transactions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."transactions"
(
    "id"          integer DEFAULT nextval('transactions_id_seq')  NOT NULL,
    "date"        character varying(10)                           NOT NULL,
    "time"        character varying(8)                            NOT NULL,
    "transaction" integer                                         NOT NULL,
    "item"        character varying(50)                           NOT NULL
) WITH (oids = false);
