-- ============================================
-- NiFi: Oracle-side row count query
-- ============================================
-- Use this in a NiFi ExecuteSQL processor connected
-- to your Oracle JDBC connection pool.
-- Schedule it to run every 5 minutes.
--
-- Route the output to a PutSQL processor that runs
-- update_oracle_count.sql against Snowflake.

SELECT COUNT(*) AS ORACLE_ROW_COUNT FROM SYS.EMPLOYEES;
