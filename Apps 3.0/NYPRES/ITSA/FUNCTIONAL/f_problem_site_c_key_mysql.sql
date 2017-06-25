SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_location.site_c_key' ELSE 'SUCCESS' END as Message
 FROM nypres_mdsdb.problem_final SRC 
 join nypres_mdwdb.f_problem trgt on SRC.sys_id=trgt.row_id and SRC.sourceinstance=trgt.source_id
 LEFT JOIN nypres_mdwdb.d_location LKP 
 ON ( SRC.u_site_location= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_site_location IS NULL THEN 0 else -1 end)<> (trgt.site_location_c_key)
 
 