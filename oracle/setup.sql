-- ============================================
-- Oracle 23ai CDC Setup Script
-- ============================================

-- Step 1: Enable GoldenGate Replication
ALTER SYSTEM SET enable_goldengate_replication=TRUE SCOPE=BOTH;

-- Step 2: Enable Supplemental Logging
ALTER DATABASE ADD SUPPLEMENTAL LOG DATA;

-- Step 3: Create XStream Admin User
CREATE USER c##xstrmadmin IDENTIFIED BY xstrmadmin
DEFAULT TABLESPACE users
QUOTA UNLIMITED ON users
CONTAINER=ALL;

-- Step 4: Grant Permissions (Oracle 23ai way)
GRANT DBA TO c##xstrmadmin CONTAINER=ALL;
GRANT XSTREAM_CAPTURE TO c##xstrmadmin CONTAINER=ALL;
GRANT CONNECT, RESOURCE TO c##xstrmadmin CONTAINER=ALL;

-- Step 5: Auto-update UPDATED_AT on row changes
-- This ensures QueryDatabaseTable with Maximum-value Columns
-- picks up UPDATE operations, not just INSERTs.
CREATE OR REPLACE TRIGGER trg_employees_updated_at
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    :NEW.updated_at := CURRENT_TIMESTAMP;
END;
/

