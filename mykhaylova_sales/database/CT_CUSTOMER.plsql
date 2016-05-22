create or replace 
PROCEDURE PROC_CT_CUSTOMER IS
  v_tabcnt number;
BEGIN
  SELECT count(*) INTO v_tabcnt
  FROM   ALL_TABLES
  WHERE  TABLE_NAME = 'CUSTOMER' and
         OWNER = USER;
         
  IF v_tabcnt = 0 THEN
    EXECUTE IMMEDIATE 'create table customer 
                      (	
                        customer_id integer,
                        first_name varchar2(20),
                        credit decimal(10,2),                        	
                        CONSTRAINT CUSTOMER_PK RIMARY KEY (customer_id)
                       )';
    COMMIT;
  END IF;
END PROC_CT_CUSTOMER;