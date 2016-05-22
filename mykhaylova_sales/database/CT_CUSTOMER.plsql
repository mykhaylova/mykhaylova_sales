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
                        CONSTRAINT CUSTOMER_PK PRIMARY KEY (customer_id)
                       )';
    COMMIT;
  END IF;
  
  SELECT count(*) into v_tabcnt
  FROM   ALL_SEQUENCES
  WHERE  SEQUENCE_NAME = 'SEQ_CUSTOMER_ID' and
         SEQUENCE_OWNER = USER;

  if v_tabcnt = 0 then
    EXECUTE IMMEDIATE 'CREATE SEQUENCE SEQ_CUSTOMER_ID
                          START WITH 100000
                          INCREMENT BY 1
                          CACHE 20';
    COMMIT;
  end if;  
  
END PROC_CT_CUSTOMER;