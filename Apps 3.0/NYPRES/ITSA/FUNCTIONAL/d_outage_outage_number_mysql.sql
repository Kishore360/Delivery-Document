 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage_c.outage_record_c_key' ELSE 'SUCCESS' END as Message
 FROM nypres_mdsdb.cmdb_ci_outage_final SRC 
 JOIN nypres_mdwdb.d_outage TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 where u_number<>outage_number
 
 