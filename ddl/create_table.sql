BEGIN
   EXECUTE IMMEDIATE '
     CREATE TABLE employees (
       emp_id NUMBER PRIMARY KEY,
       emp_name VARCHAR2(100),
       salary NUMBER,
       created_date DATE DEFAULT SYSDATE
     )
   ';
EXCEPTION
   WHEN OTHERS THEN
     IF SQLCODE = -955 THEN
        NULL; -- table already exists, ignore
     ELSE
        RAISE;
     END IF;
END;
/

