-- ============================================
-- Snowflake Target Table for Oracle CDC
-- ============================================
-- EMP_ID is the primary key used by the MERGE
-- statement to prevent duplicate inserts.

CREATE TABLE IF NOT EXISTS CDC_DEMO.ORACLE_DATA.EMPLOYEES (
    EMP_ID     NUMBER(38,0) NOT NULL PRIMARY KEY,
    EMP_NAME   VARCHAR(100),
    DEPT       VARCHAR(50),
    SALARY     NUMBER(38,0),
    UPDATED_AT TIMESTAMP_NTZ(9)
);
