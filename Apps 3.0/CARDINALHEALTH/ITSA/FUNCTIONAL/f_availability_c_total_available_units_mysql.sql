 SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN COUNT(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
 FROM cardinalhealth_mdsdb.cmdb_ci_application_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.f_availability_c TRGT 
 ON (SRC.sys_id = SUBSTRING(TRGT.row_id,1,32) 
 AND SRC.sourceinstance= TRGT.source_id )
 WHERE coalesce(SRC.u_cah_available_unit) <> (TRGT.total_available_units);
 
 
 
