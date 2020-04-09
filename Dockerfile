FROM timescale/timescaledb:latest-pg10

COPY create_apex_logs_table.sh /docker-entrypoint-initdb.d
