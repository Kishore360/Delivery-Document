 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage_c.outage_src_c_key' ELSE 'SUCCESS' END as Message
FROM nypres_mdsdb.incident_final SRC 
  JOIN nypres_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 JOIN nypres_mdwdb.d_outage	 LKP 
<<<<<<< HEAD
 ON ( (u_outage_record))= LKP.row_id
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_outage_record IS NULL THEN 0 else -1 end)=COALESCE(TRGT.outage_record_c_key)  ;
=======
 ON ( SRC.u_outage_record)= LKP.row_id  and SRC.sourceinstance = LKP.source_id
join nypres_mdwdb.d_incident d on (SRC.sys_id =d.row_id  
 AND SRC.sourceinstance= d.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_outage_record IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.outage_record_c_key)  ;
>>>>>>> 3ded16147d743454e724a6bb71e928bf2028d39b
