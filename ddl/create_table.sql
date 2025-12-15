BEGIN
  EXECUTE IMMEDIATE '
    CREATE TABLE employees (
      emp_id NUMBER PRIMARY KEY,
      emp_name VARCHAR2(50),
      created_at DATE DEFAULT SYSDATE
    )
  ';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE = -955 THEN
      NULL; -- table already exists
    ELSE
      RAISE;
    END IF;
END;
/

