SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_customer_service_c.ca_standards_c_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM tjx_mdsdb.problem_final SRC
LEFT JOIN tjx_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%GPS_REPORTING_GROUP~PROBLEM%' and 
( concat('GPS_REPORTING_GROUP~PROBLEM~~~',UPPER(SRC.u_gps_reporting_group))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id ) 
 LEFT JOIN tjx_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_gps_reporting_group IS NULL THEN 0 else -1 end)<> (TRGT.gps_reporting_group_c_key))temp;


