SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM truist_mdsdb.cmdb_ci_outage_final SRC 
 LEFT JOIN truist_mdwdb.d_outage TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE CONVERT_TZ(SRC.begin,'GMT','America/Los_Angeles')<>TRGT.start_on
 and SRC.CDCTYPE  <>'D'