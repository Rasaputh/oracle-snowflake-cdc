-- ============================================
-- Sample Data for CDC Testing
-- ============================================

-- Create employees table
CREATE TABLE employees (
  emp_id     NUMBER PRIMARY KEY,
  emp_name   VARCHAR2(100),
  dept       VARCHAR2(50),
  salary     NUMBER,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO employees VALUES (1, 'Alice Johnson', 'Engineering', 95000, CURRENT_TIMESTAMP);
INSERT INTO employees VALUES (2, 'Bob Smith', 'Marketing', 75000, CURRENT_TIMESTAMP);
INSERT INTO employees VALUES (3, 'Carol White', 'Finance', 85000, CURRENT_TIMESTAMP);
COMMIT;

