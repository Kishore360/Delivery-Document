

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_asc_c.location_key' ELSE 'SUCCESS' END as Message
 FROM asu_mdsdb.hr_case_final SRC 
 LEFT JOIN asu_mdwdb.f_hr_case_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN asu_mdwdb.d_location LKP 
 ON ( SRC.location= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.location IS NULL THEN 0 else -1 end)<> (TRGT.location_key)



 