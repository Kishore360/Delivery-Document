SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM nbcu_mdsdb.incident_final SRC 
<<<<<<< HEAD
  /*JOIN nbcu_mdwdb.d_lov LKP 
  ON COALESCE( CONCAT('CONTACT_TYPE_C','~','INCIDENT','~','~','~',upper(SRC.contact_type)),'UNSPECIFIED') =LKP.row_id  AND SRC.sourceinstance= LKP.source_id*/
  JOIN nbcu_mdwdb.f_incident TRGT 
  ON (SRC.sys_id=TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id )
  where TRGT.contact_type_src_code_c <> SRC.contact_type 
  
  
=======
JOIN nbcu_mdwdb.f_incident TRGT 
  ON (SRC.sys_id=TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id )
  where TRGT.contact_type_src_code_c <>SRC.contact_type
>>>>>>> 09cb2b799c2c24fd808a01b0114af78ce432499f