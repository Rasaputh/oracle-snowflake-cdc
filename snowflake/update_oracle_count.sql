-- ============================================
-- NiFi: Update the most recent audit row with Oracle count
-- ============================================
-- Use this in a NiFi PutSQL processor connected to
-- your Snowflake JDBC connection pool.
--
-- Bind parameter ? = ORACLE_ROW_COUNT from the upstream
-- ExecuteSQL processor that queried Oracle.

UPDATE CDC_DEMO.ORACLE_DATA.CDC_ROW_COUNT_AUDIT
SET
    ORACLE_COUNT = ?,
    COUNT_MATCH  = (? = SNOWFLAKE_COUNT)
WHERE CHECK_TIME = (
    SELECT MAX(CHECK_TIME)
    FROM CDC_DEMO.ORACLE_DATA.CDC_ROW_COUNT_AUDIT
);
