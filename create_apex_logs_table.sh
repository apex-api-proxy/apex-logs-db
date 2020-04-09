#!/bin/bash

psql --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE TABLE apex_logs (
      "timestamp" timestamp with time zone NOT NULL,
      correlation_id character varying(40),
      headers text,
      body character varying,
      status_code integer,
      method character varying(15),
      host text,
      port integer,
      path text,
      CONSTRAINT valid_status_code CHECK (((status_code > 99) AND (status_code < 600)))
    );

    SELECT create_hypertable('apex_logs', 'timestamp');
EOSQL
