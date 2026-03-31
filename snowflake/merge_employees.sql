-- ============================================
-- MERGE statement for NiFi CDC pipeline
-- ============================================
-- Use this in a NiFi PutSQL or ExecuteSQL processor
-- instead of plain INSERT to prevent duplicates.
--
-- NiFi should substitute ?, ?, ?, ?, ? with the
-- values from the CDC FlowFile attributes/content.
-- Map parameters in order: EMP_ID, EMP_NAME, DEPT, SALARY, UPDATED_AT

MERGE INTO CDC_DEMO.ORACLE_DATA.EMPLOYEES AS tgt
USING (
    SELECT
        ?::NUMBER         AS EMP_ID,
        ?::VARCHAR(100)   AS EMP_NAME,
        ?::VARCHAR(50)    AS DEPT,
        ?::NUMBER         AS SALARY,
        ?::TIMESTAMP_NTZ  AS UPDATED_AT
) AS src
ON tgt.EMP_ID = src.EMP_ID
WHEN MATCHED THEN UPDATE SET
    tgt.EMP_NAME    = src.EMP_NAME,
    tgt.DEPT        = src.DEPT,
    tgt.SALARY      = src.SALARY,
    tgt.UPDATED_AT  = src.UPDATED_AT
WHEN NOT MATCHED THEN INSERT (EMP_ID, EMP_NAME, DEPT, SALARY, UPDATED_AT)
    VALUES (src.EMP_ID, src.EMP_NAME, src.DEPT, src.SALARY, src.UPDATED_AT);
